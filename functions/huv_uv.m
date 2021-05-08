function y = huv_uv(n,u,v,sigma1)

y = 0;test1 = [];
for i = -n:n
    for j = -n:n
   y = y + expijuv(i,j,u,v,sigma1)*[(u-i)/(-sigma1)]*[(v-j)/(-sigma1)];
    end
end
% y = 0;
