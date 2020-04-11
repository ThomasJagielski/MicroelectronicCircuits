%% Experiment 1.

epsilon = 5e-4;
Vdd = 5;

SI.V2_3 = (importdata("NMOS_diff_pair_part_2_V2_3.txt"));
MI.V2_2 = (importdata("NMOS_diff_pair_V2_2.txt"));
MI.V2_3 = (importdata("NMOS_diff_pair_V2_3.txt"));
MI.V2_4 = (importdata("NMOS_diff_pair_V2_4.txt"));


figure()
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,3),'+','Color',[0,191,255]./255)
hold on
grid on
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,4),'*','Color',[135,206,250]./255)
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,3) - MI.V2_2(1:5:end,4),'.','Color',[65,105,225]./255)
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,3) + MI.V2_2(1:5:end,4),'x','Color',[30,144,255]./255)
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,3),'+','Color',[144,238,144]./255)
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,4),'*','Color',[0,255,0]./255)
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,3) - MI.V2_3(1:5:end,4),'.','Color',[107,142,35]./255)
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,3) + MI.V2_3(1:5:end,4),'x','Color',[0,128,0]./255)
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,3),'+','Color',[250,128,114]./255)
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,4),'*','Color',[255,127,80]./255)
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,3) - MI.V2_4(1:5:end,4),'.','Color',[255,0,0]./255)
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,3) + MI.V2_4(1:5:end,4),'x','Color',[128,0,0]./255)
title('Current-Gate Voltage Characteristics for NMOS Differential Pair')
xlabel('Voltage [V]')
ylabel('Current [A]')
legend('I_{1} as a function of V_{1}-V_{2}; V_{2} = 2 [V]',...
    'I_{2} as a function of V_{1}-V_{2}; V_{2} = 2 [V]',...
    'I_{1} - I_{2} as a function of V_{1}-V_{2}; V_{2} = 2 [V]',...
    'I_{1} + I_{2} as a function of V_{1}-V_{2}; V_{2} = 2 [V]',...
    'I_{1} as a function of V_{1}-V_{2}; V_{2} = 3 [V]',...
    'I_{2} as a function of V_{1}-V_{2}; V_{2} = 3 [V]',...
    'I_{1} - I_{2} as a function of V_{1}-V_{2}; V_{2} = 3 [V]',...
    'I_{1} + I_{2} as a function of V_{1}-V_{2}; V_{2} = 3 [V]',...
    'I_{1} as a function of V_{1}-V_{2}; V_{2} = 4 [V]',...
    'I_{2} as a function of V_{1}-V_{2}; V_{2} = 4 [V]',...
    'I_{1} - I_{2} as a function of V_{1}-V_{2}; V_{2} = 4 [V]',...
    'I_{1} + I_{2} as a function of V_{1}-V_{2}; V_{2} = 4 [V]',...
    'Location','South Outside','NumColumns',3)
hold off

figure()
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,2),'.','Color',[1,0,0])
hold on
grid on
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,2),'.','Color',[0,0,1])
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,2),'.','Color',[0,1,0])
title('Common-source node voltage, V , as a function of V_{1} ? V_{2}')
xlabel('V_{1} - V_{2} [V]')
ylabel('Node Voltage [V]')
legend('V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 4 [V]','Location','Southeast','NumColumns',1)
hold off

% Fits
MI_Idm_fit_2 = polyfit(MI.V2_2(365:456,1)-2,MI.V2_2(365:456,3)-MI.V2_2(365:456,4),1);
MI_Idm_line_2 = MI_Idm_fit_2(1)*(MI.V2_2(365:456,1)-2) + MI_Idm_fit_2(2);
MI_Idm_slope_2 = (MI_Idm_line_2(end) - MI_Idm_line_2(1))/(MI.V2_2(456,1)-MI.V2_2(365,1));

MI_Idm_fit_3 = polyfit(MI.V2_3(365:456,1)-3,MI.V2_3(365:456,3)-MI.V2_3(365:456,4),1);
MI_Idm_line_3 = MI_Idm_fit_3(1)*(MI.V2_3(365:456,1)-3) + MI_Idm_fit_3(2);
MI_Idm_slope_3 = (MI_Idm_line_3(end) - MI_Idm_line_3(1))/(MI.V2_3(456,1)-MI.V2_3(365,1));

MI_Idm_fit_4 = polyfit(MI.V2_4(365:456,1)-4,MI.V2_4(365:456,3)-MI.V2_4(365:456,4),1);
MI_Idm_line_4 = MI_Idm_fit_4(1)*(MI.V2_4(365:456,1)-4) + MI_Idm_fit_4(2);
MI_Idm_slope_4 = (MI_Idm_line_4(end) - MI_Idm_line_4(1))/(MI.V2_4(456,1)-MI.V2_4(365,1));

figure()
plot(MI.V2_2(365:456,1)-2,MI_Idm_line_2,'bo')
hold on
grid on
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,3) - MI.V2_2(1:5:end,4),'g.')
plot(MI.V2_3(365:456,1)-3,MI_Idm_line_3,'bo')
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,3) - MI.V2_3(1:5:end,4),'g.')
plot(MI.V2_4(365:456,1)-4,MI_Idm_line_4,'bo')
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,3) - MI.V2_4(1:5:end,4),'g.')
hold off

figure()
plot(SI.V2_3(1:5:end,1)-3, SI.V2_3(1:5:end,3),'+','Color',[144,238,144]./255)
hold on
grid on
plot(SI.V2_3(1:5:end,1)-3, SI.V2_3(1:5:end,4),'*','Color',[0,255,0]./255)
plot(SI.V2_3(1:5:end,1)-3, SI.V2_3(1:5:end,3) - SI.V2_3(1:5:end,4),'.','Color',[107,142,35]./255)
plot(SI.V2_3(1:5:end,1)-3, SI.V2_3(1:5:end,3) + SI.V2_3(1:5:end,4),'x','Color',[0,128,0]./255)
title('Current-Gate Voltage Characteristics for NMOS Differential Pair')
xlabel('Voltage [V]')
ylabel('Current [A]')
legend('I_{1} as a function of V_{1}-V_{2}; V_{2} = 3 [V]',...
    'I_{2} as a function of V_{1}-V_{2}; V_{2} = 3 [V]',...
    'I_{1} - I_{2} as a function of V_{1}-V_{2}; V_{2} = 3 [V]',...
    'I_{1} + I_{2} as a function of V_{1}-V_{2}; V_{2} = 3 [V]',...
    'Location','Southeast','NumColumns',2)
hold off

figure()
plot(SI.V2_3(1:5:end,1)-3, SI.V2_3(1:5:end,2),'.','Color',[1,0,0])
hold on
grid on
title('Common-source node voltage, V , as a function of V_{1} ? V_{2}')
xlabel('V_{1} - V_{2} [V]')
ylabel('Node Voltage [V]')
legend('V_{2} = 3 [V]','Location','Southeast','NumColumns',1)
hold off