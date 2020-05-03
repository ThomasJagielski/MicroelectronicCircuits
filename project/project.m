%% Indirect

In.Vout_1200 = (importdata("Circuit_Indirect_Vout_1200f.txt"));
In.Vout_800 = (importdata("Circuit_Indirect_Vout_800f.txt"));
In.Vout_80 = (importdata("Circuit_Indirect_Vout_80f.txt"));
[a, b, c] = importfile("C:\Users\sbansal\Desktop\Circuits\MicroelectronicCircuits\project\Data\Processed\Circuit_Indirect_Bode_80f_p.txt", [1, Inf]);
In.Bode_80 = [a b c];
[a, b, c] = importfile("C:\Users\sbansal\Desktop\Circuits\MicroelectronicCircuits\project\Data\Processed\Circuit_Indirect_Bode_800f_p.txt", [1, Inf]);
In.Bode_800 = [a b c];
[a, b, c] = importfile("C:\Users\sbansal\Desktop\Circuits\MicroelectronicCircuits\project\Data\Processed\Circuit_Indirect_Bode_1200f_p.txt", [1, Inf]);
In.Bode_1200 = [a b c];


figure()
plot(In.Vout_1200(1:750,1),In.Vout_1200(1:750,2),'r.')
hold on
plot(In.Vout_1200(1:750,1),In.Vout_1200(1:750,3),'b.')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('time [s]')
ylabel('Votlage [V]')
hold off

figure()
plot(In.Vout_800(1:700,1),In.Vout_800(1:700,2),'r.')
hold on
plot(In.Vout_800(1:700,1),In.Vout_800(1:700,3),'b.')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('time [s]')
ylabel('Votlage [V]')
hold off

figure()
plot(In.Vout_80(1:950,1),In.Vout_80(1:950,2),'r.')
hold on
plot(In.Vout_80(1:950,1),In.Vout_80(1:950,3),'b.')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('time [s]')
ylabel('Votlage [V]')
hold off

figure()
subplot(2,1,1)
semilogx(In.Bode_80(1:end,1),In.Bode_80(1:end,2),'r.')
hold on
x = logspace(5, 8);
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
hold off
axis([1e5 1e8 -200 200])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')

figure()
subplot(2,1,1)
semilogx(In.Bode_800(1:end,1),In.Bode_800(1:end,2),'r.')
hold on
x = logspace(5, 8);
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
hold off
axis([1e5 1e8 -200 200])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')

figure()
subplot(2,1,1)
semilogx(In.Bode_1200(1:end,1),In.Bode_1200(1:end,2),'r.')
hold on
x = logspace(5, 8);
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
hold off
axis([1e5 1e8 -200 200])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')

%% Uncompensated
Un.Vout = (importdata("Circuit_Uncompensated.txt"));
[a, b, c] = importfile("C:\Users\sbansal\Desktop\Circuits\MicroelectronicCircuits\project\Data\Processed\Circuit_Uncompensated_Bode_p.txt", [1, Inf]);
Un.Bode = [a b c];

figure()
plot(Un.Vout(:,1),Un.Vout(:,2),'r.')
hold on
plot(Un.Vout(:,1),Un.Vout(:,3),'b.')
legend('V_{in}','V_{out}','Location','Southeast','NumColumns',1)
xlabel('time [s]')
ylabel('Votlage [V]')
hold off

figure()
subplot(2,1,1)
semilogx(Un.Bode(1:end,1),Un.Bode(1:end,2),'r.')
hold on
x = logspace(3, 10);
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
plot(x, x*0-180, 'g')
hold off
axis([1e3 1e10 -200 50])
xlabel('Frequency [Hz]')
ylabel('Phase Angle [°]')