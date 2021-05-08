function newI = ReflectEdge(I,d)

if size(I,3)==1
    newI = ReflectEdgeGray(I,d);
elseif size(I,3)==3
    newI = ReflectEdgeColor(I,d);
else 
    error('Incorrect image size')    
end
end

function newI = ReflectEdgeGray(I,d)
[m n] = size(I);
newI = zeros(m+2*d,n+2*d);

newI(d+1:d+m,d+1:d+n) = I;

newI(1:d,d+1:d+n) = I(d:-1:1,:);

newI(end-d:end,d+1:d+n) = I(end:-1:end-d,:);

newI(:,1:d) = newI(:,2*d:-1:d+1);

newI(:,m+d+1:m+2*d) = newI(:,m+d:-1:m+1);
end

function newI = ReflectEdgeColor(I,d)

[m n] = size(I);
newI = zeros(m+2*d,n+2*d,3);

newI(d+1:d+m,d+1:d+n,1:3) = I;

newI(1:d,d+1:d+n,1:3) = I(d:-1:1,:,1:3);

newI(end-d:end,d+1:d+n,1:3) = I(end:-1:end-d,:,1:3);

newI(:,1:d,1:3) = newI(:,2*d:-1:d+1,1:3);

newI(:,m+d+1:m+2*d,1:3) = newI(:,m+d:-1:m+1,1:3);
end