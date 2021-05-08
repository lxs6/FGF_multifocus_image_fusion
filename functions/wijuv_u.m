function y = wijuv_u(i,j,u,v,sigma1,n)

y  = expijuv(i,j,u,v,sigma1)*(u-i)/(-sigma1)*huv(n,u,v,sigma1) - expijuv(i,j,u,v,sigma1)*huv_u(n,u,v,sigma1);
y = y/huv(n,u,v,sigma1)^2;
