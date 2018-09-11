%
% SCARA arm example
%

close all;

% parameters
l0=1
l1=1; 
l2=1;
l34=.8;

% Joint Axis
h1=[0;0;1];
h2=h1;h3=h1;h4=h1;
H=[h1 h2 h3 h4];

% Links
%p01=zeros(3,1);p12=[0;l1;0];p23=[0;l2;0];p34=[0;0;l34];
p01=l0*h1;
p12=[0;l1;0.2];
p23=[0;l2;0];
p34=[0;0;-0.2];
P=[p01 p12 p23 p34];
type=[0 0 1 0]; % RRRP robot
n=4;

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
