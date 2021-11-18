%% Question 1 :          note : run each section seperately

clear all;
clc;

A = [-1 1;0 -2];

cvx_begin sdp

variable P(2,2) symmetric

% Contraints(Lyapanov LMI)

A'*P + P'*A <= -0.000001*eye(2); % A'*P + P*A < 0

P >= 0.000001*eye(2); % P > 0

cvx_end

cvx_status

P

% plotting the transient state for x = [1 1]'

tspan =[0 9];
X0 = [1;1];

[t,y] = ode45(@(t,X) A*X,tspan,X0);

figure(1);
plot(t,y)

%% Question 2 :

clear all;
clc;

A = [1 1;0 -2];
B = [0;1];

cvx_begin sdp

variable Q(2,2) symmetric
variable Y(1,2)

A*Q + Q*A' -B*Y-Y'*B' <= -0.000001*eye(2); 

Q >= 0.000001*eye(2);

cvx_end

cvx_status

P = inv(Q)

K = Y * P

% plotting the transient state for x = [1 1]'

tspan =[0 9];
X0 = [1;1];

[t,y] = ode45(@(t,X) (A-B*K)*X,tspan,X0);

figure(2);
plot(t,y)


%% Question 3 :

clear all;
clc;

A1 = [1 1;0 -2];
A2 = [-1 1;0 -2];
B = [0;1];

cvx_begin sdp

variable Q(2,2) symmetric
variable Y(1,2)



A1*Q + Q*A1' -B*Y-Y'*B' <= -0.000001*eye(2); 
A2*Q + Q*A2' -B*Y-Y'*B' <= -0.000001*eye(2);

Q >= 0.000001*eye(2);

cvx_end

cvx_status

P = inv(Q)

K = Y * P

% plotting the transient state for x = [1 1]'

tspan =[0 9];
X0 = [1;1];

[t,y] = ode45(@(t,X) sf_sys(K,X,t),tspan,X0);

figure(3);
plot(t,y)





