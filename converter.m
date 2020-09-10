function [h,s,hcp]=converter(ts,c,T)

tmin=str2double(ts(:,1));
tmid=str2double(ts(:,3));
tmax=str2double(ts(:,2));

cs=zeros(7,0);
if (T>tmid && T<=tmax)
trange=[tmid:tmax];
for i=1:7
cs(i,1)=str2double(c(i,:));
endfor
elseif(T>=tmin && T<=tmid)
trange=[tmin:tmid];
for i=8:14
cs(i-7,1)=str2double(c(i,:));
endfor
elseif(T<tmin)
disp('Temperature is too low');
[h,s,hcp]={0,0,0}{:};
return
elseif(T>tmax)
disp('Temperature is too high');
[h,s,hcp]={0,0,0}{:};
return
endif

a1=cs(1,1);
a2=cs(2,1);
a3=cs(3,1);
a4=cs(4,1);
a5=cs(5,1);
a6=cs(6,1);
a7=cs(7,1);
R=1.987;
hcp= a1 + a2* T + a3* T^2 + a4* T^3 + a5* T^4;
    
h= a1 + a2* T /2 + a3* T^2 /3 + a4* T^3 /4 + a5* T^4 /5 + a6/T;
    
s= a1* log(T) + a2* T + a3* T^2 /2 + a4* T^3 /3 + a5* T^4 /4 + a7;

printf('Properties at %f \n',T);
hcp=hcp*R
h=h*R*T
s=s*R

for i=1:length(trange)
[H(i),S(i),HCP(i)]=plotter(cs,trange(i));
endfor

subplot(1,3,1)
plot(trange,H)
xlabel("Range of Temperature in 'K'");
ylabel('Enthalpy in cal/mol');
title('H vs. T');
grid on;
subplot(1,3,2)
plot(trange,S)
xlabel("Range of Temperature in 'K'");
ylabel('Entropy in cal/mol-K');
title('S vs. T');
grid on;
subplot(1,3,3)
plot(trange,HCP)
xlabel("Range of Temperature in 'K'");
ylabel('Heat capacity in cal/mol-K');
title('Cp vs. T');
grid on;

return
endfunction