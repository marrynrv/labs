% The Nyquist method determines system stability by analyzing the transfer function's 
% Nyquist plot in the complex plane. The open-loop transfer function 
% G(s) = 2 / (s² + 4s + 8) (with K varying from 1 to 5) is analyzed. Stability 
% requires all poles to be in the left half of the complex plane. The system's stability 
% is determined by checking if the Nyquist plot encircles the critical point (-1,0). 
% Increasing K reduces phase and gain margins but does not destabilize the system.

% Defining the transfer function
% Transfer function: G(s) = 2 / (s^2 + 4s + 8)
numerator = 2;           
denominator = [1, 4, 8]; 
G = tf(numerator, denominator);

% Plotting the Bode plot
figure;
bode(G);
grid on;
title('Bode Plot');

% Plotting the Nyquist plot
figure;
nyquist(G);
grid on;
title('Nyquist Plot');

% Stability analysis
% Compute the poles of the transfer function
poles = pole(G);
disp('System poles:');
disp(poles);

% Stability check based on pole locations
if all(real(poles) < 0)
    disp('The system is stable because all poles have negative real parts.');
else
    disp('The system is unstable because one or more poles have positive real parts.');
end

% Investigating the effect of parameter changes
% Increasing the gain factor
K = 5; % New gain factor
G_new = K * G;

% Plotting the Bode plot for the new system
figure;
bode(G_new);
grid on;
title(['Bode Plot for the System with Gain K = ', num2str(K)]);

% Plotting the Nyquist plot for the new system
figure;
nyquist(G_new);
grid on;
title(['Nyquist Plot for the System with Gain K = ', num2str(K)]);
