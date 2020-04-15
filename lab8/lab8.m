%% Experiment 1.

epsilon = 5e-4;
Vdd = 5;

MI.V2_2 = (importdata("Experiment1_Threshold_V2_2.txt"));
MI.V2_3 = (importdata("Experiment1_Threshold_V2_3.txt"));
MI.V2_4 = (importdata("Experiment1_Threshold_V2_4.txt"));
SI.V2_2 = (importdata("Experiment1_SI_V2_2.txt"));
SI.V2_3 = (importdata("Experiment1_SI_V2_3.txt"));
SI.V2_4 = (importdata("Experiment1_SI_V2_4.txt"));

figure()
plot(MI.V2_2(:,1),MI.V2_2(:,2),'ro')
hold on
grid on
plot(MI.V2_3(:,1),MI.V2_3(:,2),'b+')
plot(MI.V2_4(:,1),MI.V2_4(:,2),'k.')
title('Voltage Characteristics for NMOS Differential Pair for bias current just at threshold')
legend('V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 4 [V]','Location','Southeast','NumColumns',1)
xlabel('V_{in} = V_{1} [V]')
ylabel('V_{out} [V]')
hold off

figure()
plot(SI.V2_2(:,1),SI.V2_2(:,2),'ro')
hold on
grid on
plot(SI.V2_3(:,1),SI.V2_3(:,2),'b+')
plot(SI.V2_4(:,1),SI.V2_4(:,2),'k.')
title('Voltage Characteristics for NMOS Differential Pair for bias current above threshold')
legend('V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 4 [V]','Location','Southeast','NumColumns',1)
xlabel('V_{in} = V_{1} [V]')
ylabel('V_{out} [V]')
hold off