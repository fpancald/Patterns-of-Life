function [X,nX,ptin,ptout]=testheartld(xpts,m1,m2)
format long
X=[];
nX=[];
% xpts=500;
for i=(m1-1)*xpts/2:m1*xpts/2
    x(1)=i/xpts;
    for j=(m2-1)*xpts/2:m2*xpts/2
        x(2)=j/xpts;
        if ((4*(x(1)-0.5))^2+(4*(x(2)-0.4))^2-1)^3-(4*(x(1)-0.5))^2*(4*(x(2)-0.4))^3<0
            X=[X;x(1),x(2)];
        else
           nX=[nX;x(1),x(2)];
        end
    end
end
scatter(X(:,1),X(:,2),1);
xlim([0 1]);
ylim([0 1]);
ptin=length(X);
ptout=xpts^2-ptin;
end