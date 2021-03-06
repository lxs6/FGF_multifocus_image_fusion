function y = wijuv_uu(i,j,u,v,sigma1,n)

y = (expijuv(i,j,u,v,sigma1)*(u-i)^2/sigma1^2*huv(n,u,v,sigma1)+expijuv(i,j,u,v,sigma1)*1/-sigma1*huv(n,u,v,sigma1)+expijuv(i,j,u,v,sigma1)*(u-i)/(-sigma1)*huv_u(n,u,v,sigma1))*huv(n,u,v,sigma1)^2 ...
    -(expijuv(i,j,u,v,sigma1)*(u-i)/-sigma1*huv_u(n,u,v,sigma1)+expijuv(i,j,u,v,sigma1)*huv_uu(n,u,v,sigma1))*huv(n,u,v,sigma1)^2 ...
    -(expijuv(i,j,u,v,sigma1)*(u-i)/-sigma1*huv(n,u,v,sigma1)-expijuv(i,j,u,v,sigma1)*huv_u(n,u,v,sigma1))*2*huv(n,u,v,sigma1)*huv_u(n,u,v,sigma1);
y = y/huv(n,u,v,sigma1)^4;
