function y  = expijuv(i,j,u,v,sigma1)
%compute the exp({[u-i]^2+[v-j]^2}/-2sigma1)
% u = 0;v = 0;
exponent = -[(u-i)^2+(v-j)^2]/(2*sigma1);%zhishu
y = exp(exponent);
