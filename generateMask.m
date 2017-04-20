function [X,masks,maskGrid] = generateMask(steppedProfile,optic)

resolution      =  optic.resolution;
diam            = optic.diam;
numLayers       = optic.numLayers;
npts            = length(steppedProfile);
R               = diam/2;

% Phase profile r array
rPhase = linspace(0, R , npts);

% Create Mask Grid
nXpixels = round(diam*1e3/resolution);     % Calculate how many pixels are needed
if mod(nXpixels,2) == 0
    nXpixels = nXpixels + 1;    % defining there to be an odd number of pixels
end
X = linspace(-diam/2,diam/2,nXpixels);  % X array giving each pixel a position
maskGrid = zeros(nXpixels,nXpixels);    % blank mask grid (all zeros)

% Create total mask
disp('Generating temporary mask');
for j = 1:nXpixels
    for k = 1: nXpixels
        r = sqrt(X(j)*X(j) + X(k)*X(k));        % find distance to center of mask
        [~,indx] = min( abs(r-rPhase) );        % find which index of the phase profile this is closest to
        maskGrid(j,k) = steppedProfile(indx);   % assign the maskGrid the value of phase at this radius
    end
end

% Create individual masks
etchDepth = max(steppedProfile)/(numLayers-1);  % how deep is each etch
masks = {};                                     
for i = 1:numLayers
    tmpMask = maskGrid;                         % set up a temporary mask
    tmpMask(tmpMask < (i-.1)*etchDepth) = 0;    % everything smaller than etch layer must be etched - mask =0
    tmpMask(tmpMask >= (i-.1)*etchDepth) = 1;   % everything else must remain - mask=1
    masks{i} = tmpMask;                         % Move temporary mask to the mask array
end

end
