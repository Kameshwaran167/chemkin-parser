function [h,s,hcp]=loader(spcs_inp,temp_inp)
tmp=temp_inp;
fid=fopen("therm.dat");
count=1;
while(fid>-1)
l=fgetl(fid);
l=strsplit(l,' ');
found=strmatch(spcs_inp,l,"exact");
notfound=strmatch('END',l,"exact");
if(found==1)
break;
elseif(notfound==1)
break;
endif
endwhile
if (notfound==1)
ts=[];
cs=[];
elseif(found==1)
l1=strjoin(l)
exp1='\d*[.]\d';
ts=regexp(l1,exp1,'match');
cs=cell(0,0);
for i=1:3
l2=fgetl(fid)
c=regexp(l2,'[- ].{10}[E].{3}','match');
c=strvcat(c);
cs(numel(cs)+1)=c;
endfor
endif

if(numel(cs)>0)
c=vertcat(cs{:});
[h,s,hcp]=converter(ts,c,tmp);
elseif(numel(cs)==0)
disp('Not found');
[h,s,hcp]={0,0,0}{:};
endif
fclose(fid);

return

endfunction

