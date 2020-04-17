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
Exp2_MI.Vout = (importdata("Experiment2_Threshold_Vout_sweep_Iout.txt"));
Exp2_MI.Vdm = (importdata("Experiment2_Threshold_Vdm_about_2_5_Iout.txt"));

figure()
plot(Exp2_MI.V2_3(1:25:3700,1)-3,Exp2_MI.V2_3(1:25:3700,2),'r.')
hold on
grid on
plot(Exp2_MI.V2_3(4300:25:end,1)-3,Exp2_MI.V2_3(4300:25:end,2),'b.')
plot(Exp2_MI.V2_3(3700:4300,1)-3,Exp2_MI.V2_3(3700:4300,2),'k.')
title('Voltage Characteristics for NMOS Differential Pair for bias current just at threshold')
legend('V_{2} = 3 [V], V_{1} < V_{2}','V_{2} = 3 [V], V_{1} \approx V_{2}',...
    'V_{2} = 3 [V], V_{1} > V_{2}','Location','Southeast','NumColumns',1)
xlabel('V_{dm} = V_{1} - V_{2} [V]')
ylabel('V_{out} [V]')
hold off

figure()
plot(Exp2_SI.V2_3(1:25:3700,1)-3,Exp2_SI.V2_3(1:25:3700,2),'r.')
hold on
grid on
plot(Exp2_SI.V2_3(4300:25:end,1)-3,Exp2_SI.V2_3(4300:25:end,2),'b.')
plot(Exp2_SI.V2_3(3700:2:4300,1)-3,Exp2_SI.V2_3(3700:2:4300,2),'k.')
title('Voltage Characteristics for NMOS Differential Pair for bias current above threshold')
legend('V_{2} = 3 [V], V_{1} < V_{2}','V_{2} = 3 [V], V_{1} \approx V_{2}',...
    'V_{2} = 3 [V], V_{1} > V_{2}','Location','Southeast','NumColumns',1)
xlabel('V_{dm} = V_{1} - V_{2} [V]')
ylabel('V_{out} [V]')
hold off

% Fit
MI_V2_3_fit = polyfit(Exp2_MI.V2_3(4000:4040,1)-3,Exp2_MI.V2_3(4000:4040,2),1);
MI_V2_3_line = MI_V2_3_fit(1)*(Exp2_MI.V2_3(3750:2:4100,1)-3) + MI_V2_3_fit(2);
MI_V2_3_slope = (MI_V2_3_line(end) - MI_V2_3_line(1))/(Exp2_MI.V2_3(4050,1)-Exp2_MI.V2_3(4000,1));

figure()
plot(Exp2_SI.V2_3(1:25:3700,1)-3,Exp2_SI.V2_3(1:25:3700,2),'r.')
hold on
grid on
plot(Exp2_SI.V2_3(4300:25:end,1)-3,Exp2_SI.V2_3(4300:25:end,2),'b.')
plot(Exp2_SI.V2_3(3700:2:4300,1)-3,Exp2_SI.V2_3(3700:2:4300,2),'k.')
plot(Exp2_SI.V2_3(3750:2:4100,1)-3,MI_V2_3_line,'g.')
title('Voltage Characteristics for NMOS Differential Pair for bias current above threshold')
legend('V_{2} = 3 [V], V_{1} < V_{2}','V_{2} = 3 [V], V_{1} \approx V_{2}',...
    'V_{2} = 3 [V], V_{1} > V_{2}','Line of Best Fit','Location','Southeast','NumColumns',1)
xlabel('V_{dm} = V_{1} - V_{2} [V]')
ylabel('V_{out} [V]')
hold off

% Fit
Exp2_MI.Vout(:,2) = -1 * Exp2_MI.Vout(:,2);
% Bounds could be index 251 to 401
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

%%
Exp2_MI.Vdm_fit = polyfit(Exp2_MI.Vdm(46:55,1),Exp2_MI.Vdm(46:55,2),1);
Exp2_MI.Vdm_line = Exp2_MI.Vdm_fit(1)*(Exp2_MI.Vdm(46:55,1)) + Exp2_MI.Vdm_fit(2);
Exp2_MI.Vdm_slope = (Exp2_MI.Vdm_line(end) - Exp2_MI.Vdm_line(1))/(Exp2_MI.Vdm(55,1)-Exp2_MI.Vdm(46,1));

figure()
plot(Exp2_MI.Vdm(:,1)-2.5,Exp2_MI.Vdm(:,2),'b.')
hold on
grid on
plot(Exp2_MI.Vdm(46:55,1)-2.5,Exp2_MI.Vdm_line,'r-')
title('Current Voltage Characteristics for NMOS Differential Pair')
%legend('Experimental Data','Fit Data','Location','Southeast','NumColumns',1)
xlabel('V_{dm} [V]')
ylabel('I_{out} [A]')
hold off
