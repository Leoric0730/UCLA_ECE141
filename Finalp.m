clc 
close all
clear all
%% closed-loop combination of propoertional and integral controller
t = 0:0.001:25; % time
s = tf('s'); %laplace variable
%% plotting error signal for constant reference signal
K = 3;
sysE = (s^2*(s+10)*s)/(s^2*(s+10)^2+K*(s+1)*5)
err = step(sysE,t);
figure(1)
plot(t,err,'LineWidth', 2)
grid on
xlabel('t[s]')
ylabel('e(t), closed-loop')