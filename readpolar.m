%% Function that takes in a .txt file version of VSPAERO's 
%% XXXX_DegenGeom.polar file and outputs [Beta, Mach, AoA, Re/1e6, CL, CDo,
%% CDi, CDtot, CS, L/D, E, CFx, CFy, CFz, CMx, CMy, CMz, CMl, CMm, CMn, T/QS]

function [Beta, Mach, AoA, Re_1e6, CL, CDo, CDi, CDtot, CS, L_D, E, CFx, CFy, CFz, CMx, CMy, CMz, CMl, CMm, CMn, T_QS]...
    = readpolar(filename)

% Read file and make arrays
data = readmatrix(filename);

% Split up the columns into their respective column vectors
Beta = data(:,1);               % Sideslip angle
Mach = data(:,2);               % Mach number
AoA = data(:,3);                % Angle of attack (alpha)
Re_1e6 = data(:,4);             % Reynolds number divided by 1*10^6
CL = data(:,5);                 % Total integrated lift coefficient
CDo = data(:,6);                % Skin friction drag coefficient (estimated parasitic drag)
CDi = data(:,7);                % Integrated induced drag coefficient
CDtot = data(:,8);              % Total drag coefficient (sum of CDo & CDi)
CS = data(:,9);                 % Sideforce coefficient
L_D = data(:,10);               % Lift to drag ratio (CL/CDtot)
E = data(:,11);                 % Oswald efficiency factor (Span efficiency)
CFx = data(:,12);               % x-direction force coefficient
CFy = data(:,13);               % y-direction force coefficient
CFz = data(:,14);               % z-direction force coefficient
CMx = data(:,15);               % x-axis moment coefficient
CMy = data(:,16);               % y-axis moment coefficient
CMz = data(:,17);               % z-axis moment coefficient
CMl = data(:,18);               % Rolling moment
CMm = data(:,19);               % Pitching moment
CMn = data(:,20);               % Yawing moment
T_QS = data(:,21);              % Thrust/(dynamic pressure * ref. area)

end

