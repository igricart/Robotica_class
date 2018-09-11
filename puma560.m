%
% PUMA560 arm example
%

close all;

% inertial axis
x=[1;0;0];y=[0;1;0];z=[0;0;1];zerovec=[0;0;0];

% parameters 
% Standard DH
%d1=.6604;d2=.1495;d4=.4320;l2=.432;l3=.0203; %d6=.0565;
% Modified DH
d1=.6604;d3=.1495;d4=.4320;l2=.432;l3=.0203; %d6=.0565;

% rotational axis 
h1=z;h2=-y;h3=-y;h4=z;h5=-y;h6=z;
% interlink vectors
% SDH
%p01=zerovec;p12=d1*z;p23=-d2*y+l2*x;p34=-l3*x+d4*z;
%p45=zerovec;p56=zerovec;
% MDH
p01=d1*h1;p12=zerovec;p23=-d3*y+l2*x;p34=-l3*x+d4*z;
p45=zerovec;p56=zerovec;

H=[h1 h2 h3 h4 h5 h6];
P=[p01 p12 p23 p34 p45 p56];
type=[0 0 0 0 0 0]; % 6R robot
n=6;

scale=0.1;plotsize=1;
fignum=1; figure(fignum);
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
