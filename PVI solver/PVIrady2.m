% 2x2 Systems
function S = PVIrady2(sss, a, b, t, y0, yy0, step)

% ---------------------------------------------------------------------
%
% This function solves initial value problems where we know info 
% about 1 point/instant (t). Being y0 the known value y(t), and yy0 the
% known value y'(t). Works only for 2x2 systems.
% 
%   Marcial Rodríguez
%   github.com/uborzz
%
% ---------------------------------------------------------------------
%
% Returns:
% S: 3 columns Matrix with the values of x , y and y'.
% 
% Input:
% sys: system model as character array (name of the file)
% a: start point
% b: end point
% step: step  :D
% t: instant of known values
%  
% --------------------------------------------------------------------
    
        [x,y] = ode45(sss,t:step:b,[y0,yy0]'); %right - forward
        [x2, y2] = ode45(sss,(t):-step:a,[y0,yy0]'); %left from IV point
        
        n=length(x2) 
        for i=1:n-1 %invert vectors
            t3(i) = x2(n+1-i); 
            x3(i) = y2(n+1-i,1);
            y3(i) = y2(n+1-i,2);
        end
        
       S = [[t3';x],[x3';y(:,1)], [y3';y(:,2)]]; %T, X, Y.

end
