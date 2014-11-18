function test(N,alpha)
%N=10;
% v=ones(1,N-1);
% M=diag(v,1);
% [sN,alive]=lifeform(M)
% M(N,1)=1;
% [sN,alive]=lifeform(M)
i=1:N;
j=[2:N,1];
v=ones(1,N);
M=sparse(i,j,v,N,N);%circle
[sN,alive]=lifeform2(M,alpha)
v(1,N)=0;
M=sparse(i,j,v,N,N);%line
[sN,alive]=lifeform2(M,alpha)
end