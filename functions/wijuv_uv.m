function y = wijuv_uv(i,j,u,v,sigma1,n)

y = (expijuv(i,j,u,v,sigma1)*(u-i)*(v-j)/sigma1^2*huv(n,u,v,sigma1)+expijuv(i,j,u,v,sigma1)*(u-i)/-sigma1*huv_uv(n,u,v,sigma1))*huv(n,u,v,sigma1)^2 ...
    -(expijuv(i,j,u,v,sigma1)*(v-j)/-sigma1*huv_u(n,u,v,sigma1)+expijuv(i,j,u,v,sigma1)*huv_uv(n,u,v,sigma1))*huv(n,u,v,sigma1)^2 ...
    -(expijuv(i,j,u,v,sigma1)*(u-i)/-sigma1*huv(n,u,v,sigma1)-expijuv(i,j,u,v,sigma1)*huv_u(n,u,v,sigma1))*2*huv(n,u,v,sigma1)*huv_v(n,u,v,sigma1);
y = y/huv(n,u,v,sigma1)^4;
