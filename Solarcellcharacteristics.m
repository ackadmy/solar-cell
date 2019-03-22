clc
clear
G=1.0; %irradiance
ior=19.9693e-6;
tr=301.18; %Normial or referance temperature
iscr=3.3;
eg=1.1;ki=1.7e-3;a= 1.72e+00;k=1.380658e-23;
q=1.6e-19;
rs=5e-05; %series resistance.
rsh=5e+05; %parallel resistance rsh=rp
ns=40; % No of series cells.
np=2;
ta=25;
tc=ta+0.2*G+273.18;
isc=(iscr+ki*(tc-tr))*G; %short circuit current.
is=ior*(tc/tr)^3*exp(q*eg*((1/tr)-(1/tc))/(k*a));
IL=isc;
I=zeros(250,1);
i=1;
I(1,1)=0;
for v=25:-0.1:0;
I(i+1)=np*isc-(is*np*((exp(q*(v/ns+(I(i,1)*rs)/np)/(a*k*tc)))-1))-((v*np/ns+(I(i,1)*rs))/rsh);
v1(i)=v;
p(i)= v*I(i);
error=abs(I(i+1)-I(i,1));
if error<=0.00000001;
break
end
i=i+1;
end
v1(i)= v1(i-1);
p(i)=p(i-1);
plot(v1,I);
ylim ([0 10])
plot(v1,p);
ylim ([0 105])