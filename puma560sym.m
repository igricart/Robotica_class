%
% Elbow arm example
%

close all;

% inertial axis
x=[1;0;0];y=[0;1;0];z=[0;0;1];zerovec=[0;0;0];

% parameters
%d1=.6604;d2=.1495;d4=.4320;l2=.432;l3=.0203; %d6=.0565;
syms d1 d2 d4 l2 l3
syms t1 t2 t3 t4 t5 t6

theta=[t1;t2;t3;t4;t5;t6];

% rotational axis 
h1=z;h2=-y;h3=-y;h4=z;h5=-y;h6=z;
% interlink vectors
p01=zerovec;p12=d1*z;p23=-d2*y+l2*x;p34=-l3*x+d4*z;
p45=zerovec;p56=zerovec;

H=[h1 h2 h3 h4 h5 h6];
P=[p01 p12 p23 p34 p45 p56];
type=[0 0 0 0 0 0]; % 6R robot
n=6;

[R,p]=fwdkin(theta,type,H,P,n);

R=simplify(R);
R=subs(R,{'c1','s1','c2','s2','c3','s3','c4','s4','c5','s5','c6','s6'}, ...
    {'cos(t1)','sin(t1)','cos(t2)','sin(t2)','cos(t3)','sin(t3)',...
    'cos(t4)','sin(t4)','cos(t5)','sin(t5)','cos(t6)','sin(t6)'});
p=simplify(p);
p=subs(p,{'c1','s1','c2','s2','c3','s3','c4','s4','c5','s5','c6','s6'}, ...
    {'cos(t1)','sin(t1)','cos(t2)','sin(t2)','cos(t3)','sin(t3)',...
    'cos(t4)','sin(t4)','cos(t5)','sin(t5)','cos(t6)','sin(t6)'});

disp('*** R = ***');
pretty(R);
disp('*** p = ***');
pretty(p);
