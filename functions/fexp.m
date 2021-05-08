function f3 = fexp(f1,s)
%fill with 2^(j-1) -1 zeros
if size(f1,1)>1
    %2-D
    f2 = zeros(size(f1,1),(2^(s-1))*size(f1,2));
%     f4 = zeros((2^(s-1))*size(f1,1),(2^(s-1))*size(f1,2));
    if s > 1
       
        for ii = 1:size(f1,1)
            temp = f1(ii,:);
            for in = 1:(s-1)
                temp(2,length(temp)) = 0;
                temp = temp(:)';
            end
            f2(ii,:) = temp;
        end
       
        f4 = [];
        for jj = 1:size(f2,2)
            temp = f2(:,jj)';
            for jn = 1:(s-1)
                temp(2,length(temp)) = 0;
                temp = temp(:)';
            end
            f4 = [f4,temp'];
        end
        f3 = f4;
%%
%delete the last all 0 row and col
        f41 = f4;
        f31  = find(sum(abs(f41))>0);
        f32 = find(sum(abs(f41'))>0);
        f3 = f4(1:f32(length(f32)),1:f31(length(f31)));

    else
        f3 = f1;
    end
 
else
    %  1-D
    if s > 1
        for i = 1:(s-1)
            f1(2,length(f1)) = 0;
            f1 = f1(:)';
        end
        f3 = f1;
    else
        f3 = f1;
    end
end

