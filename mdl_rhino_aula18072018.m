

d2 =1;
d6=1;
a3 = 1;
a4=1;

%All link lengths and offsets are measured in m
clear L
%            theta    d           a       alpha
links = [
	    Link([0        0           0       -pi/2 1  1], 'modified')
		Link([0        d2          0       pi/2  0  3/2*pi], 'modified')
		Link([0        0           0      -pi/2  0 pi], 'modified')
		Link([0        0           a3       pi   0 3/2*pi], 'modified')
		Link([0        0           a4       pi   0 ], 'modified')
		Link([0        d6           0       pi/2 0 ], 'modified')
	];

links(1).qlim=[-1 1];

rhino=SerialLink(links, 'name', 'Rhino da aula do 18/7/2018');

rhino.plotopt = {'workspace', [-4 4 -4 4 -4 4], 'jointdiam' 2};

qz = [0 0 0 0 0 0];
