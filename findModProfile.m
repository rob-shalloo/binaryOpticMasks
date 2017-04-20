function [profile,steppedProfile] = findModProfile(phase,optic)

lambda      = optic.lambda;
n           = optic.n;
numLayers   = optic.numLayers;

% Etch Depth
piShift = lambda/(2*(n-1));             % Length of material corresponding to pi phase shift
etchDepths = linspace(0,piShift,numLayers);      % Depth of each of the layers

% Ideal Phase Profile
phase = phase-min(phase);   % zero the phase, we're only interested in changes
profile = mod(phase,pi)/pi; % modular phase profile normalised to 1
profile = profile*piShift;  % Phase profile normalised to pi-shift etch depth

% Layering Optic
for i = 1:length(profile)
    [~,indx] = min(abs(profile(i)-etchDepths)); % find closest etch layer to map phase to
    steppedProfile(i) = etchDepths(indx);       % set stepped phase profile depth
end
    






end