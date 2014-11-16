function [xx]=perceptron(x,v)
format long
n=length(v);
u(1)=x(1);
u(2)=x(2);
for i=3:n
    j=mod(i,2);
    if j==1
        u(i)=v(i-2,j)*x(i-2)+v(i-1,j)*x(i-1);
    else
        u(i)=v(i-3,j+2)*x(i-3)+v(i-2,j+2)*x(i-2);
    end
    if u(i)>1
        x(i)=1;
    else
        x(i)=0;
%         x(i)=u(i)/(1+u(i));
    end
%     x(i)=u(i)/(1+u(i));
%     x(i)=(u(i)/(1+u(i))-0.5)*2;
%     x(i)=u(i);
end
if u(n)>1
    xx=1;
else
    xx=0;
end
% u
% x
end