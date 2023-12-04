clc
close all
clear all
%% open loop impulse and step response 
t = 0:0.001:5; %%%% time
s = tf('s'); %%laplace variable 
sysH = (2*s+1)/(s^2+2*s+5); %transfer function 
y=impulse(sysH,t);
yy=step(sysH,t);
figure(1)
subplot(1,2,1)
plot(t,y,'LineWidth',2);
grid on 
xlabel('t [s]');
ylabel('h(t), impulse');
subplot(1,2,2)
plot(t,yy,'LineWidth',2);
grid on 
xlabel('t [s]');
ylabel('h(t), step');
%% closed-loop proportional output
t = 0:0.001:25;
K=111;
sysCLH =K*(2*s+1)/(s^2+(2+2*K)*s+5+K);
yyy = step(sysCLH,t);
figure(2)
plot(t,yyy,'LineWidth',2);
grid on 
xlabel('t [s]');
ylabel('h(t), closed-loop');
%% closed-loop proportional error
sysE = (s^2+2*s+5)/(s^2+(2+2*K)*s+5+K);
err = step(sysE,t);
figure(3)
plot(t,err,'LineWidth',2)
grid on 
xlabel('t [s]');
ylabel('e(t), closed-loop');
%% closed-loop integral output
t = 0:0.001:25;
K=1;
sysCLHI =K*(2*s+1)/(s^3+2*s^2+(5+2*K)*s+K);
yyyy = step(sysCLHI,t);
figure(4)
plot(t,yyyy,'LineWidth',2);
grid on 
xlabel('t [s]');
ylabel('h(t), closed-loop');
%ylim([-2 2]);
%% closed-loop integral controller, plotting the error signal for constant reference signal
K=3
t = 0:0.001:25;
sysE = s*(s^2+2*s+5)/(s^3+2*s^2+(5+2*K)*s+K);
err = step(sysE,t);
figure(5)
plot(t,err,'LineWidth',2)
grid on 
xlabel('t [s]');
ylabel('e(t), closed-loop');
