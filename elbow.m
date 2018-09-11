%
% Elbow arm example
%

close all;

% parameters
l0=1; 
l1=1;
l2=1;

%
h1=[0;0;1];
h2=[-1;0;0];
h3=h2;
h4=[0;0;1];
h5=[-1;0;0];
h6=[0;1;0];

H=[h1 h2 h3 h4 h5 h6];
p01=zeros(3,1);p12=[0;0;l0];p23=[0;l1;0];p34=[0;l2;0];
p45=zeros(3,1);p56=zeros(3,1);

P=[p01 p12 p23 p34 p45 p56];
type=[0 0 0 0 0 0]; % 6R robot
n=6;

scale=0.3;plotsize=3;
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
