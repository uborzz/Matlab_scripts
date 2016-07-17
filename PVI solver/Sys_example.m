function z=Sys_example(x,xx)
% y''' =  y'' + y' + y -x - 1
z(1)=xx(2); % y' = u
z(2)=xx(3); % u' = v
z(3)=+xx(1)+xx(2)+xx(3)-x-1; % v' = v+u+y-1-x
z=z';
