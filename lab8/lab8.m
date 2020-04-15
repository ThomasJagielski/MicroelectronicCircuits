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
plot(MI.V2_2(:,1),MI.V2_2(:,2),'r.')
hold on
grid on
plot(MI.V2_3(:,1),MI.V2_3(:,2),'b.')
plot(MI.V2_4(:,1),MI.V2_4(:,2),'k.')
title('Voltage Characteristics for NMOS Differential Pair for bias current just at threshold')
legend('V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 4 [V]','Location','Southeast','NumColumns',1)
xlabel('V_{in} = V_{1} [V]')
ylabel('V_{out} [V]')
hold off

figure()
plot(SI.V2_2(:,1),SI.V2_2(:,2),'r.')
hold on
grid on
plot(SI.V2_3(:,1),SI.V2_3(:,2),'b.')
plot(SI.V2_4(:,1),SI.V2_4(:,2),'k.')
title('Voltage Characteristics for NMOS Differential Pair for bias current above threshold')
legend('V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 4 [V]','Location','Southeast','NumColumns',1)
xlabel('V_{in} = V_{1} [V]')
ylabel('V_{out} [V]')
hold off

%% Exp 2

Exp2_MI.V2_2 = (importdata("Experiment2_Threshold_V2_2.txt"));
Exp2_MI.V2_3 = (importdata("Experiment2_Threshold_V2_3.txt"));
Exp2_MI.V2_4 = (importdata("Experiment2_Threshold_V2_4.txt"));
Exp2_SI.V2_2 = (importdata("Experiment2_SI_V2_2.txt"));
Exp2_SI.V2_3 = (importdata("Experiment2_SI_V2_3.txt"));
Exp2_SI.V2_4 = (importdata("Experiment2_SI_V2_4.txt"));

figure()
plot(Exp2_MI.V2_2(1:20:3700,1)-2,Exp2_MI.V2_2(1:20:3700,2),'r.')
hold on
grid on
plot(Exp2_MI.V2_2(4300:25:end,1)-2,Exp2_MI.V2_2(4300:25:end,2),'r.')
plot(Exp2_MI.V2_2(3700:4300,1)-2,Exp2_MI.V2_2(3700:4300,2),'r.')
plot(Exp2_MI.V2_3(1:25:3700,1)-3,Exp2_MI.V2_3(1:25:3700,2),'b.')
plot(Exp2_MI.V2_3(4300:25:end,1)-3,Exp2_MI.V2_3(4300:25:end,2),'b.')
plot(Exp2_MI.V2_3(3700:4300,1)-3,Exp2_MI.V2_3(3700:4300,2),'b.')
plot(Exp2_MI.V2_4(1:25:3700,1)-4,Exp2_MI.V2_4(1:25:3700,2),'k.')
plot(Exp2_MI.V2_4(4300:25:end,1)-4,Exp2_MI.V2_4(4300:25:end,2),'k.')
plot(Exp2_MI.V2_4(3700:4300,1)-4,Exp2_MI.V2_4(3700:4300,2),'k.')
title('Voltage Characteristics for NMOS Differential Pair for bias current just at threshold')
legend('V_{2} = 2 [V]','V_{2} = 2 [V]','V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 3 [V]',...
    'V_{2} = 3 [V]','V_{2} = 3 [V]','V_{2} = 3 [V]','V_{2} = 3 [V]','Location','Southeast',...
    'NumColumns',1)
xlabel('V_{dm} = V_{1} - V_{2} [V]')
ylabel('V_{out} [V]')
hold off

figure()
plot(Exp2_SI.V2_2(1:5:end,1)-2,Exp2_SI.V2_2(1:5:end,2),'r.')
hold on
grid on
plot(Exp2_SI.V2_3(1:5:end,1)-3,Exp2_SI.V2_3(1:5:end,2),'b.')
plot(Exp2_SI.V2_4(1:5:end,1)-4,Exp2_SI.V2_4(1:5:end,2),'k.')
title('Voltage Characteristics for NMOS Differential Pair for bias current above threshold')
legend('V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 4 [V]','Location','Southeast','NumColumns',1)
xlabel('V_{dm} = V_{1} - V_{2} [V]')
ylabel('V_{out} [V]')
hold off

