function y = wijuv_vv(i,j,u,v,sigma1,n)

y = (expijuv(i,j,u,v,sigma1)*(v-j)^2/sigma1^2*huv(n,u,v,sigma1)+expijuv(i,j,u,v,sigma1)*1/-sigma1*huv(n,u,v,sigma1)+expijuv(i,j,u,v,sigma1)*(v-j)/-sigma1*huv_v(n,u,v,sigma1))*huv(n,u,v,sigma1)^2 ...
    -(expijuv(i,j,u,v,sigma1)*(v-j)/-sigma1*huv_v(n,u,v,sigma1)+expijuv(i,j,u,v,sigma1)*huv_vv(n,u,v,sigma1))*huv(n,u,v,sigma1)^2 ...
    -(expijuv(i,j,u,v,sigma1)*(v-j)/-sigma1*huv(n,u,v,sigma1)-expijuv(i,j,u,v,sigma1)*huv_v(n,u,v,sigma1))*2*huv(n,u,v,sigma1)*huv_v(n,u,v,sigma1);
y = y/huv(n,u,v,sigma1)^4;
