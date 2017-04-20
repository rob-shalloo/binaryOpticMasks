function layerParams = findLayerParams(r,lineout)

% steps through lineout counting the amount of circle elements required

layerParams = {};

% Pad the edge of the lineout with a set of 2 zeros to ensure the mask ends
% in a zero
lineout = [lineout 0 0];
% padd the r array too
dr= r(1)-r(2);
r = [r (r(end)+dr) (r(end)+2*dr)];

% variables
r = r*1e3; % convert the radius to microns

if lineout(1) ==1
    % The first element will be a disk and the rest rings
    layerParams{1}.w = -1; % The first element is a disk
    
    % take derivative of lineout 
    spikey = diff(abs(lineout));
    [~,locs] = findpeaks(abs(spikey)); %contains all points where mask filps from 1-0 or 0-1
    locs = locs+1; % The plus one is because diff removes first element of array
    
    % the first element of this is where the central disk ends
    layerParams{1}.r = r(locs(1));
    
    % remove the first element
    locs = locs(2:end);
    
    % the number of remaining elements is even (or should be)
    for j = 1:length(locs)/2
        layerParams{j+1}.r = r(locs(2*j));
        layerParams{j+1}.w = r(locs(2*j))-r(locs(2*j-1));
    end
  
    
    
else
    % all elements are rings
    % take derivative of lineout 
    spikey = diff(abs(lineout));
    [~,locs] = findpeaks(abs(spikey)); %contains all points where mask filps from 1-0 or 0-1
    locs = locs+1; % The plus one is because diff removes first element of array
    
    % the number of remaining elements is even (or should be)
    for j = 1:length(locs)/2
        layerParams{j}.r = r(locs(2*j));
        layerParams{j}.w = r(locs(2*j))-r(locs(2*j-1));
    end
end

end