function y = huv(n,u,v,sigma1)
%y = sigma i = -1:1,j = -1:1, exp((u-i)^2+(v-j)^2)/-2sigma1)
%n : the radius

y = 0;
for i = -n:n
    for j = -n:n
    y = y + expijuv(i,j,u,v,sigma1);
    end
end
% y  = 1;
