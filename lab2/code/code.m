clc;
clear all;
close all;
                   

XMAX = 10;                   
STEP = 0.5;               
TMAX = 10;                  

[x1, x2] = meshgrid(-XMAX: STEP: XMAX); 

%1a
dx = @(t, x) funcGrad(t, x);
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.01);
% plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); % строим фазовые траектории
% plotQuiver(x1, x2, dx); % строим стрелочки

%в окрестности первой особой точки(1;0)
% [x1, x2] = meshgrid(0.6: 0.1: 1.4,  -0.4: 0.1: 0.4); 
% plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); 
% plotQuiver(x1, x2, dx); % строим стрелочки

%в окрестности первой особой точки(0;0)
% [x1, x2] = meshgrid(-0.4: 0.04: 1,  -0.4: 0.04: 0.4); 
% plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); 
% plotQuiver(x1, x2, d); % строим стрелочки

%[x1, x2] = meshgrid(-XMAX: STEP: XMAX); 
%Для пункта Б - континуум особых точек 
dx = @(t, x) ContinuumFuncGrad(t, x);
plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); 
plotQuiver(x1, x2, dx); 
 
%Для пункта А - вырожденная особая точка
% dx = @(t, x) SpecialDotFuncGrad(t, x);
% plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); 
% plotQuiver(x1, x2, dx);

function dxdt = funcGrad(t, x)
dxdt(1, :) = x(2, :);
dxdt(2, :) = 5.*x(2, :).^2 + x(1, :).^2 - x(1, :);
end


function dxdt = SpecialDotFuncGrad(t, x)
dxdt(1, :) = x(2, :);
dxdt(2, :) = (sin(x(1, :)) .* x(2, :) + log2(1 + x(1, :).^2));
end

function dxdt = ContinuumFuncGrad(t, x)
dxdt(1, :) = x(2, :);
dxdt(2, :) = (x(2, :).^4 .* x(1, :) + x(2, :));
end
