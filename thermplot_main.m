clear all;
close all;
clc;
format long;
global sp=input('Species','s');
t=input('Temperature');
disp('');
[h,s,hcp]=loader(sp,t);