%% Optic Parameters

% Physical parameters of optic
optic.diam    = 50.8;  % diameter of optic (mm)
optic.type    = 'axilens'; % which kind of optic
optic.alpha   = 5.0;      % approach angle of axicon rays (deg) [for 'axicon']
optic.f0      = 385.0;    % distance to axilens focus (mm) [for 'axilens']
optic.Dz      = 50.0;     % length of axilens focus (mm) [for 'axilens']
optic.n       = 1.4533;   % Refractive index of optic (Fused silica = 1.4533)

% Beam Parameters
optic.lambda = 0.8;        % wavelength of Ti:Sapphire (um)

% Photolithography Params
optic.numLayers = 8;       % How many layers are to be used in the optic
optic.resolution = 100.0;    % minimum feature size which can be etched (um)

% Computation Parameters
npts = 1000;                % How many points are to be used radially

% Phase profile required on optic
[r,phase] = findPhaseProfile(npts,optic);    % find the radial phase profile required

% Fourier Optic Profile
[fourProf,steppedFourProf] = findModProfile(phase,optic);

% Mask Construction
[X,masks,totalMask] = generateMask(steppedFourProf,optic);

% Output GDS File
createGDS(r,steppedFourProf,optic);

% Plots
figure
subplot(3,1,1)
p1 = plot(r,phase);
pbaspect([1 1 1])
subplot(3,1,2)
p2 = plot(r,fourProf,r,steppedFourProf);
pbaspect([1 1 1])
set(p1,'LineWidth',2);
set(p2,'LineWidth',2);
subplot(3,1,3)
imagesc(totalMask);
pbaspect([1 1 1])
figure
for i = 1:optic.numLayers
    subplot(optic.numLayers,1,i)
    imagesc(masks{i})
    pbaspect([1 1 1])
end




