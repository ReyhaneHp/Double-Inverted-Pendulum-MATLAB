clc
clear all
close all
A=[0 1 0 0 0 0 ;  0 0 -10 0 -10 0; 0 0 0 1 0 0 ; 0 0 20 0 10 0 ; 0 0 0 0 0 1; 0 0 20 0 40 0]
B=[0 1 0 -1 0 -2]'
C=[0 0 1 0 0 0]
D=0
eig(A)
phic=ctrb(A,B)
rank(phic)
as=[1 0 -60 0 600 0 0]

alphaS=conv(conv(conv([1 1],[1 2]),conv([1 3],[1 4])),conv([1 5-2i],[1 5+2i]))
alphaA=alphaS(1)*A^6+alphaS(2)*A^5+alphaS(3)*A^4+alphaS(4)*A^3+alphaS(5)*A^2+alphaS(6)*A+alphaS(7)*eye(6)

% bass & gura
sai=[1 0 0 0 0 0 ;0 1 0 0 0 0 ;-60 0  1  0 0 0; 0 -60 0 1 0 0 ; 600 0 -60 0 1 0; 0 600 0 -60 0 1 ]'
alphaab=alphaS(2:end)
asaab=as(2:end)
k1=(alphaab-asaab)*inv(sai)*inv(phic)


% ackerman
qi=[0 0 0 0 0 1]*inv(phic)
k2=qi*alphaA

% canonical
Ac=[0 1 0 0 0 0 ;0 0 1 0 0 0 ;0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1;0 0 -600 0 60 0]
Bc=[0 0 0 0 0 1]'
phicC=ctrb(Ac,Bc)
T=phic*inv(phicC)
kc=[696 1690 1539 690 164 20]-[0 0 600 0 -60 0]
k3=kc*inv(T)
k=k3

eig(A-B*k)
