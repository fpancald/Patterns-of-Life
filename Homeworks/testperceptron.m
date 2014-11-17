function testperceptron(xpts,v)
% v=[2 0
%     2 0
%     0 0];
% v=[0.7 1.5
%     1.5 0.7
%     2 0
%     -3 0
%     0 0];
% v=[1.7 0.7
%     1.7 0.7
%     2 0
%     -3 0
%     0 0];
% xpts=100;
X=[];

for i=0:xpts
    x(1)=i/xpts;
    for j=0:xpts
        x(2)=j/xpts;
        if perceptron(x,v)==1
            X=[X;x(1),x(2)];
        end
    end
end
scatter(X(:,1),X(:,2),1);
xlim([0 1]);
ylim([0 1]);
% hold on 
% testheart(xpts);
end