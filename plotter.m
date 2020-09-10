function [H,S,Cp]=plotter(cs,T)
a1=cs(1,1);
a2=cs(2,1);
a3=cs(3,1);
a4=cs(4,1);
a5=cs(5,1);
a6=cs(6,1);
a7=cs(7,1);
R=1.987;
Cp= a1 + a2* T + a3* T^2 + a4* T^3 + a5* T^4;
    
H= a1 + a2* T /2 + a3* T^2 /3 + a4* T^3 /4 + a5* T^4 /5 + a6/T;
    
S= a1* log(T) + a2* T + a3* T^2 /2 + a4* T^3 /3 + a5* T^4 /4 + a7;

Cp=Cp*R;
H=H*R*T;
S=S*R;

endfunction