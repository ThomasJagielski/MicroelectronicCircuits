%% Experiement 1
V_in = load('Experiment 1 Supply V.mat');
V_in.I_d = fliplr(V_in.I_d);
V_in.V_in = fliplr(V_in.V_in);

I_in = load('Experiment 1 Supply I.mat');
I_in.I_in = fliplr(I_in.I_in);
I_in.V_d = fliplr(I_in.V_d);

%x = linspace(min(I_in.V_d),max(I_in.V_d),1000);
x = I_in.V_d;
fit = polyfit(I_in.V_d,log(I_in.I_in),1);
line = exp(fit(1) * x + fit(2));

%U_T = (0.026);
U_T = 1/(fit(1));
I_s = exp(fit(2));
theoretical = I_s * exp(x/U_T);

figure
semilogy(I_in.V_d,I_in.I_in,'b*')
hold on
semilogy(V_in.V_in,V_in.I_d,'r*')
semilogy(x,line,'g-','LineWidth',1.5)
title('Experimental I-V Characteristic of a Diode')
xlabel('Voltage [V]')
ylabel('Current [A]')
legend('Supply Current Measure Voltage','Supply Voltage Measure Current','Line of Best Fit (Supply Current Measure Voltage)','Location','Southeast')
grid on
hold off
% Offset in op-amp circuitry causes the variation between the supply
% voltage and the supply current.  The result is a very small current (negative)
% that is effectively zero when supplying voltage.  If you add an offset
% equivalent to making the largest negative value positive to all of them,
% they should line up.

figure
semilogy(I_in.V_d,I_in.I_in,'b*')
hold on
semilogy(V_in.V_in,V_in.I_d,'r*')
semilogy(x,theoretical,'g-','LineWidth',1.5)
title('Theoretical I-V Characteristic of a Diode')
xlabel('Voltage [V]')
ylabel('Current [A]')
legend('Supply Current Measure Voltage','Supply Voltage Measure Current','Theoretical I-V Characteristics','Location','Southeast')
grid on
hold off

% Theoretical Values

R_d = diff(I_in.V_d)./diff(I_in.I_in);
%I = logspace(-9,-2,1000);
I = I_in.I_in(2:end);
Theoretical_R_d = U_T ./ I;

figure
loglog(I_in.I_in(2:end),R_d,'*')
hold on
loglog(I, Theoretical_R_d,'LineWidth',1.5)
title('Incremental Resistance of Diode')
xlabel('Current In [A]')
ylabel('Incemental Resistance [\Omega]')
legend('Experimental Incremental Resistance','Theretical Incremental Resistance','Location','Northeast')
grid on
hold off



%% Experiment 2
% 200 Ohm Resistor
R_200 = load('Experiment 2 - 200 - USE.mat');
R_200.I_in = fliplr(R_200.I_in);
R_200.V_diode = fliplr(R_200.V_diode);
R_200.V_in = fliplr(R_200.V_in);

% 2k Ohm resistor
R_2k = load('Experiment 2 - 2k - USE.mat');
R_2k.I_in = fliplr(R_2k.I_in);
R_2k.V_diode = fliplr(R_2k.V_diode);
R_2k.V_in = fliplr(R_2k.V_in);

% 20k Ohm resistor
R_20k = load('Experiment 2 - 20k - USE.mat');
R_20k.I_in = fliplr(R_20k.I_in);
R_20k.V_diode = fliplr(R_20k.V_diode);
R_20k.V_in = fliplr(R_20k.V_in);

V_diode_200 = U_T*log(R_200.I_in/I_s);
V_diode_2k  = U_T*log(R_2k.I_in/I_s);
V_diode_20k = U_T*log(R_20k.I_in/I_s);

% Current Through Circuit
% SHIFTED OVER TO ACCOUNT FOR DIFFERENCE %% ADD THE I_ON
I_200 = ((R_200.V_in-0.6) - U_T)./200;
I_2k = ((R_2k.V_in-0.6) - U_T)./2000;
I_20k = ((R_20k.V_in-0.6) - U_T)./20000;

