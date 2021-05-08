function [y,y1,y3,y01,y0,y2,E_u,E_v] = filter_LMN(n,u,v,sigma1)
%computer the operator of directional neighborhood distance

y1 = zeros(1,1);y2 = y1;y3 = y2;y01 = y1;y0 = y1;E_u = y1;E_v = y1;
for i = -n:n
    for j = -n:n
        y1(i+n+1,j+n+1) = wijuv_uu(i,j,u,v,sigma1,n);
       y2(i+n+1,j+n+1) =  wijuv_uv(i,j,u,v,sigma1,n);
         y3(i+n+1,j+n+1) = wijuv_vv(i,j,u,v,sigma1,n);
        y01(i+n+1,j+n+1) = wijuv_uu(i,j,u,v,sigma1,n) + 2*wijuv_uv(i,j,u,v,sigma1,n)+wijuv_vv(i,j,u,v,sigma1,n);
        y0(i+n+1,j+n+1) = wijuv_uu(i,j,u,v,sigma1,n) - 2*wijuv_uv(i,j,u,v,sigma1,n)+wijuv_vv(i,j,u,v,sigma1,n);
        E_u(i+n+1,j+n+1) = wijuv_u(i,j,u,v,sigma1,n);E_v(i+n+1,j+n+1) = wijuv_v(i,j,u,v,sigma1,n);
    end
end
y = y01+y0;
y = -1*y/max(max(abs(y)));
y1  = -1*y1/max(max(abs(y1)));
y3 = -1*y3/max(max(abs(y3)));
y01 = -1*y01/max(max(abs(y01)));
y0 = -1*y0/max(max(abs(y0)));
y2 = -1*y2/max(max(abs(y2)));

