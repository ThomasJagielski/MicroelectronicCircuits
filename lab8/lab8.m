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
Exp2_MI.V2_2_5 = (importdata("Experiment2_Threshold_V2_2_5_USE.txt"));
Exp2_MI.V2_3 = (importdata("Experiment2_Threshold_V2_3.txt"));
Exp2_MI.V2_4 = (importdata("Experiment2_Threshold_V2_4.txt"));
Exp2_SI.V2_2 = (importdata("Experiment2_SI_V2_2.txt"));
Exp2_SI.V2_2_5 = (importdata("Experiment2_SI_V2_2_5_USE.txt"));
Exp2_SI.V2_3 = (importdata("Experiment2_SI_V2_3.txt"));
Exp2_SI.V2_4 = (importdata("Experiment2_SI_V2_4.txt"));
Exp2_MI.Vout = (importdata("Experiment2_Threshold_Vout_sweep_Iout.txt"));
Exp2_MI.Vdm = (importdata("Experiment2_Threshold_Vdm_about_2_5_Iout.txt"));

% Bias Current at Threshold

% BOUNDS: 1408, 1505

MI_V2_2_5_fit = polyfit(Exp2_MI.V2_2_5(1408:1505,1)-2.5,Exp2_MI.V2_2_5(1408:1505,2),1);
MI_V2_2_5_line = MI_V2_2_5_fit(1)*(Exp2_MI.V2_2_5(1370:1540,1)-2.5) + MI_V2_2_5_fit(2);
MI_V2_2_5_slope = MI_V2_2_5_fit(1);

figure()
plot(Exp2_MI.V2_2_5(:,1)-2.5,Exp2_MI.V2_2_5(:,2),'b.')
hold on
grid on
plot(Exp2_MI.V2_2_5(1370:1540,1)-2.5,MI_V2_2_5_line,'g')
title('Voltage Characteristics for NMOS Differential Pair for bias current at threshold')
legend('Simulated Data','Line of Best Fit','Location','Southeast','NumColumns',1)
xlabel('V_{dm} = V_{1} - V_{2} [V]')
ylabel('V_{out} [V]')
hold off


% Fit
Exp2_MI.Vout(:,2) = -1 * Exp2_MI.Vout(:,2);
Exp2_MI.Vout_fit = polyfit(Exp2_MI.Vout(200:480,1),Exp2_MI.Vout(200:480,2),1);
Exp2_MI.Vout_line = Exp2_MI.Vout_fit(1)*(Exp2_MI.Vout(200:480,1)) + Exp2_MI.Vout_fit(2);
Exp2_MI.Vout_slope = (Exp2_MI.Vout_line(end) - Exp2_MI.Vout_line(1))/(Exp2_MI.Vout(480,1)-Exp2_MI.Vout(200,1));

figure()
axis([0 5 -1e-6 1e-6])
plot(Exp2_MI.Vout(185:500,1),Exp2_MI.Vout(185:500,2),'b.')
hold on
grid on
plot(Exp2_MI.Vout(200:480,1),Exp2_MI.Vout_line,'r-')
title('Current Voltage Characteristics for NMOS Differential Pair')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{out} [V]')
ylabel('I_{out} [A]')
hold off

x_intercept = (-1*Exp2_MI.Vout_fit(2))/Exp2_MI.Vout_fit(1);

Exp2_MI.Vdm_fit = polyfit(Exp2_MI.Vdm(46:55,1),Exp2_MI.Vdm(46:55,2),1);
Exp2_MI.Vdm_line = Exp2_MI.Vdm_fit(1)*(Exp2_MI.Vdm(46:55,1)) + Exp2_MI.Vdm_fit(2);
Exp2_MI.Vdm_slope = (Exp2_MI.Vdm_line(end) - Exp2_MI.Vdm_line(1))/(Exp2_MI.Vdm(55,1)-Exp2_MI.Vdm(46,1));

figure()
plot(Exp2_MI.Vdm(:,1)-2.5,Exp2_MI.Vdm(:,2),'b.')
hold on
grid on
plot(Exp2_MI.Vdm(46:55,1)-2.5,Exp2_MI.Vdm_line,'r-')
title('Current Voltage Characteristics for NMOS Differential Pair')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{dm} [V]')
ylabel('I_{out} [A]')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Above Threshold

SI_V2_2_5_fit = polyfit(Exp2_SI.V2_2_5(1408:1505,1)-2.5,Exp2_SI.V2_2_5(1408:1505,2),1);
SI_V2_2_5_line = SI_V2_2_5_fit(1)*(Exp2_SI.V2_2_5(1370:1540,1)-2.5) + SI_V2_2_5_fit(2);
SI_V2_2_5_slope = SI_V2_2_5_fit(1);

figure()
plot(Exp2_SI.V2_2_5(:,1)-2.5,Exp2_SI.V2_2_5(:,2),'b.')
hold on
grid on
plot(Exp2_SI.V2_2_5(1370:1540,1)-2.5,SI_V2_2_5_line,'g')
title('Voltage Characteristics for NMOS Differential Pair for bias current at threshold')
legend('Simulated Data','Line of Best Fit','Location','Southeast','NumColumns',1)
xlabel('V_{dm} = V_{1} - V_{2} [V]')
ylabel('V_{out} [V]')
hold off

