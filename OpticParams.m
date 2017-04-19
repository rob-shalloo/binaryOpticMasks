%% Optic Parameters

% Physical parameters of optic
optic.diam    = 50.8;  % diameter of optic (mm)
optic.type    = 'axilens'; % which kind of optic
optic.alpha   = 5.0;      % approach angle of axicon rays (deg) [for 'axicon']
optic.f0      = 385.0;    % distance to axilens focus (mm) [for 'axilens']
optic.Dz      = 50.0;     % length of axilens focus (mm) [for 'axilens']
optic.n       = 1.4533;   % Refractive index of optic (Fused silica = 1.4533)

% Beam Parameters
optic.lambda = 0.8        % wavelength of Ti:Sapphire (um)

% Photolithography Params
optic.numLayers = 8       % How many layers are to be used in the optic
optic.resolution = 100.0    % minimum feature size which can be etched (um)

% Computation Parameters
npts = 1000                % How many points are to be used radially

% Phase profile required on optic
[r,phase] = findPhaseProfile(npts,optic);    % find the radial phase profile required

% Fourier Optic Profile
[fourProf,steppedFourProf] = findModProfile(phase,optic);

% Mask Construction
[X,masks] = generateMask(steppedFourProf,optic)


% Plots
figure
p1 = plot(r,fourProf,r,steppedFourProf)
set(p1,'LineWidth',2)



