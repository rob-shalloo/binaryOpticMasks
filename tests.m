function [xArr,yArr] = polygonRing(r,w,numV)
dTheta = 2*pi/numV;
theta = linspace(0,2*pi,numV)

% outter Circle
xArr = r*cos(theta);
yArr = r*sin(theta);

if w > 0 
    % Transition to inner circle
    xArr = [xArr xArr(end)-w];
    yArr = [yArr yArr(end)];

    % inner circle
    xArrTemp = (r-w)*cos(-theta);
    yArrTemp = (r-w)*sin(-theta);

    % transition to outter circle
    xArrTemp = [xArrTemp xArrTemp(end)+w];
    yArrTemp = [yArrTemp yArrTemp(end)];

    % combine
    xArr = [xArr xArrTemp];
    yArr = [yArr yArrTemp];
end


end
