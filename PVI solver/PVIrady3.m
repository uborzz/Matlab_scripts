% 3x3 Systems
function S = PVIrady3(sss, a, b, t, y0, yy0, yyy0, step)

% ---------------------------------------------------------------------
%
% This function solves "initial value problems" where we know info 
% about 1 point/instant (t). Being y0 the known value y(t), yy0 the
% known value y'(t) and so on. Works only for 3x3 systems.
% 
%   Marcial Rodríguez
%   github.com/uborzz
%
% ---------------------------------------------------------------------
%
% Returns:
% S: 4 columns Matrix with the values of x , y, y' and y''.
% 
% Input:
% sys: system model as character array (name of the file)
% a: start point
% b: end point
% step: step  :D
% t: instant of known values
% y0, yy0, yyy0 = known values. 
% 
% ---------------------------------------------------------------------
    
        [x,y] = ode45(sss,t:step:b,[y0,yy0,yyy0]'); %right - forward
        [x2, y2] = ode45(sss,(t):-step:a,[y0,yy0,yyy0]'); %left from IV point
        
        n=length(x2) 
        for i=1:n-1 %invert vectors
            t3(i) = x2(n+1-i); 
            y3(i) = y2(n+1-i,1); 
            yy3(i) = y2(n+1-i,2); 
            yyy3(i) = y2(n+1-i,3); 
        end
        
       S = [[t3';x],[y3';y(:,1)], [yy3';y(:,2)], [yyy3';y(:,3)]]; %T, X, Y.

end
