function [r,phase] = findPhaseProfile(npts,optic)

% Variables
lambda = optic.lambda;
diam = optic.diam;
alpha = optic.alpha;
Dz = optic.Dz;
f0 = optic.f0;
R = diam/2;

% Laser Parameters
k   = 2*pi/lambda;  % Wavenumber of radiation

% Computation params
r = linspace(0, R , npts);

if strcmp(optic.type , "axicon")
    phase = -k*sin(alpha*pi/180)*r;
elseif strcmp(optic.type,"axilens")
    phase = -k*R*R/(2*Dz)*log(f0 + Dz*(r.^2)/(R*R));
else
    phase = zeros(length(r));
    disp('Not a valid optic type - get some coffee and try again later');
end
    
end
    