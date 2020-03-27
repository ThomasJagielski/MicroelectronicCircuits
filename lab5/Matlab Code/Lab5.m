%% Experiment 1
epsilon = 5e-4;
Vdd = 5;
% NMOS TRANSISTOR
[ex1_nmos.Vin,ex1_nmos.I] = importSimulationData('Experiment1_nmos.txt', [1, Inf]);
ex1_nmos.Vin_adj = ex1_nmos.Vin([1:110,115:5:end]);
ex1_nmos.I_adj = ex1_nmos.I([1:110,115:5:end]);
[ex1_nmos.Is, ex1_nmos.VT, ex1_nmos.kappa] = ekvfit(ex1_nmos.Vin_adj, ex1_nmos.I_adj, epsilon);

% MAKE PLOT OF EKV FIT

ex1_nmos.gm = ex1_nmos.I./ex1_nmos.Vin;
%NEED TO FIND Ut
%ex1_nmos.gm_theo = ex1_nmos.kappa*(sqrt(ex1_nmos.Is*ex1_nmos.I)/ex1_nmos.Ut)*(1-exp(-sqrt(ex1_nmos.Is/ex1_nmos.I)))
figure
loglog(ex1_nmos.I,ex1_nmos.gm,'.')
%loglog(ex1_nmos.I,ex1_nmos.gm_theo)
title('Incremental Transconductance Gain of NMOS Transistor')
xlabel('Current Through Transistor [A]')
ylabel('Incremental Transconductance Gain [S = A/V]')
%legend('Simulated Results','Theoretical Results')

% PMOS TRANSISTOR
[ex1_pmos.Vin,ex1_pmos.I] = importSimulationData('Experiment1_pmos.txt', [1, Inf]);
ex1_pmos.Vin_adj = 5-ex1_pmos.Vin([1:5:387,390:end]);
ex1_pmos.I_adj = ex1_pmos.I([1:5:387,390:end]);
[ex1_pmos.Is, ex1_pmos.VT, ex1_pmos.kappa] = ekvfit(ex1_pmos.Vin_adj, ex1_pmos.I_adj, epsilon);

%% Experiment 2
[ex2_nmos.Vin,ex2_nmos.I] = importSimulationData('Experiment2_nmos.txt', [1, Inf]);

figure
semilogy(ex2_nmos.Vin,ex2_nmos.I,'.')
hold on
title('NMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
%legend()
hold off


[ex2_pmos.Vin,ex2_pmos.I] = importSimulationData('Experiment2_pmos.txt', [1, Inf]);

figure
semilogy(ex2_pmos.Vin,ex2_pmos.I,'.')
hold on
title('PMOS Current-Source Voltage Characteristics')
xlabel('Source Voltage [V]')
ylabel('Current Through Transistor [A]')
%legend()
hold off
%% Experiment 3

