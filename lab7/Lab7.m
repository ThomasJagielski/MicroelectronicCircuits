%% Experiment 1.

epsilon = 5e-4;
Vdd = 5;

SI.V2_3 = (importdata("NMOS_diff_pair_part_2_V2_3.txt"));
MI.V2_2 = (importdata("NMOS_diff_pair_V2_2.txt"));
MI.V2_3 = (importdata("NMOS_diff_pair_V2_3.txt"));
MI.V2_4 = (importdata("NMOS_diff_pair_V2_4.txt"));


figure()
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,3),'o','Color',[0.3290,0.3940, 0.3250])
hold on
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,4),'o','Color',[0.3290,0.3940, 0.3250])
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,3) - MI.V2_2(1:5:end,4),'o','Color',[0.3290,0.3940, 0.3250])
plot(MI.V2_2(1:5:end,1)-2, MI.V2_2(1:5:end,3) + MI.V2_2(1:5:end,4),'o','Color',[0.3290,0.3940, 0.3250])
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,3),'.','Color',[0.5290,0.5940, 0.5250])
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,4),'.','Color',[0.5290,0.5940, 0.5250])
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,3) - MI.V2_3(1:5:end,4),'.','Color',[0.5290,0.5940, 0.5250])
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,3) + MI.V2_3(1:5:end,4),'.','Color',[0.5290,0.5940, 0.5250])
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,3),'*','Color',[0.7290,0.7940, 0.7250])
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,4),'*','Color',[0.7290,0.7940, 0.7250])
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,3) - MI.V2_4(1:5:end,4),'*','Color',[0.7290,0.7940, 0.7250])
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,3) + MI.V2_4(1:5:end,4),'*','Color',[0.7290,0.7940, 0.7250])
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
plot(MI.V2_3(1:5:end,1)-3, MI.V2_3(1:5:end,2),'.','Color',[0,0,1])
plot(MI.V2_4(1:5:end,1)-4, MI.V2_4(1:5:end,2),'.','Color',[0,1,0])
title('X')
xlabel('Voltage [V]')
ylabel('Voltage [V]')
legend('V_{2} = 2 [V]','V_{2} = 3 [V]','V_{2} = 4 [V]','Location','Southeast','NumColumns',1)
hold off
