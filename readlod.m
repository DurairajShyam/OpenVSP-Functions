%% Function that takes in a .csv file version of VSPAERO's 
%% XXXX_DegenGeom.lod file at a particular integer angle of attack ranging 
%% from -9 to 20 degres and then outputs [Yavg, Chord, Cl, Cd, L_D]

function [Yavg, Chord, Cl, Cd, L_D] = readlod(filename, alpha)

% Number of spanwise collocation points
n = 36;

% Index of the angle of attack (considering 31 integers from -10 -> 20)
i = alpha + 10;

% Matrix start row
r = 65;

% Read file and make arrays
data = readmatrix(filename);

% Delete header NaNs at the start of the matrix
data(1:18,:) = [];

% Look for the particular set of data corresponding to the requested AoA
data_alpha = data(r*i:r*i+n,1:16);

% Split up the columns into their respective arrays
Yavg = data_alpha(:,4);               % Spanwise location
Chord = data_alpha(:,6);              % Local chord length
Cl = data_alpha(:,8);                 % Local lift coefficient
Cd = data_alpha(:,9);                 % Local drag coefficient
L_D = Cl./Cd;                         % Lift-to-drag ratio (Cl/Cd)

% number of points of lifting surface only
n_wing = 22;

% Reverse the order of the left wing and then swap the wings so that it is 
% from right to left (negative to positive) so that it looks normal when
% plotting
Yavg = [Yavg(fliplr(((n_wing)/2)+1:n_wing)); Yavg(1:(n_wing)/2)];
Chord = [Chord(fliplr(((n_wing)/2)+1:n_wing)); Chord(1:(n_wing)/2)];
Cl = [Cl(fliplr(((n_wing)/2)+1:n_wing)); Cl(1:(n_wing)/2)];
Cd = [Cd(fliplr(((n_wing)/2)+1:n_wing)); Cd(1:(n_wing)/2)];
L_D = [L_D(fliplr(((n_wing)/2)+1:n_wing)); L_D(1:(n_wing)/2)];

end
