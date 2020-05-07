%% Indirect

In.Vout_1200 = (importdata("Circuit_Indirect_Vout_1200f_NEW.txt"));
In.Vout_800 = (importdata("Circuit_Indirect_Vout_800f_NEW.txt"));
In.Vout_80 = (importdata("Circuit_Indirect_Vout_80f_NEW.txt"));
[a, b, c] = importfile("Circuit_Indirect_Bode_80f_p.txt", [1, Inf]);
In.Bode_80 = [a b c];
[a, b, c] = importfile("Circuit_Indirect_Bode_800f_p.txt", [1, Inf]);
In.Bode_800 = [a b c];
[a, b, c] = importfile("Circuit_Indirect_Bode_1200f_p.txt", [1, Inf]);
In.Bode_1200 = [a b c];


figure()
yyaxis left
plot(In.Vout_1200(:,1),In.Vout_1200(:,2),'.')
ylabel('Input Votlage [V]')
hold on
yyaxis right
plot(In.Vout_1200(:,1),In.Vout_1200(:,3),'.')
axis([ 0 1.5e-6 2.3 2.7])
title('Output Voltage Response for a 4.4MHz Cycle for C = 1.2pF')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Output Votlage [V]')
hold off

figure()
subplot(2,1,1)
semilogx(In.Bode_1200(1:end,1),In.Bode_1200(1:end,2),'r.')
hold on
x = logspace(5, 8);
crossover_index = crossover(In.Bode_1200,0);
xline(In.Bode_1200(crossover_index,1), 'm')
plot(x, x*0, 'g')
title('Bode Plot for C = 1200f [F]')
hold off
axis([1e5 1e8 -60 20])
xlabel('Frequency [Hz]')
ylabel('Amplitude of Gain [dB]')
subplot(2,1,2)
semilogx(In.Bode_1200(1:end,1),In.Bode_1200(1:end,3),'b.')
hold on
x = logspace(5, 8);
plot(x, x*0-180, 'g')
crossover_index = crossover(In.Bode_1200,-180);
xline(In.Bode_1200(crossover_index,1), 'm')
hold off
axis([1e5 1e8 -200 200])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')

figure()
yyaxis left
plot(In.Vout_800(:,1),In.Vout_800(:,2),'.')
ylabel('Input Votlage [V]')
hold on
yyaxis right
plot(In.Vout_800(:,1),In.Vout_800(:,3),'.')
axis([ 0 1.5e-6 2.3 2.7])
title('Output Voltage Response for a 3.8MHz Cycle for C = 800fF')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Output Votlage [V]')
hold off

figure()
subplot(2,1,1)
semilogx(In.Bode_800(1:end,1),In.Bode_800(1:end,2),'r.')
hold on
x = logspace(5, 8);
crossover_index = crossover(In.Bode_800,0);
xline(In.Bode_800(crossover_index,1), 'm')
plot(x, x*0, 'g')
title('Bode Plot for C = 800f [F]')
hold off
axis([1e5 1e8 -60 20])
xlabel('Frequency [Hz]')
ylabel('Amplitude of Gain [dB]')
subplot(2,1,2)
semilogx(In.Bode_800(1:end,1),In.Bode_800(1:end,3),'b.')
hold on
x = logspace(5, 8);
plot(x, x*0-180, 'g')
crossover_index = crossover(In.Bode_800,-180);
xline(In.Bode_800(crossover_index,1), 'm')
hold off
axis([1e5 1e8 -200 200])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')

figure()
yyaxis left
plot(In.Vout_80(:,1),In.Vout_80(:,2),'.')
ylabel('Input Votlage [V]')
hold on
yyaxis right
plot(In.Vout_80(:,1),In.Vout_80(:,3),'.')
axis([ 0 2e-6 2.3 2.7])
title('Output Voltage Response for a 3.5MHz Cycle for C = 80fF')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('Time [s]')
ylabel('Output Votlage [V]')
hold off

figure()
subplot(2,1,1)
semilogx(In.Bode_80(1:end,1),In.Bode_80(1:end,2),'r.')
hold on
x = logspace(5, 8);
crossover_index = crossover(In.Bode_80,0);
xline(In.Bode_80(crossover_index,1), 'm')
plot(x, x*0, 'g')
title('Bode Plot for C = 80f [F]')
hold off
axis([1e5 1e8 -60 20])
xlabel('Frequency [Hz]')
ylabel('Amplitude of Gain [dB]')
subplot(2,1,2)
semilogx(In.Bode_80(1:end,1),In.Bode_80(1:end,3),'b.')
hold on
x = logspace(5, 8);
plot(x, x*0-180, 'g')
crossover_index = crossover(In.Bode_80,-180);
xline(In.Bode_80(crossover_index,1), 'm')
hold off
axis([1e5 1e8 -200 200])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')

%% Uncompensated
Un.Vout = (importdata("Circuit_Uncompensated.txt"));
[a, b, c] = importfile("Circuit_Uncompensated_Bode_p.txt", [1, Inf]);
Un.Bode = [a b c];

