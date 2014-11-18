function [M]=NetworkM(A)
N=max(max(A));
M=zeros(N);
for i=1:N
    B=A((A(:,1)==i),2:3);
    for j=1:3
        C=B((B(:,2)==j));
        M(i,C)=j;
    end
end
       
end

