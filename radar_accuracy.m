% the plant and controller
G = zpk([],[ -8 -0.75 0 ], 400e-6);
K = 75e3;

% the loop-gain
L = K*G;

% the sensitivity and complimentary sensitivity
S = feedback(1,L);
T = feedback(L,1);

% closed-loop characteristics
damp(S)

% the reference
t = linspace(0,100,1000);
V = 5;
r = V*t;

% get the closed-loop response
e = lsim(S,r,t);
y = lsim(T,r,t);

% plot some stuff
figure(1),
plot(t,e)
xlabel('time (s)')
ylabel('error (deg)')

figure(2),
plot(t,r,t,y)
xlabel('time (s)')
ylabel('azimuth (deg)')
xlim([ 0 20 ])
