%% BCV code
function Y=Feng_Major_filt1(X,N);
 [r,s]=size(X);
 L1=round(r/N);
 L2=round(s/N);
 
 for r1=1:L1
     for r2=1:L2
          y{r1,r2}=X(N*r1-N+1:N*r1,N*r2-N+1:N*r2);  
          if sum(y{r1,r2}(:))>0.5*N^2;
              YY(r1,r2)=1;                          
          else YY(r1,r2)=0;                         
          end
     end
 end
  
YY=majority_consist_new(YY,15);                     
for i=1:L1
    for j=1:L2
       YYY{i,j}=ones(N,N)*YY(i,j);                  
    end
end

for i=1:N*floor(L1)
    for j=1:N*floor(L2)
        x1=ceil(i/N);         
        y1=ceil(j/N);       
        if mod(i,N)==0;    
            x2=N;
        else x2=mod(i,N);
        end
        if mod(j,N)==0;
           y2=N;
        else y2=mod(j,N);
        end
       Y(i,j)=YYY{x1,y1}(x2,y2);  
    end                          
end

