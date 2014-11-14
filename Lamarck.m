function Lamarck %Francesco Pancaldi
clear all
sTs=80;%starting survival temprature  
mT=1; %mutation temprature jump
eT=0;%epigenetic temprature jump
DT=20;%difference temprature certain death
sNb=100;%start bacteria number
BT=sTs*ones(1,sNb);%bacteria survival temprature vector
gON=zeros(1,sNb);%epigenetic gene ON switch
pR=0.15;% prob of reproduction
Ti=0.25;% temperature increase
T=79;%initial temperature
TT(1)=T;
gen=200;%number of time steps
avsT(1)=mean(BT);%average survival temperature at step 0


for i=1:gen
    l(i)=length(BT);
    sl=l(i);
    
    for n=1:sl
        if(n>length(BT))
            break;
        end
        if(T>(BT(n)+eT/2))%activation of epigenetic factor
            gON(n)=1;
        end
        if(T>BT(n)+gON(n)*eT) && (rand<=(T-BT(n)-gON(n)*eT)/DT)%cell death
            BT=BT([1:n-1, n+1:end]);
            gON=gON([1:n-1, n+1:end]);
            n=n-1;
        end
    end

    nl=length(BT);
    for n=1:nl
        RB=rand;
        if (RB<pR)%cell birth
            gON=[gON gON(n)];
            if(RB<pR/3)
                BT=[BT (BT(n)+mT)];%positive mutation
            elseif(RB<2*pR/3)
                BT=[BT (BT(n)-mT)];%negative mutation
            else
                BT=[BT (BT(n))];%no mutation
            end
        end
    end
    avsT(i+1)=mean(BT+gON*eT);
    T=T+Ti;
end


for i=2:gen+1
    TT(i)=TT(i-1)+Ti;
end
figure();
hold on
plot(avsT);
plot(TT);
title('Temperature T compared with average Tb');
xlabel('time step');
ylabel('Temp °C');

figure();
plot(l);   
title('Number of cells');
xlabel('time step');
ylabel('N');
            
end
