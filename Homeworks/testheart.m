function [ptin,ptout]=testheart(xpts)
format long
X=[];
% xpts=500;
for i=0:xpts
    x(1)=i/xpts;
    for j=0:xpts
        x(2)=j/xpts;
        if ((4*(x(1)-0.5))^2+(4*(x(2)-0.4))^2-1)^3-(4*(x(1)-0.5))^2*(4*(x(2)-0.4))^3<0
            X=[X;x(1),x(2)];
        end
    end
end
% scatter(X(:,1),X(:,2),1);
% xlim([0 1]);
% ylim([0 1]);
ptin=length(X);
ptout=xpts^2-ptin;
end