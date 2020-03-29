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

% Experiment 1 Plots
figure
semilogy(ex1_nmos.Vin,ex1_nmos.I,'.')
hold on
semilogy(ex1_nmos.Vin,ex1_nmos.I_theo)
semilogy(Vdd-ex1_pmos.Vin,ex1_pmos.I,'.')
semilogy(Vdd-ex1_pmos.Vin,ex1_pmos.I_theo)
title('Current-Gate Voltage Characteristics for MOS Transistors')
xlabel('Gate Votlage [V]')
ylabel('Channel Current [A]')
legend('Simulated Results for NMOS Transistor','Theoretical EKV Fit for NMOS Transistor',...
    'Simulated Results for PMOS Transistor','Theoretical EKV Fit for PMOS Transistor',...
    'Location','Southeast')
hold off


figure
loglog(ex1_nmos.I(2:end),ex1_nmos.gm,'.')
hold on
loglog(ex1_nmos.I,ex1_nmos.gm_theo)
loglog(ex1_pmos.I(2:end),ex1_pmos.gm,'.')
loglog(ex1_pmos.I,ex1_pmos.gm_theo)
title('Incremental Transconductance Gain of MOS Transistors')
xlabel('Current Through Transistor [A]')
ylabel('Incremental Transconductance Gain [S = A/V]')
legend('Simulated Results for NMOS Transistor','Theoretical Results for NMOS Transistor',...
    'Simulated Results for PMOS Transistor','Theoretical Results for PMOS Transistor',...
    'Location','Southeast')
hold off


%% Experiment 2
[ex2_nmos.Vin,ex2_nmos.I] = importSimulationData('Experiment2_nmos.txt', [1, Inf]);

% FIND Ut
fit = polyfit(ex2_nmos.Vin(341:367),log(ex2_nmos.I(341:367)),1);
%line = exp((fit(1))*log(ex1_nmos.I) + ((fit(2))));
line = exp(fit(1) * ex2_nmos.Vin + fit(2));
slope = fit(1);
intercept = fit(2);
Ut_nmos = -1/fit(1);

