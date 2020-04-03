%% Experiment 1.

epsilon = 5e-4;
Vdd = 5;

Exp1.Isat1 = fliplr(importdata("Isat1.txt"));
Exp1.Isat2 = fliplr(importdata("Isat2.txt"));
Exp1.Isat3 = fliplr(importdata("Isat3.txt"));
Exp1.Isat4 = fliplr(importdata("Isat4.txt"));
Exp1.Vd = fliplr(importdata("Vd.txt"));
Exp1.Vg = fliplr(importdata("Vg1.txt"));

[Exp1.Isat1_Is, Exp1.Isat1_VT, Exp1.Isat1_kappa] = ekvfit(Exp1.Vg, Exp1.Isat1, epsilon);
[Exp1.Isat2_Is, Exp1.Isat2_VT, Exp1.Isat2_kappa] = ekvfit(Exp1.Vg, Exp1.Isat2, epsilon);
[Exp1.Isat3_Is, Exp1.Isat3_VT, Exp1.Isat3_kappa] = ekvfit(Exp1.Vg, Exp1.Isat3, epsilon);
[Exp1.Isat4_Is, Exp1.Isat4_VT, Exp1.Isat4_kappa] = ekvfit(Exp1.Vg, Exp1.Isat4, epsilon);

Exp1.Isat1_theo = Exp1.Isat1_Is .* (log(1 + exp(Exp1.Isat1_kappa*(Exp1.Vg - Exp1.Isat1_VT)/(2*0.0258)))).^2;
Exp1.Isat2_theo = Exp1.Isat2_Is .* (log(1 + exp(Exp1.Isat2_kappa*(Exp1.Vg - Exp1.Isat2_VT)/(2*0.0258)))).^2;
Exp1.Isat3_theo = Exp1.Isat3_Is .* (log(1 + exp(Exp1.Isat3_kappa*(Exp1.Vg - Exp1.Isat3_VT)/(2*0.0258)))).^2;
Exp1.Isat4_theo = Exp1.Isat4_Is .* (log(1 + exp(Exp1.Isat4_kappa*(Exp1.Vg - Exp1.Isat4_VT)/(2*0.0258)))).^2;

figure
semilogy(Exp1.Vg,Exp1.Isat1,'k.')
hold on
semilogy(Exp1.Vg,Exp1.Isat1_theo,'k')
semilogy(Exp1.Vg,Exp1.Isat2,'b.')
semilogy(Exp1.Vg,Exp1.Isat2_theo,'b')
semilogy(Exp1.Vg,Exp1.Isat3,'g.')
semilogy(Exp1.Vg,Exp1.Isat3_theo,'g')
semilogy(Exp1.Vg,Exp1.Isat4,'r.')
semilogy(Exp1.Vg,Exp1.Isat4_theo,'r')
title('Current-Gate Voltage Characteristics for NMOS Transistors')
xlabel('Gate Votlage [V]')
ylabel('Channel Current [A]')
legend('Simulated for Q1','Theoretical EKV Fit for Q1','Simulated for Q2','Theoretical EKV Fit for Q2',...
    'Simulated for Q3','Theoretical EKV Fit for Q3','Simulated for Q4','Theoretical EKV Fit for Q4',...
    'Location','Southeast')
hold off
%%
% Mean error plot

Exp1.Isatm = (Exp1.Isat1 + Exp1.Isat2 + Exp1.Isat3 + Exp1.Isat4)./4;
Exp1.Isat1d = 100*abs(Exp1.Isat1 - Exp1.Isatm)./Exp1.Isat1;
Exp1.Isat2d = 100*abs(Exp1.Isat2 - Exp1.Isatm)./Exp1.Isat2;
Exp1.Isat3d = 100*abs(Exp1.Isat3 - Exp1.Isatm)./Exp1.Isat3;
Exp1.Isat4d = 100*abs(Exp1.Isat4 - Exp1.Isatm)./Exp1.Isat4;

figure
semilogx(Exp1.Isatm,Exp1.Isat1d,'k.')
hold on
semilogx(Exp1.Isatm,Exp1.Isat2d,'b.')
semilogx(Exp1.Isatm,Exp1.Isat3d,'g.')
semilogx(Exp1.Isatm,Exp1.Isat4d,'r.')
title('Deviation from Mean Saturation Current for NMOS Transistors')
xlabel('Mean Channel Current [A]')
ylabel('Percentage Deviation [%]')
legend('Percentage Deviation for Q1','Percentage Deviation for Q2','Percentage Deviation for Q3',...
    'Percentage Deviation for Q4','Location','Northeast')
hold off

%% Experiment 2.

Exp2.Iohmic = importdata("Iohmic.txt");
Exp2.Iohmic_par = importdata("Iohmic_par.txt");
Exp2.Iohmic_ser = importdata("Iohmic_ser.txt");
Exp2.Isat = importdata("Isat.txt");
Exp2.Isat_par = importdata("Isat_par.txt");
Exp2.Isat_ser = importdata("Isat_ser.txt");
Exp2.Vd_ohmic = importdata("Vd_ohmic.txt");
Exp2.Vd_sat = importdata("Vd_sat.txt");
Exp2.Vg = importdata("Vg2.txt");

figure
semilogy(Exp2.Vg, Exp2.Iohmic, 'b.')
hold on
semilogy(Exp2.Vg, Exp2.Iohmic_par, 'k.')
semilogy(Exp2.Vg, Exp2.Iohmic_ser, 'r.')
semilogy(Exp2.Vg, Exp2.Isat, 'g.')
semilogy(Exp2.Vg, Exp2.Isat_par, 'c.')
semilogy(Exp2.Vg, Exp2.Isat_ser, 'm.')
title('Current-Voltage Characteristics for Different Configurations')
xlabel('Gate Voltage [V]')
ylabel('Channel Current [A]')
legend('Individual Transistor, V_{DS} = 10mV','Parallel Connection, V_{DS} = 10mV',...
    'Series Connection, V_{DS} = 10mV','Indivdual Transistor, V_{DS} = V_{dd}',...
    'Parallel Connection, V_{DS} = V_{dd}','Series Connection, V_{DS} = V_{dd}','Location','Southeast')
