%
% Rhino arm example
%

close all;

% parameters
l0=1;
l2=.5; 
l3=1;
l4=1;
%
x0=[1;0;0];y0=[0;1;0];z0=[0;0;1];nullvec=[0;0;0];
h1=y0;h2=z0;h3=-x0;h4=h3;h5=h3;h6=y0;
H=[h1 h2 h3 h4 h5 h6];
p01=y0*l0;
p12=nullvec;p23=l2*z0;p34=l3*y0;p45=l4*y0;p56=nullvec;
P=[p01 p12 p23 p34 p45 p56];
type=[1 0 0 0 0 0]; % PRRRRP robot
n=6;

scale=0.3;plotsize=3;
fignum=1; figure(fignum);
theta=1;
while size(theta)>0
  theta=input(['enter theta vector (',num2str(n),'x1) (e.g. [0 0 .. 0]): ']);
  if size(theta)>0
    clf(fignum);
    [R,p]=fwdkin(theta,type,H,P,n);
    disp(R);disp(p)
    showarm(theta,type,H,P,n,fignum,scale,plotsize);
    disp('press any key to continue ...');
    pause;
  end
end
