

mdl_planar2
xd=[0.366; 1.366]

q0=[0;30]*pi/180

qk=q0;

Q=[qk];

for i=1:20
    i
    %p2.plot(qk')
    jk=p2.jacob0(qk);

    jk=jk(1:2,1:2);

    Tk=p2.fkine(qk);
    xk=Tk(1:2,4)

    qk1=qk+0.4*inv(jk)*(xd-xk);

    qk=qk1;

    Q=[Q qk];
    %pause

end


p2.plot(Q', 'delay', 1, 'trail', '*')