% Delete the initial Points
figure
plot(R_200.V_in,R_200.V_diode,'*')
hold on
plot(R_200.V_in(13:end),abs(V_diode_200(13:end)))
plot(R_2k.V_in,R_2k.V_diode,'*')
plot(R_2k.V_in(13:end),abs(V_diode_2k(13:end)))
plot(R_20k.V_in,R_20k.V_diode,'*')
plot(R_20k.V_in(13:end),abs(V_diode_20k(13:end)))
xlabel('V_{in} [V]')
ylabel('Voltage Across Diode [V]')
title('Voltage Across Diode as Input Voltage Varies')
legend('200 \Omega Experimental','200 \Omega Theoretical','2 k\Omega Experimental','2 k\Omega Theoretical','20 k\Omega Experimental','20 k\Omega Theoretical','Location','Southeast')
grid on
hold off

figure
semilogy(R_200.V_in,R_200.I_in,'*')
hold on
semilogy(R_200.V_in(21:end),I_200(21:end))
semilogy(R_2k.V_in,R_2k.I_in,'*')
semilogy(R_2k.V_in(21:end),I_2k(21:end))
semilogy(R_20k.V_in,R_20k.I_in,'*')
semilogy(R_20k.V_in(21:end),I_20k(21:end))
xlabel('V_{in} [V]')
ylabel('I_{in} [A]')
title('Current Through Circuit as Input Voltage Varies')
legend('200 \Omega Experimental','200 \Omega Theoretical','2 k\Omega Experimental','2 k\Omega Theoretical','20 k\Omega Experimental','20 k\Omega Theoretical','Location','Southeast')
grid on
hold off

figure
plot(R_200.V_in,R_200.I_in,'*')
hold on
plot(R_200.V_in(21:end),I_200(21:end))
xlabel('V_{in} [V]')
ylabel('I_{in} [A]')
title('Current Through Circuit as Input Voltage Varies with R = 200 \Omega')
legend('200 \Omega Experimental','200 \Omega Theoretical','20 k\Omega Theoretical','Location','Northwest')
grid on
hold off

figure
plot(R_2k.V_in,R_2k.I_in,'*')
hold on
plot(R_2k.V_in(21:end),I_2k(21:end))
xlabel('V_{in} [V]')
ylabel('I_{in} [A]')
title('Current Through Circuit as Input Voltage Varies with R = 2 k\Omega')
legend('2 k\Omega Experimental','2 k\Omega Theoretical','Location','Northwest')
grid on
hold off

figure
plot(R_20k.V_in,R_20k.I_in,'*')
hold on
plot(R_20k.V_in(21:end),I_20k(21:end))
xlabel('V_{in} [V]')
ylabel('I_{in} [A]')
title('Current Through Circuit as Input Voltage Varies with R = 20 k\Omega')
legend('20 k\Omega Experimental','20 k\Omega Theoretical','Location','Northwest')
grid on
hold off

% I_on
I_on_200 = U_T/200;
I_on_2k = U_T/2000;
I_on_20k = U_T/20000;

R = linspace(0,50000,500);
I_on = U_T./R;

figure
loglog(R,I_on)
hold on
plot(200,I_on_200,'*')
plot(2000,I_on_2k,'*')
plot(20000,I_on_20k,'*')
xlabel('R [\Omega]')
ylabel('I_{on} [A]')
title('I_{on} with Respect to R')
legend('Theoretical I_{on} with U_t = 26 mV','200 \Omega','2 k\Omega','20 k\Omega','Location','Northeast')
grid on
hold off

% V_on
R = linspace(0,50000,500);
%I_on = U_T./R;
V_on = U_T*log((U_T./R)/I_s);
%V_on = U_T*log(I_on./I_s);

V_on_200 = U_T*log(I_on_200/I_s);
V_on_2k = U_T*log(I_on_2k/I_s);
V_on_20k = U_T*log(I_on_20k/I_s);

figure
loglog(R,V_on)
hold on
loglog(200,V_on_200,'*')
loglog(2000,V_on_2k,'*')
loglog(20000,V_on_20k,'*')
xlabel('R [\Omega]')
ylabel('V_{on} [V]')
title('V_{on} with Respect to R')
legend('Theoretical V_{on} with U_t = 26 mV','200 \Omega','2 k\Omega','20 k\Omega','Location','Northeast')
grid on
hold off
