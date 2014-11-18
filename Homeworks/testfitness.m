function [fit]=testfitness(xpts,v)
[X,nX,in,out]=testheart(xpts);
k=0;
for i=1:length(X)
        if perceptron(X(i,:),v)==1
            k=k+1;
        end
end
nk=0;
for j=1:length(nX)
        if perceptron(nX(j,:),v)==1
            nk=nk+1;
        end
end
fit=k/in-nk/out;
end