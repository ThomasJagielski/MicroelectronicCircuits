%% Experiment 1
epsilon = 5e-4;
Vdd = 5;
% NMOS TRANSISTOR
[ex1_nmos.Vin,ex1_nmos.I] = importSimulationData('Experiment1_nmos.txt', [1, Inf]);
ex1_nmos.Vin_adj = ex1_nmos.Vin([1:110,115:5:end]);
ex1_nmos.I_adj = ex1_nmos.I([1:110,115:5:end]);
[ex1_nmos.Is, ex1_nmos.VT, ex1_nmos.kappa] = ekvfit(ex1_nmos.Vin_adj, ex1_nmos.I_adj, epsilon);

% MAKE PLOT OF EKV FIT
ex1_nmos.I_theo = ex1_nmos.Is * (log(1 + exp(ex1_nmos.kappa*(ex1_nmos.Vin - ex1_nmos.VT)/(2*0.0258)))).^2;
figure
semilogy(ex1_nmos.Vin,ex1_nmos.I,'.')
hold on
semilogy(ex1_nmos.Vin,ex1_nmos.I_theo)
title('Current-Gate Voltage Characteristics for NMOS Transistor')
xlabel('Gate Votlage [V]')
ylabel('Channel Current [A]')
legend('Simulated','Theoretical EKV Fit')
hold off

ex1_nmos.gm = diff(ex1_nmos.I)./diff(ex1_nmos.Vin);

%NEED TO FIND Ut
ex1_nmos.Ut = 0.0286;   % Extracted
%ex1_nmos.Ut = 0.0256;
ex1_nmos.gm_theo = ex1_nmos.kappa*((sqrt(ex1_nmos.Is.*ex1_nmos.I)/ex1_nmos.Ut).*(1-(exp(-sqrt(ex1_nmos.I/ex1_nmos.Is)))));

figure
loglog(ex1_nmos.I(2:end),ex1_nmos.gm,'.')
hold on
loglog(ex1_nmos.I,ex1_nmos.gm_theo)
title('Incremental Transconductance Gain of NMOS Transistor')
xlabel('Current Through Transistor [A]')
ylabel('Incremental Transconductance Gain [S = A/V]')
legend('Simulated Results','Theoretical Results')
hold off

% PMOS TRANSISTOR
[ex1_pmos.Vin,ex1_pmos.I] = importSimulationData('Experiment1_pmos.txt', [1, Inf]);
ex1_pmos.Vin_adj = Vdd-ex1_pmos.Vin([1:5:387,390:end]);
ex1_pmos.I_adj = ex1_pmos.I([1:5:387,390:end]);
[ex1_pmos.Is, ex1_pmos.VT, ex1_pmos.kappa] = ekvfit(ex1_pmos.Vin_adj, ex1_pmos.I_adj, epsilon);

% MAKE PLOT OF EKV FIT
ex1_pmos.I_theo = ex1_pmos.Is * (log(1 + exp(ex1_pmos.kappa*((Vdd-ex1_pmos.Vin) - ex1_pmos.VT)/(2*0.0258)))).^2;
figure
semilogy(ex1_pmos.Vin,ex1_pmos.I,'.')
hold on
semilogy(ex1_pmos.Vin,ex1_pmos.I_theo)
title('Current-Gate Voltage Characteristics for PMOS Transistor')
xlabel('Gate Votlage [V]')
ylabel('Channel Current [A]')
legend('Simulated','Theoretical EKV Fit')
hold off

ex1_pmos.gm = diff(ex1_pmos.I)./diff(Vdd-ex1_pmos.Vin);

%NEED TO FIND Ut
ex1_pmos.Ut = 0.0256;
%ex1_pmos.Ut = 0.0416;
ex1_pmos.gm_theo = ex1_pmos.kappa*((sqrt(ex1_pmos.Is.*ex1_pmos.I)/ex1_pmos.Ut).*(1-(exp(-sqrt(ex1_pmos.I/ex1_pmos.Is)))));

figure
loglog(ex1_pmos.I(2:end),ex1_pmos.gm,'.')
hold on
loglog(ex1_pmos.I,ex1_pmos.gm_theo)
title('Incremental Transconductance Gain of PMOS Transistor')
xlabel('Current Through Transistor [A]')
ylabel('Incremental Transconductance Gain [S = A/V]')
legend('Simulated Results','Theoretical Results')
hold off

%% Experiment 2
[ex2_nmos.Vin,ex2_nmos.I] = importSimulationData('Experiment2_nmos.txt', [1, Inf]);

