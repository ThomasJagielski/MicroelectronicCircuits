[ex2_pmos.Vin,ex2_pmos.I] = importSimulationData('Experiment2_pmos.txt', [1, Inf]);

ex2_pmos.Vin = Vdd - ex2_pmos.Vin;

% FIND Ut
fit = polyfit(ex2_pmos.Vin(35:65),log(ex2_pmos.I(35:65)),1);
%line = exp((fit(1))*log(ex1_nmos.I) + ((fit(2))));
line = exp(fit(1) * ex2_pmos.Vin + fit(2));
slope = fit(1);
intercept = fit(2);
Ut_pmos = -1/fit(1);

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