figure
semilogy(ex2_nmos.Vin,ex2_nmos.I,'.')
axis([0 5 10e-14 10e-2])
hold on
title('NMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
semilogy(ex2_nmos.Vin,line)
legend('Simualted Results','Line of Best Fit for Weak Inversion Region',...
    'Location','Southwest')
hold off


ex2_nmos.gm = abs(diff(ex2_nmos.I)./diff(ex2_nmos.Vin));

%NEED TO FIND Ut
ex2_nmos.Ut = 0.0286;   % Extracted
%ex1_nmos.Ut = 0.0256;
ex2_nmos.gm_theo = ((sqrt(ex1_nmos.Is.*ex2_nmos.I)/ex2_nmos.Ut).*(1-(exp(-sqrt(ex2_nmos.I/ex1_nmos.Is)))));

%figure
%loglog(ex2_nmos.I(2:end),ex2_nmos.gm,'.')
%hold on
%loglog(ex2_nmos.I,ex2_nmos.gm_theo)
%title('Incremental Transconductance Gain of NMOS Transistor')
%xlabel('Current Through Transistor [A]')
%ylabel('Incremental Source Conductance [S = A/V]')
%legend('Simulated Results','Theoretical Results')
%hold off

% PMOS Transistor
[ex2_pmos.Vin,ex2_pmos.I] = importSimulationData('Experiment2_pmos.txt', [1, Inf]);

% FIND Ut
fit = polyfit(ex2_pmos.Vin(35:65),log(ex2_pmos.I(35:65)),1);
%line = exp((fit(1))*log(ex1_nmos.I) + ((fit(2))));
line = exp(fit(1) * ex2_pmos.Vin + fit(2));
slope = fit(1);
intercept = fit(2);
Ut_pmos = 1/fit(1);

figure
semilogy(ex2_pmos.Vin,ex2_pmos.I,'.')
axis([0 5 10e-15 10e-3])
hold on
title('PMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
semilogy(ex2_pmos.Vin,line);
legend('Simualted Results','Line of Best Fit for Weak Inversion Region',...
    'Location','Southeast')
hold off

ex2_pmos.gm = (diff(ex2_pmos.I)./diff(ex2_pmos.Vin));

%NEED TO FIND Ut
%ex2_pmos.Ut = 0.0416;   % Extracted
ex2_pmos.Ut = 0.0256;
ex2_pmos.gm_theo = ((sqrt(ex1_pmos.Is.*ex2_pmos.I)/ex2_pmos.Ut).*(1-(exp(-sqrt(ex2_pmos.I/ex1_pmos.Is)))));

figure
loglog(ex2_nmos.I(2:end),ex2_nmos.gm,'.')
hold on
loglog(ex2_nmos.I,ex2_nmos.gm_theo)
loglog(ex2_pmos.I(2:end),ex2_pmos.gm,'.')
loglog(ex2_pmos.I,ex2_pmos.gm_theo)
title('Incremental Source Conductance Gain of MOS Transistors')
xlabel('Current Through Transistor [A]')
ylabel('Incremental Source Conductance Gain [S = A/V]')
legend('Simulated Results for NMOS Transistor','Theoretical Results for NMOS Transistor',...
    'Simulated Results for PMOS Transistor','Theoretical Results for PMOS Transistor',...
    'Location','Southeast')
hold off

%% Experiment 3
% NMOS Transistors
[ex3_nmos_WI.Vin,ex3_nmos_WI.I] = importSimulationData('Experiment3_nmos_wi.txt', [1, Inf]);
[ex3_nmos_MI.Vin,ex3_nmos_MI.I] = importSimulationData('Experiment3_nmos_mi.txt', [1, Inf]);
[ex3_nmos_SI.Vin,ex3_nmos_SI.I] = importSimulationData('Experiment3_nmos_si.txt', [1, Inf]);

% PMOS Transistors
[ex3_pmos_WI.Vin,ex3_pmos_WI.I] = importSimulationData('Experiment3_pmos_wi_new.txt', [1, Inf]);
[ex3_pmos_MI.Vin,ex3_pmos_MI.I] = importSimulationData('Experiment3_pmos_mi_new.txt', [1, Inf]);
[ex3_pmos_SI.Vin,ex3_pmos_SI.I] = importSimulationData('Experiment3_pmos_si_new.txt', [1, Inf]);

ex3_pmos_WI.Vin = 5 - ex3_pmos_WI.Vin;
ex3_pmos_MI.Vin = 5 - ex3_pmos_MI.Vin;
ex3_pmos_SI.Vin = 5 - ex3_pmos_SI.Vin;

%figure
%semilogy(ex3_pmos_WI.Vin,ex3_pmos_WI.I,'.')
%axis([0 5 10e-8 10e-4])
%hold on
%semilogy(ex3_pmos_MI.Vin,ex3_pmos_MI.I,'.')
%semilogy(ex3_pmos_SI.Vin,ex3_pmos_SI.I,'.')
%title('PMOS Current-Source Voltage Characteristics')
%xlabel('Source Voltage [V]')
%ylabel('Current Through Transistor [A]')
%legend('Simulated Weak Inversion Characteristics',...
%    'Simulated Moderate Inversion Characteristics',...
%    'Simulated Strong Inversion Characteristics',...
%    'Location','Southeast')
%hold off

fit_nmos_WI = polyfit(ex3_nmos_WI.Vin(35:end),log(ex3_nmos_WI.I(35:end)),1);
line_nmos_WI = exp(fit_nmos_WI(1) * ex3_nmos_WI.Vin(1:end) + fit_nmos_WI(2));
%slope_nmos_WI = fit_nmos_WI(1);
slope_nmos_WI = (line_nmos_WI(300)-line_nmos_WI(100))/(ex3_nmos_WI.Vin(300)-ex3_nmos_WI.Vin(100));
intercept_nmos_WI = fit_nmos_WI(2);

fit_nmos_MI = polyfit(ex3_nmos_MI.Vin(35:end),log(ex3_nmos_MI.I(35:end)),1);
line_nmos_MI = exp(fit_nmos_MI(1) * ex3_nmos_MI.Vin(1:end) + fit_nmos_MI(2));
%slope_nmos_MI = fit_nmos_MI(1);
slope_nmos_MI = (line_nmos_MI(300)-line_nmos_MI(100))/(ex3_nmos_MI.Vin(300)-ex3_nmos_MI.Vin(100));
intercept_nmos_MI = fit_nmos_MI(2);

fit_nmos_SI = polyfit(ex3_nmos_SI.Vin(205:end),log(ex3_nmos_SI.I(205:end)),1);
line_nmos_SI = exp(fit_nmos_SI(1) * ex3_nmos_SI.Vin(1:end) + fit_nmos_SI(2));
%slope_nmos_SI = fit_nmos_SI(1);
slope_nmos_SI = (line_nmos_SI(300)-line_nmos_SI(100))/(ex3_nmos_SI.Vin(300)-ex3_nmos_SI.Vin(100));
intercept_nmos_SI = fit_nmos_SI(2);

ex3_nmos_WI.ro = 1/slope_nmos_WI;
ex3_nmos_MI.ro = 1/slope_nmos_MI;
ex3_nmos_SI.ro = 1/slope_nmos_SI;

ex3_nmos_WI.Isat = exp(intercept_nmos_WI);
ex3_nmos_MI.Isat = exp(intercept_nmos_MI);
ex3_nmos_SI.Isat = exp(intercept_nmos_SI);

ex3_nmos_WI.VA = ex3_nmos_WI.ro*ex3_nmos_WI.Isat;
ex3_nmos_MI.VA = ex3_nmos_MI.ro*ex3_nmos_MI.Isat;
ex3_nmos_SI.VA = ex3_nmos_SI.ro*ex3_nmos_SI.Isat;

%semilogy(ex3_nmos_WI.Vin(1:end),line_nmos_WI,'g');
%semilogy(ex3_nmos_MI.Vin(1:end),line_nmos_MI,'g');
%semilogy(ex3_nmos_SI.Vin(1:end),line_nmos_SI,'g');

nmos_early_voltage = [ex3_nmos_WI.VA,ex3_nmos_MI.VA,ex3_nmos_SI.VA];
nmos_Isat = [ex3_nmos_WI.Isat,ex3_nmos_MI.Isat,ex3_nmos_SI.Isat];

%Isat_theo = logspace(-9,-3,max(size(ex3_nmos_WI.Vin)));
%early_voltage_theoretical = ex3_nmos_WI.Vin./((I/Isat_theo')-1);
%early_voltage_theoretical = ex3_nmos_SI.ro * Isat_theo;

nmos_Isat_theo = logspace(-9,-3,max(size(ex3_nmos_WI.Vin)));
nmos_fit_early_voltage = polyfit(log(nmos_Isat),nmos_early_voltage,1);
nmos_line_early_voltage = (nmos_fit_early_voltage(1) * log(nmos_Isat_theo) + nmos_fit_early_voltage(2));
nmos_slope_nmos_SI = nmos_fit_early_voltage(1);
nmos_intercept_early_voltage = nmos_fit_early_voltage(2);


figure
semilogy(ex3_nmos_WI.Vin,ex3_nmos_WI.I,'.')
hold on
semilogy(ex3_nmos_WI.Vin(1:end),line_nmos_WI)
semilogy(ex3_nmos_MI.Vin,ex3_nmos_MI.I,'.')
semilogy(ex3_nmos_MI.Vin(1:end),line_nmos_MI)
semilogy(ex3_nmos_SI.Vin,ex3_nmos_SI.I,'.')
semilogy(ex3_nmos_SI.Vin(1:end),line_nmos_SI)
title('NMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
legend('Simulated Weak Inversion Characteristics',...
    'Line of Best Fit Weak Inversion',...
    'Simulated Moderate Inversion Characteristics',...
    'Line of Best Fit Moderate Inversion',...
    'Simulated Strong Inversion Characteristics',...
    'Line of Best Fit Strong Inversion',...
    'Location','Southeast')
hold off


% PMOS Extraction
fit_pmos_WI = polyfit(ex3_pmos_WI.Vin(2:100),log(ex3_pmos_WI.I(2:100)),1);
line_pmos_WI = exp(fit_pmos_WI(1) * ex3_pmos_WI.Vin(1:end) + fit_pmos_WI(2));
slope_pmos_WI = (line_pmos_WI(2)-line_pmos_WI(300))/(ex3_pmos_WI.Vin(2)-ex3_pmos_WI.Vin(300));
intercept_pmos_WI = fit_pmos_WI(2);

fit_pmos_MI = polyfit(ex3_pmos_MI.Vin(2:200),log(ex3_pmos_MI.I(2:200)),1);
line_pmos_MI = exp(fit_pmos_MI(1) * ex3_pmos_MI.Vin(1:end) + fit_pmos_MI(2));
slope_pmos_MI = (line_pmos_MI(2)-line_pmos_MI(300))/(ex3_pmos_MI.Vin(2)-ex3_pmos_MI.Vin(300));
intercept_pmos_MI = fit_pmos_MI(2);

fit_pmos_SI = polyfit(ex3_pmos_SI.Vin(2:200),log(ex3_pmos_SI.I(2:200)),1);
line_pmos_SI = exp(fit_pmos_SI(1) * ex3_pmos_SI.Vin(1:end) + fit_pmos_SI(2));
slope_pmos_SI = (line_pmos_SI(2)-line_pmos_SI(300))/(ex3_pmos_SI.Vin(2)-ex3_pmos_SI.Vin(300));
intercept_pmos_SI = fit_pmos_SI(2);


ex3_pmos_WI.ro = 1/slope_pmos_WI;
ex3_pmos_MI.ro = 1/slope_pmos_MI;
ex3_pmos_SI.ro = 1/slope_pmos_SI;

ex3_pmos_WI.Isat = exp(intercept_pmos_WI);
ex3_pmos_MI.Isat = exp(intercept_pmos_MI);
ex3_pmos_SI.Isat = exp(intercept_pmos_SI);

ex3_pmos_WI.VA = ex3_pmos_WI.ro*ex3_pmos_WI.Isat;
ex3_pmos_MI.VA = ex3_pmos_MI.ro*ex3_pmos_MI.Isat;
ex3_pmos_SI.VA = ex3_pmos_SI.ro*ex3_pmos_SI.Isat;

%semilogy(ex3_nmos_WI.Vin(1:end),line_nmos_WI,'g');
%semilogy(ex3_nmos_MI.Vin(1:end),line_nmos_MI,'g');
%semilogy(ex3_nmos_SI.Vin(1:end),line_nmos_SI,'g');

pmos_early_voltage = [ex3_pmos_WI.VA,ex3_pmos_MI.VA,ex3_pmos_SI.VA];
pmos_Isat = [ex3_pmos_WI.Isat,ex3_pmos_MI.Isat,ex3_pmos_SI.Isat];

%Isat_theo = logspace(-9,-3,max(size(ex3_nmos_WI.Vin)));
%early_voltage_theoretical = ex3_nmos_WI.Vin./((I/Isat_theo')-1);
%early_voltage_theoretical = ex3_nmos_SI.ro * Isat_theo;

pmos_Isat_theo = logspace(-9,-3,max(size(ex3_pmos_WI.Vin)));
pmos_fit_early_voltage = polyfit(log(pmos_Isat),pmos_early_voltage,1);
pmos_line_early_voltage = (pmos_fit_early_voltage(1) * log(pmos_Isat_theo) + pmos_fit_early_voltage(2));
pmos_slope_nmos_SI = pmos_fit_early_voltage(1);
pmos_intercept_early_voltage = pmos_fit_early_voltage(2);


figure
semilogy(ex3_pmos_WI.Vin,ex3_pmos_WI.I,'.')
%axis([0 5 10e-8 10e-4])
hold on
semilogy(ex3_pmos_WI.Vin(1:end),line_pmos_WI);
semilogy(ex3_pmos_MI.Vin,ex3_pmos_MI.I,'.')
semilogy(ex3_pmos_MI.Vin(1:end),line_pmos_MI);
semilogy(ex3_pmos_SI.Vin,ex3_pmos_SI.I,'.')
semilogy(ex3_pmos_SI.Vin(1:end),line_pmos_SI);
title('PMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
legend('Simulated Weak Inversion Characteristics',...
    'Line of Best Fit Weak Inversion',...
    'Simulated Moderate Inversion Characteristics',...
    'Line of Best Fit Moderate Inversion',...
    'Simulated Strong Inversion Characteristics',...
    'Line of Best Fit Strong Inversion',...
    'Location','Southeast')
hold off


figure
semilogx(nmos_Isat,nmos_early_voltage,'o')
hold on
semilogx(nmos_Isat_theo,nmos_line_early_voltage)
semilogx(pmos_Isat,pmos_early_voltage,'go')
semilogx(pmos_Isat_theo,pmos_line_early_voltage)
title('Early Voltage with respect to Saturation Current for MOS Transistors')
xlabel('Saturation Current [A]')
ylabel('Early Voltage [V]')
legend('Extracted Points For NMOS Transistor','Line of Best Fit for NMOS Transistor',...
    'Extracted Points For PMOS Transistor','Line of Best Fit for PMOS Transistor',...
    'Location','Southeast')
hold off


%%





% Intrinsic Gain of NMOS
V_in = linspace(0,0.2,max(size(line_nmos_WI)));

fit_nmos_WI = polyfit(ex3_nmos_WI.Vin(2:6),log(ex3_nmos_WI.I(2:6)),1);
line_nmos_WI = exp(fit_nmos_WI(1) * V_in + fit_nmos_WI(2));
%slope_nmos_WI = fit_nmos_WI(1);
slope_nmos_WI = (line_nmos_WI(end)-line_nmos_WI(1))/(V_in(end)-V_in(1));
%slope_nmos_WI = (ex3_nmos_WI.I(3)-ex3_nmos_WI.I(2))/(ex3_nmos_WI.Vin(3)-ex3_nmos_WI.Vin(2));
intercept_nmos_WI = fit_nmos_WI(2);
ex3_nmos_WI.intrinsic_gain = slope_nmos_WI * ex3_nmos_WI.ro;

fit_nmos_MI = polyfit(ex3_nmos_MI.Vin(2:6),log(ex3_nmos_MI.I(2:6)),1);
line_nmos_MI = exp(fit_nmos_MI(1) * V_in + fit_nmos_MI(2));
%slope_nmos_MI = fit_nmos_MI(1);
slope_nmos_MI = (line_nmos_MI(end)-line_nmos_MI(1))/(V_in(end)-V_in(1));
%slope_nmos_MI = (ex3_nmos_MI.I(3)-ex3_nmos_MI.I(2))/(ex3_nmos_MI.Vin(3)-ex3_nmos_MI.Vin(2));
intercept_nmos_MI = fit_nmos_MI(2);
ex3_nmos_MI.intrinsic_gain = slope_nmos_MI * ex3_nmos_MI.ro;

fit_nmos_SI = polyfit(ex3_nmos_SI.Vin(2:6),log(ex3_nmos_SI.I(2:6)),1);
line_nmos_SI = exp(fit_nmos_SI(1) * V_in + fit_nmos_SI(2));
%slope_nmos_SI = fit_nmos_SI(1);
slope_nmos_SI = (line_nmos_SI(end)-line_nmos_SI(1))/(V_in(end)-V_in(1));
%slope_nmos_SI = (ex3_nmos_SI.I(3)-ex3_nmos_SI.I(2))/(ex3_nmos_SI.Vin(3)-ex3_nmos_SI.Vin(2));
intercept_nmos_SI = fit_nmos_SI(2);
ex3_nmos_SI.intrinsic_gain = slope_nmos_SI * ex3_nmos_SI.ro;


fit_pmos_WI = polyfit(ex3_pmos_WI.Vin(end-4:end-1),log(ex3_pmos_WI.I(end-4:end-1)),1);
line_pmos_WI = exp(fit_pmos_WI(1) * V_in + fit_pmos_WI(2));
%slope_pmos_WI = fit_pmos_WI(1);
slope_pmos_WI = (line_pmos_WI(end)-line_pmos_WI(1))/(V_in(end)-V_in(1));
%slope_pmos_WI = (ex3_pmos_WI.I(3)-ex3_pmos_WI.I(2))/(ex3_pmos_WI.Vin(3)-ex3_pmos_WI.Vin(2));
intercept_pmos_WI = fit_pmos_WI(2);
ex3_pmos_WI.intrinsic_gain = slope_pmos_WI * ex3_pmos_WI.ro;

fit_pmos_MI = polyfit(ex3_pmos_MI.Vin(end-4:end-1),log(ex3_pmos_MI.I(end-4:end-1)),1);
line_pmos_MI = exp(fit_pmos_MI(1) * V_in + fit_pmos_MI(2));
%slope_pmos_MI = fit_pmos_MI(1);
slope_pmos_MI = (line_pmos_MI(end)-line_pmos_MI(1))/(V_in(end)-V_in(1));
%slope_pmos_MI = (ex3_pmos_MI.I(3)-ex3_pmos_MI.I(2))/(ex3_pmos_MI.Vin(3)-ex3_pmos_MI.Vin(2));
intercept_pmos_MI = fit_pmos_MI(2);
ex3_pmos_MI.intrinsic_gain = slope_pmos_MI * ex3_pmos_MI.ro;

fit_pmos_SI = polyfit(ex3_pmos_SI.Vin(end-4:end-1),log(ex3_pmos_SI.I(end-4:end-1)),1);
line_pmos_SI = exp(fit_pmos_SI(1) * V_in + fit_pmos_SI(2));
%slope_pmos_SI = fit_pmos_SI(1);
slope_pmos_SI = (line_pmos_SI(end)-line_pmos_SI(1))/(V_in(end)-V_in(1));
%slope_pmos_SI = (ex3_pmos_SI.I(3)-ex3_pmos_SI.I(2))/(ex3_pmos_SI.Vin(3)-ex3_pmos_SI.Vin(2));
intercept_pmos_SI = fit_pmos_SI(2);
ex3_pmos_SI.intrinsic_gain = slope_pmos_SI * ex3_pmos_SI.ro;


%figure
%semilogy(ex3_pmos_WI.Vin,ex3_pmos_WI.I,'.')
%axis([0 5 10e-8 10e-4])
%hold on
%semilogy(V_in,line_pmos_WI);
%semilogy(ex3_pmos_MI.Vin,ex3_pmos_MI.I,'.')
%semilogy(V_in,line_pmos_MI);
%semilogy(ex3_pmos_SI.Vin,ex3_pmos_SI.I,'.')
%semilogy(V_in,line_pmos_SI);
%title('PMOS Current-Source Voltage Characteristics')
%xlabel('Source Voltage [V]')
%ylabel('Current Through Transistor [A]')
%legend('Simulated Weak Inversion Characteristics',...
%    'Line of Best Fit Weak Inversion',...
%    'Simulated Moderate Inversion Characteristics',...
%    'Line of Best Fit Moderate Inversion',...
%    'Simulated Strong Inversion Characteristics',...
%    'Line of Best Fit Strong Inversion',...
%    'Location','Southeast')
%hold off

ex3_nmos_Isat = [ex3_nmos_WI.Isat,ex3_nmos_MI.Isat,ex3_nmos_SI.Isat];
ex3_nmos_intrinsic_gain = [ex3_nmos_WI.intrinsic_gain,ex3_nmos_MI.intrinsic_gain,ex3_nmos_SI.intrinsic_gain];

ex3_pmos_Isat = [ex3_pmos_WI.Isat,ex3_pmos_MI.Isat,ex3_pmos_SI.Isat];
ex3_pmos_intrinsic_gain = [ex3_pmos_WI.intrinsic_gain,ex3_pmos_MI.intrinsic_gain,ex3_pmos_SI.intrinsic_gain];


figure
%axis([10e-9 10e-2 0 250])
loglog(ex3_nmos_Isat,ex3_nmos_intrinsic_gain,'o')
hold on
loglog(ex3_pmos_Isat,ex3_pmos_intrinsic_gain,'o')
title('Intrinsic Gain of NMOS Transistor')
xlabel('Saturation Current [A]')
% ADD UNITS
ylabel('Intrinsic Gain [A^{2}/V^{2}]')
legend('NMOS Intrinsic Gain','PMOS Intrinsic Gain')
hold off

