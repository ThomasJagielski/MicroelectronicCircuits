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

%% Experiment 3
