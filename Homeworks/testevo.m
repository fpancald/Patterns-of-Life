xpts=100;
told=testfitness(xpts,v);
n=length(v);
for j=1:n
    iter=10;
    cng=0.1;
for i=1:iter
v(j,1)=v(j,1)+cng;
tnew=testfitness(100,v);
if told>=tnew
    v(j,1)=v(j,1)-cng;
    break;
else
    told=tnew
end
end

for i=1:iter
v(j,1)=v(j,1)-cng;
tnew=testfitness(100,v);
if told>=tnew
    v(j,1)=v(j,1)+cng;
    break;
else
    told=tnew
end
end

for i=1:iter
v(j,2)=v(j,2)+cng;
tnew=testfitness(100,v);
if told>=tnew
    v(j,2)=v(j,2)-cng;
    break;
else
    told=tnew
end
end

for i=1:iter
v(j,2)=v(j,2)-cng;
tnew=testfitness(100,v);
if told>=tnew
    v(j,2)=v(j,2)+cng;
    break;
else
    told=tnew
end
end

end
told