figure()
yyaxis left
plot(Un.Vout(:,1),Un.Vout(:,2),'.')
ylabel('Input Votlage [V]')
hold on
yyaxis right
plot(Un.Vout(:,1),Un.Vout(:,3),'.')
axis([ 0 3e-6 2 3])
title('Output Voltage Response for a 1MHz Cycle')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('time [s]')
ylabel('Output Votlage [V]')
hold off

figure()
subplot(2,1,1)
semilogx(Un.Bode(1:end,1),Un.Bode(1:end,2),'r.')
hold on
x = logspace(3, 10);
crossover_index = crossover(Un.Bode,0);
xline(Un.Bode(crossover_index,1), 'm')
plot(x, x*0, 'g')
title('Bode Plot for Uncompensated Amplifier')
hold off
axis([1e3 1e10 -100 20])
xlabel('Frequency [Hz]')
ylabel('Amplitude of Gain [dB]')
subplot(2,1,2)
semilogx(Un.Bode(1:end,1),Un.Bode(1:end,3),'b.')
hold on
x = logspace(3, 10);
%crossover_index = crossover(Un.Bode,-180);
%xline(Un.Bode(crossover_index,1), 'm')
plot(x, x*0-180, 'g')
hold off
axis([1e3 1e10 -200 50])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')

%% Feedforward Transconductance
Ff.Vout_7 = (importdata("Circuit_Feedforward_Vout_7dB.txt"));
[a, b, c] = importfile("Circuit_Feedforward_Bode_7dB_p.txt", [1, Inf]);
Ff.Bode_7 = [a b c];

Ff.Vout_20 = (importdata("Circuit_Feedforward_Vout_20dB.txt"));
[a, b, c] = importfile("Circuit_Feedforward_Bode_20dB_p.txt", [1, Inf]);
Ff.Bode_20 = [a b c];

figure()
yyaxis left
plot(Ff.Vout_7(:,1),Ff.Vout_7(:,2),'.')
ylabel('Input Votlage [V]')
hold on
yyaxis right
plot(Ff.Vout_7(:,1),Ff.Vout_7(:,3),'.')
axis([ 0 6e-7 2.1 2.83])
title('Output Voltage Response for Feedforwad Transconductance Compensation Based Amplifier with Matched Differential Pairs for a 50 MHz Cycle')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('time [s]')
ylabel('Output Votlage [V]')
hold off

figure()
subplot(2,1,1)
semilogx(Ff.Bode_7(1:end,1),Ff.Bode_7(1:end,2),'r.')
hold on
x = logspace(4, 11);
crossover_index = crossover(Ff.Bode_7,0);
xline(Ff.Bode_7(crossover_index,1), 'm')
plot(x, x*0, 'g')
title('Bode Plot for Feedforwad Transconductance Compensation Based Amplifier with Matched Differential Pairs')
hold off
axis([1e4 1e11 -80 20])
xlabel('Frequency [Hz]')
ylabel('Amplitude of Gain [dB]')
subplot(2,1,2)
semilogx(Ff.Bode_7(1:end,1),Ff.Bode_7(1:end,3),'b.')
hold on
x = logspace(4, 11);
%crossover_index = crossover(Un.Bode,-180);
%xline(Un.Bode(crossover_index,1), 'm')
plot(x, x*0-180, 'g')
hold off
axis([1e4 1e11 -100 10])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')

figure()
yyaxis left
plot(Ff.Vout_20(:,1),Ff.Vout_20(:,2),'.')
axis([ 0 1e-7 0.47 4.48])
ylabel('Input Votlage [V]')
hold on
yyaxis right
plot(Ff.Vout_20(:,1),Ff.Vout_20(:,3),'.')
axis([ 0 1e-7 2.30 2.50])
title('Output Voltage Response for Feedforwad Transconductance Compensation Based Amplifier with Unmatched Differential Pairs for a 50 MHz Cycle')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('time [s]')
ylabel('Output Votlage [V]')
hold off

figure()
subplot(2,1,1)
semilogx(Ff.Bode_20(1:end,1),Ff.Bode_20(1:end,2),'r.')
hold on
x = logspace(4, 11);
crossover_index = crossover(Ff.Bode_20,0);
xline(Ff.Bode_20(crossover_index,1), 'm')
plot(x, x*0, 'g')
title('Bode Plot for Feedforwad Transconductance Compensation Based Amplifier with Unmatched Differential Pairs')
hold off
axis([1e4 1e11 -90 40])
xlabel('Frequency [Hz]')
ylabel('Amplitude of Gain [dB]')
subplot(2,1,2)
semilogx(Ff.Bode_20(1:end,1),Ff.Bode_20(1:end,3),'b.')
hold on
x = logspace(4, 11);
% rossover_index = crossover(Ff.Bode_20,-180);
% xline(Ff.Bode_20(crossover_index,1), 'm')
plot(x, x*0-180, 'g')
hold off
axis([1e4 1e11 -100 10])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')