function y = huv_uu(n,u,v,sigma1)
y = 0;
for i = -n:n
    for j = -n:n
   y = y + expijuv(i,j,u,v,sigma1)*[(u-i)/(-sigma1)]^2+expijuv(i,j,u,v,sigma1)*1/(-sigma1);
    end
end

