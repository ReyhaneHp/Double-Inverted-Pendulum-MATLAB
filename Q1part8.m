clc
clear all
close all
A=[0 1 0 0 0 0 ;  0 0 -10 0 -10 0; 0 0 0 1 0 0 ; 0 0 20 0 10 0 ; 0 0 0 0 0 1; 0 0 20 0 40 0]
B=[0 1 0 -1 0 -2]'
C=[1 0 0 0 0 0; 0 0 1 0 0 0 ;0 0 0 0 1 0]

D=[-30 0 0 ; 0 -30 0 ;0 0 -30]
Q=[0 0 0 1 0 0  ; 0 1 0 0 0 0 ; 0 0 0 0 1 0;1 0 0 0 0 0 ;0 0 0 0 0 1;0 0 1 0 0 0]
m=C*Q
Abar=inv(Q)*A*Q

A11=0
A22=zeros(3)
A12=[0    20    10
0   -10   -10
0    20    40]

A21=[0     1     0           
1     0     0          
0     0     1     ]
Lbar=D*inv(A21)+A11
T=A12+Lbar*A22-D*Lbar
L=[eye(3) Lbar]*inv(Q)
R=L*B
n=[C
   L]
inv(n)
f1=[ 1     0     0     
    30     0     0     
     0     1     0     
     0    30     0     
     0     0     1     
     0     0    30 ]
 
 f2=[ 0     0     0
     0     1     0
     0     0     0
     1     0     0
     0     0     0
     0     0     1]
 
 sim('Q1p8')

figure(1)
subplot(3,2,1)
plot(xhat1,'b-')
hold on 
plot(x1,'k-')
grid on
ylabel('x1')
legend('estimated state','real state')

subplot(3,2,2)
plot(xhat2,'b-')
hold on 
plot(x2,'k-')
grid on
ylabel('x2')
legend('estimated state','real state')


subplot(3,2,3)
plot(xhat3,'b-')
hold on 
plot(x3,'k-')
grid on
ylabel('x3')
legend('estimated state','real state')


subplot(3,2,4)
plot(xhat4,'b-')
hold on 
plot(x4,'k-')
grid on
ylabel('x4')
legend('estimated state','real state')


subplot(3,2,5)
plot(xhat5,'b-')
hold on 
plot(x5,'k-')
grid on
ylabel('x5')
legend('estimated state','real state')


subplot(3,2,6)
plot(xhat6,'b-')
hold on 
plot(x6,'k-')
grid on
ylabel('x6')
legend('estimated state','real state')