hold off

% Plotting the ratio
Exp2.Iohmic_par_ind_ratio = Exp2.Iohmic_par./Exp2.Iohmic;
Exp2.Iohmic_ser_ind_ratio = Exp2.Iohmic_ser./Exp2.Iohmic;
Exp2.Isat_par_ind_ratio = Exp2.Isat_par./Exp2.Isat;
Exp2.Isat_ser_ind_ratio = Exp2.Isat_ser./Exp2.Isat;

figure
semilogy(Exp2.Vg, Exp2.Iohmic_par_ind_ratio, 'b.')
hold on
semilogy(Exp2.Vg, Exp2.Isat_par_ind_ratio, 'r.')
title('Ratio of Measurements from Parallel Connection to Individual Transistor')
xlabel('Gate Voltage [V]')
ylabel('Ratio')
legend('V_{DS} = 10mV','V_{DS} = 5V','Location','Southeast')
hold off

figure
semilogy(Exp2.Vg, Exp2.Iohmic_ser_ind_ratio, 'b.')
hold on
semilogy(Exp2.Vg, Exp2.Isat_ser_ind_ratio, 'r.')
title('Ratio of Measurements from Series Connection to Individual Transistor')
xlabel('Gate Voltage [V]')
ylabel('Ratio')
legend('V_{DS} = 10mV','V_{DS} = 5V','Location','Northeast')
hold off

%% Experiment 3
% Current Sink
exp3_a.data = load('Experiment3_circuit_a.txt');
exp3_a.I_in = exp3_a.data(:,1);
exp3_a.Q1_drain = exp3_a.data(:,2);
exp3_a.Q2_drain = exp3_a.data(:,3);

% Q1 Current Fit
I_in = exp3_a.I_in(2:end);
Q1_drain_fit = polyfit(log(exp3_a.I_in(2:end-20)),log(exp3_a.Q1_drain(2:end-20)),1);
Q1_drain_line = exp((Q1_drain_fit(1))*log(I_in) + ((Q1_drain_fit(2))));
Q1_drain_slope = (Q1_drain_line(70)-Q1_drain_line(20))/(I_in(70)-I_in(20));
Q1_drain_intercept = exp(Q1_drain_fit(2));

% Q2 Current Fit
Q2_drain_fit = polyfit(log(exp3_a.I_in(2:end-20)),log(exp3_a.Q2_drain(2:end-20)),1);
Q2_drain_line = exp((Q2_drain_fit(1))*log(I_in) + ((Q2_drain_fit(2))));
Q2_drain_slope = (Q2_drain_line(70)-Q2_drain_line(20))/(I_in(70)-I_in(20));
Q2_drain_intercept = exp(Q2_drain_fit(2));

figure
loglog(I_in,Q1_drain_line, 'r')
hold on
loglog(exp3_a.I_in,exp3_a.Q1_drain,'k.', 'MarkerSize',12)
loglog(I_in,Q2_drain_line, 'g')
loglog(exp3_a.I_in,exp3_a.Q2_drain,'b.', 'MarkerSize',12)

title('Current Divider Current Sink')
xlabel('I_{in} [A]')
ylabel('I_{out} [A]')
legend('U1 Line of Best Fit (Slope = 0.6326)','U1 Experimental Drain',...
    'U2 Line of Best Fit (Slope = 0.3676)','U2 Experimental Drain',...
    'Location','Southeast')
hold off

% Current Source
exp3_b.data = load('Experiment3_circuit_b.txt');
exp3_b.I_in = exp3_b.data(:,1);
exp3_b.I_out1 = exp3_b.data(:,2);
exp3_b.I_out2 = exp3_b.data(:,3);

% Iout1 Current Fit
I_in = exp3_b.I_in(2:end);
I_out1_fit = polyfit(log(exp3_b.I_in(2:end-30)),log(exp3_b.I_out1(2:end-30)),1);
I_out1_line = exp((I_out1_fit(1))*log(I_in) + ((I_out1_fit(2))));
I_out1_slope = (I_out1_line(70)-I_out1_line(20))/(I_in(70)-I_in(20));
I_out1_intercept = exp(I_out1_fit(2));

% Iout2 Current Fit
I_out2_fit = polyfit(log(exp3_b.I_in(2:end-30)),log(exp3_b.I_out2(2:end-30)),1);
I_out2_line = exp((I_out2_fit(1))*log(I_in) + ((I_out2_fit(2))));
I_out2_slope = (I_out2_line(70)-I_out2_line(20))/(I_in(70)-I_in(20));
I_out2_intercept = exp(I_out2_fit(2));

figure
loglog(I_in,I_out1_line, 'r')
hold on
loglog(exp3_b.I_in,exp3_b.I_out1,'k.', 'MarkerSize',12)
loglog(I_in,I_out2_line, 'g')
loglog(exp3_b.I_in,exp3_b.I_out2,'b.', 'MarkerSize',12)
title('Current Divider Current Source')
xlabel('I_{in} [A]')
ylabel('I_{out} [A]')
legend('I_{out1} Line of Best Fit (Slope = 0.6443)','I_{out1} Experimental Data',...
    'I_{out2} Line of Best Fit (Slope = 0.3558)','I_{out2} Experimental Data',...
    'Location','Southeast')
hold off
