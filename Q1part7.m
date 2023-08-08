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
% ackerman
qi=[0 0 0 0 0 1]*inv(phic)
k=qi*alphaA
eig(A-B*k)
% dc gain cl
gcl_dc=-C*inv(A-B*k)*B
syscl=ss(A-B*k,B,C,D)
sim('Q1p7')
figure(1)
subplot(3,2,1)
plot(x1)
grid on
ylabel('x1')
subplot(3,2,2)
plot(x2)
grid on
ylabel('x2')
subplot(3,2,3)
plot(x3)
grid on
ylabel('x3')
subplot(3,2,4)
plot(x4)
grid on
ylabel('x4')
subplot(3,2,5)
plot(x5)
grid on
ylabel('x5')
subplot(3,2,6)
plot(x6)
grid on
ylabel('x6')
figure 
plot(u)
grid on
ylabel('u')




