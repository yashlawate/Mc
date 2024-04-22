----------CDMA-Pyhon------------
import numpy as np
c1=[1,1,1,1]
c2=[1,1,1,1]
c3=[1,1,1,1]
c4=[1,1,1,1]
rc=[]
print("Enter the data bits:")
d1=int(input("Enter D1 :"))
d2=int(input("Enter D2 :"))
d3=int(input("Enter D3 :"))
d4=int(input("Enter D4 :"))
r1=np.multiply(c1,d1)
r2=np.multiply(c2,d2)
r3=np.multiply(c3,d3)
r4=np.multiply(c4,d4)
resultant_channel=r1+r2+r3+r4;
print("Resultant Channel", resultant_channel)
Channel=int(input("Enter the station to listen for C1=1,C2=2,C3=3,C4=4 :"))
if Channel == 1:
    rc = c1
elif Channel ==2:
    rc=c2
elif Channel ==3:
    rc=c3
elif Channel ==4:
    rc=c4
inner_product=np.multiply(resultant_channel,rc)
print("Inner Product",inner_product)
res1=sum(inner_product)
data=res1/len(inner_product)
print("Data bit that was sent",data)



--------------Simulated BER with BPSK--Matlab---------
clc;
clear all;
close all;
N=10^6
rand('state',100);
randn('state',200);
ip = rand(1,N)>0.5;
s=2*ip-1;
n=1/sqrt(2)*[randn(1,N)+j*randn(1,N)];
Eb_NO_dB = [-3:10];
for ii = 1:length(Eb_NO_dB);
y=s+10^(-Eb_NO_dB(ii)/20)*n;
ipHat = real(y)>0;
nErr(ii) = size(find([ip-ipHat]),2);
end
simBer = nErr/N;
theoryBer = 0.5*erfc(sqrt(10.^(Eb_NO_dB/10)));
close all
figure
semilogy(Eb_NO_dB,theoryBer,'b.-');
hold on 
semilogy(Eb_NO_dB,theoryBer,'mx-');
axis([-3 10 10^-5 0.5])
grid on 
legend('theory','simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('Bit error probability curve for BPSK modulation');
