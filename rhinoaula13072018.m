%
% Rhino arm example
%

close all;

% parameters
d1=1;
d2=1; 
d3=0;
d4=1;
d5=1;
d6=1;

%
% Joint Axis
x0=[1;0;0];
y0=[0;1;0];
z0=[0;0;1];
nullvec=[0;0;0];

h1=x0;
h2=z0;
h3=-y0;
h4=h3;
h5=h3;
h6=x0;
H=[h1 h2 h3 h4 h5 h6];

% Links
p01=x0*d1;
p12=z0*d2;
p23=nullvec;
p34=d4*x0;
p45=d5*z0;
p56=d6*x0;

P=[p01 p12 p23 p34 p45 p56];
type=[1 0 0 0 0 0]; % PRRRRP robot
n=6;

scale=0.3;plotsize=3;
fignum=1;figure(fignum)
theta=1;
while size(theta)>0
  theta=input(['enter theta vector (',num2str(n),'x1): ']);
  if size(theta)>0
    clf(fignum);
    [R,p]=fwdkin(theta,type,H,P,n);
    disp(R);disp(p)
    showarm(theta,type,H,P,n,fignum,scale,plotsize);
    disp('press any key to continue ...');
    pause;
  end
end
