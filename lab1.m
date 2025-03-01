%The script models a discrete-time system by converting a continuous transfer function 
% into a discrete one using the Tustin method. A Gaussian noise input is filtered 
% through this system, and its output is analyzed. The script computes and visualizes the 
% autocorrelation, mean, and variance of the output signal over time. 
% Three plots are generated: autocorrelation, time series with mean, and variance evolution.
clc
clear
rng(2020)

K =2.2; 
Tf =1.1;
s=tf('s'); 
Wc=K/(Tf*s+1); 
Wd=c2d(Wc, 0.1, 'tustin'); 
b =Wd.numerator{1}; 
a =Wd.denominator{1};
Ts=0.1*Tf;  
T=1000; 
t=0:Ts:T;  
x1 = randn(1,length(t));
x=0.01*x1;
y=filter(b,a,x);
R=xcorr(y);  
tau=-15:Ts:15;
lt=length(tau);
s1r=round(length(R)/2-lt/2); 
s2r = round(length(R)/2+lt/2 - 1);
% Autocorrelation
figure(1)
clf
title("Correlation")
plot (tau, R(s1r:s2r),'LineWidth', 2)
grid on
grid minor
xlabel ("\tau")
ylabel ("Value")

M=zeros(1, length(t));  
D=zeros(1, length(t)); 
for i=1:length(t) 
    M(i)=mean(y(1:i));  
    D(i)=var(y(1:i)); 
end
% Mean
figure(2)
clf;
title("TimeSeries");
plot(t,y);
hold on
plot(t,M,"LineWidth",2)
grid on
grid minor
xlabel("Time");
ylabel("Label");

% Variance
figure(3)
clf
title("Time Series Variance")
plot(t, D, 'LineWidth', 2, 'Color', 'r')
grid on
grid minor
xlabel("Time")
ylabel("Variance")