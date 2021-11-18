function X_dot = sf_sys(K,X,t)

A1 = [1 1;0 -2];
A2 = [0 1;0 -2];
A3 = [-1 1;0 -2];

B = [0;1];

if t>=0 && t<=3
    
    A = A1;
    
elseif t>3 && t<=6
    
    A = A2;
    
elseif t>6 && t<=9
    
    A = A3;
    
else
    
    A = A3;
    
end

u = - K*X;

X_dot = A*X + B*u;
    
end