Exp2_SI.Vout = (importdata("Experiment2_SI_Vout_sweep_Iout.txt"));
Exp2_SI.Vdm = (importdata("Experiment2_SI_Vdm_about_2_5_Iout.txt"));

% Fit
Exp2_SI.Vout(:,2) = -1 * Exp2_SI.Vout(:,2);
Exp2_SI.Vout_fit = polyfit(Exp2_SI.Vout(150:460,1),Exp2_SI.Vout(150:460,2),1);
Exp2_SI.Vout_line = Exp2_SI.Vout_fit(1)*(Exp2_SI.Vout(150:460,1)) + Exp2_SI.Vout_fit(2);
Exp2_SI.Vout_slope = (Exp2_SI.Vout_line(end) - Exp2_SI.Vout_line(1))/(Exp2_SI.Vout(460,1)-Exp2_SI.Vout(150,1));

figure()
axis([0 5 -1e-6 1e-6])
plot(Exp2_SI.Vout(130:490,1),Exp2_SI.Vout(130:490,2),'b.')
hold on
grid on
plot(Exp2_SI.Vout(150:460,1),Exp2_SI.Vout_line,'r-')
title('Current Voltage Characteristics for NMOS Differential Pair, I_{b} in Strong Inversion')
legend('Experimental Data','Fit Data','Location','Northwest','NumColumns',1)
xlabel('V_{out} [V]')
ylabel('I_{out} [A]')
hold off

SI_x_intercept = (-1*Exp2_SI.Vout_fit(2))/Exp2_SI.Vout_fit(1);
Exp2_SI.Vdm_fit = polyfit(Exp2_SI.Vdm(35:61,1),Exp2_SI.Vdm(35:61,2),1);
Exp2_SI.Vdm_line = Exp2_SI.Vdm_fit(1)*(Exp2_SI.Vdm(35:61,1)) + Exp2_SI.Vdm_fit(2);
Exp2_SI.Vdm_slope = (Exp2_SI.Vdm_line(end) - Exp2_SI.Vdm_line(1))/(Exp2_SI.Vdm(61,1)-Exp2_SI.Vdm(35,1));

figure()
plot(Exp2_SI.Vdm(:,1)-2.5,Exp2_SI.Vdm(:,2),'b.')
hold on
grid on
plot(Exp2_SI.Vdm(35:61,1)-2.5,Exp2_SI.Vdm_line,'r-')
title('Current Voltage Characteristics for NMOS Differential Pair, I_{b} in Strong Inversion')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{dm} [V]')
ylabel('I_{out} [A]')
hold off



%% Experiment 3
Exp3_MI = (importdata("Experiment3_Threshold.txt"));
Exp3_SI = (importdata("Experiment3_SI.txt"));

Exp3_MI_fit = polyfit(Exp3_MI(100:400,1),Exp3_MI(100:400,2),1);
Exp3_MI_line = Exp3_MI_fit(1)*(Exp3_MI(100:400,1)) + Exp3_MI_fit(2);
Exp3_MI_slope = (Exp3_MI_line(end) - Exp3_MI_line(1))/(Exp3_MI(400,1)-Exp3_MI(100,1));

figure
plot(Exp3_MI(1:5:end,1),Exp3_MI(1:5:end,2),'.')
hold on
grid on
plot(Exp3_MI(100:400,1),Exp3_MI_line,'r-')
title('Unity-Gain Follower for NMOS Differential Pair, I_{b} at Threshold')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
hold off

figure
plot(Exp3_MI(1:5:end,1),Exp3_MI(1:5:end,2)-Exp3_MI(1:5:end,1),'.')
hold on
grid on
title('Unity-Gain Follower for NMOS Differential Pair, I_{b} at Threshold')
%legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
hold off


% Above Threshold
Exp3_SI_fit = polyfit(Exp3_SI(100:400,1),Exp3_SI(100:400,2),1);
Exp3_SI_line = Exp3_SI_fit(1)*(Exp3_SI(100:400,1)) + Exp3_SI_fit(2);
Exp3_SI_slope = (Exp3_SI_line(end) - Exp3_SI_line(1))/(Exp3_SI(400,1)-Exp3_SI(100,1));

figure
plot(Exp3_SI(1:5:end,1),Exp3_SI(1:5:end,2),'.')
hold on
grid on
plot(Exp3_SI(100:400,1),Exp3_SI_line,'r-')
title('Unity-Gain Follower for NMOS Differential Pair, I_{b} in Strong Inversion')
legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
hold off

figure
plot(Exp3_SI(1:5:end,1),Exp3_SI(1:5:end,2)-Exp3_SI(1:5:end,1),'.')
hold on
grid on
title('Unity-Gain Follower for NMOS Differential Pair, I_{b} at Threshold')
%legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{in} [V]')
ylabel('V_{out} [V]')
hold off