figure
semilogy(ex2_nmos.Vin,ex2_nmos.I,'.')
hold on
title('NMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
%legend()
%hold off

% FIND Ut
fit = polyfit(ex2_nmos.Vin(341:367),log(ex2_nmos.I(341:367)),1);
%line = exp((fit(1))*log(ex1_nmos.I) + ((fit(2))));
line = exp(fit(1) * ex2_nmos.Vin(330:380) + fit(2));
slope = fit(1);
intercept = fit(2);

Ut_nmos = -1/fit(1);
semilogy(ex2_nmos.Vin(330:380),line)
hold off


ex2_nmos.gm = abs(diff(ex2_nmos.I)./diff(ex2_nmos.Vin));

%NEED TO FIND Ut
ex2_nmos.Ut = 0.0286;   % Extracted
%ex1_nmos.Ut = 0.0256;
ex2_nmos.gm_theo = ((sqrt(ex1_nmos.Is.*ex2_nmos.I)/ex2_nmos.Ut).*(1-(exp(-sqrt(ex2_nmos.I/ex1_nmos.Is)))));

figure
loglog(ex2_nmos.I(2:end),ex2_nmos.gm,'.')
hold on
loglog(ex2_nmos.I,ex2_nmos.gm_theo)
title('Incremental Transconductance Gain of NMOS Transistor')
xlabel('Current Through Transistor [A]')
ylabel('Incremental Source Conductance [S = A/V]')
legend('Simulated Results','Theoretical Results')
hold off

% PMOS Transistor
[ex2_pmos.Vin,ex2_pmos.I] = importSimulationData('Experiment2_pmos.txt', [1, Inf]);

figure
semilogy(ex2_pmos.Vin,ex2_pmos.I,'.')
hold on
title('PMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
%legend()
%hold off

% FIND Ut
fit = polyfit(ex2_pmos.Vin(35:65),log(ex2_pmos.I(35:65)),1);
%line = exp((fit(1))*log(ex1_nmos.I) + ((fit(2))));
line = exp(fit(1) * ex2_pmos.Vin(20:80) + fit(2));
slope = fit(1);
intercept = fit(2);

Ut_pmos = 1/fit(1);
semilogy(ex2_pmos.Vin(20:80),line);
hold off

ex2_pmos.gm = (diff(ex2_pmos.I)./diff(ex2_pmos.Vin));

%NEED TO FIND Ut
%ex2_pmos.Ut = 0.0416;   % Extracted
ex2_pmos.Ut = 0.0256;
ex2_pmos.gm_theo = ((sqrt(ex1_pmos.Is.*ex2_pmos.I)/ex2_pmos.Ut).*(1-(exp(-sqrt(ex2_pmos.I/ex1_pmos.Is)))));

figure
loglog(ex2_pmos.I(2:end),ex2_pmos.gm,'.')
hold on
loglog(ex2_pmos.I,ex2_pmos.gm_theo)
title('Incremental Transconductance Gain of PMOS Transistor')
xlabel('Current Through Transistor [A]')
ylabel('Incremental Source Conductance Gain [S = A/V]')
legend('Simulated Results','Theoretical Results')
hold off

%% Experiment 3
% NMOS Transistors
[ex3_nmos_WI.Vg,ex3_nmos_WI.I] = importSimulationData('Experiment3_nmos_wi.txt', [1, Inf]);
[ex3_nmos_MI.Vg,ex3_nmos_MI.I] = importSimulationData('Experiment3_nmos_mi.txt', [1, Inf]);
[ex3_nmos_SI.Vg,ex3_nmos_SI.I] = importSimulationData('Experiment3_nmos_si.txt', [1, Inf]);

figure
semilogy(ex3_nmos_WI.Vg,ex3_nmos_WI.I,'.')
hold on
semilogy(ex3_nmos_MI.Vg,ex3_nmos_MI.I,'.')
semilogy(ex3_nmos_SI.Vg,ex3_nmos_SI.I,'.')
title('NMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
%legend()
%hold off

fit_nmos_WI = polyfit(ex3_nmos_WI.Vg(35:end),log(ex3_nmos_WI.I(35:end)),1);
line_nmos_WI = exp(fit_nmos_WI(1) * ex3_nmos_WI.Vg(1:end) + fit_nmos_WI(2));
slope_nmos_WI = fit_nmos_WI(1);
intercept_nmos_WI = fit_nmos_WI(2);

fit_nmos_MI = polyfit(ex3_nmos_MI.Vg(35:end),log(ex3_nmos_MI.I(35:end)),1);
line_nmos_MI = exp(fit_nmos_MI(1) * ex3_nmos_MI.Vg(1:end) + fit_nmos_MI(2));
slope_nmos_MI = fit_nmos_MI(1);
intercept_nmos_MI = fit_nmos_MI(2);

fit_nmos_SI = polyfit(ex3_nmos_SI.Vg(205:end),log(ex3_nmos_SI.I(205:end)),1);
line_nmos_SI = exp(fit_nmos_SI(1) * ex3_nmos_SI.Vg(1:end) + fit_nmos_SI(2));
slope_nmos_SI = fit_nmos_SI(1);
intercept_nmos_SI = fit_nmos_SI(2);

ex3_nmos_WI.ro = 1/(slope_nmos_WI);
ex3_nmos_MI.ro = 1/slope_nmos_MI;
ex3_nmos_SI.ro = 1/slope_nmos_SI;

ex3_nmos_WI.Isat = exp(intercept_nmos_WI);
ex3_nmos_MI.Isat = exp(intercept_nmos_MI);
ex3_nmos_SI.Isat = exp(intercept_nmos_SI);

ex3_nmos_WI.VA = ex3_nmos_WI.ro*ex3_nmos_WI.Isat;
ex3_nmos_MI.VA = ex3_nmos_MI.ro*ex3_nmos_MI.Isat;
ex3_nmos_SI.VA = ex3_nmos_SI.ro*ex3_nmos_SI.Isat;

%semilogy(ex3_nmos_WI.Vg(1:end),line_nmos_WI,'g');
%semilogy(ex3_nmos_MI.Vg(1:end),line_nmos_MI,'g');
%semilogy(ex3_nmos_SI.Vg(1:end),line_nmos_SI,'g');
hold off



% PMOS Transistors
[ex3_pmos_WI.Vg,ex3_pmos_WI.I] = importSimulationData('Experiment3_pmos_wi.txt', [1, Inf]);
[ex3_pmos_MI.Vg,ex3_pmos_MI.I] = importSimulationData('Experiment3_pmos_mi.txt', [1, Inf]);
[ex3_pmos_SI.Vg,ex3_pmos_SI.I] = importSimulationData('Experiment3_pmos_si.txt', [1, Inf]);

ex3_pmos_WI.Vg = 5 - ex3_pmos_WI.Vg;
ex3_pmos_MI.Vg = 5 - ex3_pmos_MI.Vg;
ex3_pmos_SI.Vg = 5 - ex3_pmos_SI.Vg;

figure
semilogy(ex3_pmos_WI.Vg,ex3_pmos_WI.I,'.')
hold on
semilogy(ex3_pmos_MI.Vg,ex3_pmos_MI.I,'.')
semilogy(ex3_pmos_SI.Vg,ex3_pmos_SI.I,'.')
title('PMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
axis([0 5 10e-7 10e-4])
%legend()
%hold off

fit_pmos_WI = polyfit(ex3_pmos_WI.Vg(300:end),log(ex3_pmos_WI.I(1:end-299)),1);
line_pmos_WI = exp(fit_pmos_WI(1) * ex3_pmos_WI.Vg(1:end) + fit_pmos_WI(2));
slope_pmos_WI = fit_pmos_WI(1);
intercept_pmos_WI = fit_pmos_WI(2);

fit_pmos_MI = polyfit(ex3_pmos_MI.Vg(1:400),log(ex3_pmos_MI.I(1:400)),1);
line_pmos_MI = exp(fit_pmos_MI(1) * ex3_pmos_MI.Vg(1:end) + fit_pmos_MI(2));
slope_pmos_MI = fit_pmos_MI(1);
intercept_pmos_MI = fit_pmos_MI(2);

fit_pmos_SI = polyfit(ex3_pmos_SI.Vg(200:end),log(ex3_pmos_SI.I(1:end-199)),1);
line_pmos_SI = exp(fit_pmos_SI(1) * ex3_pmos_SI.Vg(1:end) + fit_pmos_SI(2));
slope_pmos_SI = fit_pmos_SI(1);
intercept_pmos_SI = fit_pmos_SI(2);

semilogy(ex3_pmos_WI.Vg(1:end),line_pmos_WI,'g');
semilogy(ex3_pmos_MI.Vg(1:end),line_pmos_MI,'g');
semilogy(ex3_pmos_SI.Vg(1:end),line_pmos_SI,'g');
hold off

