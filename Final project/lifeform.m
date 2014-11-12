function [sN,alive]=lifeform(conM,alpha)%N number of cell for individual, sN number of surviving cells and the end of the execution, alive=1 means survival alive=0 death
N=length(conM);
cells=ones(1,N);%vector with state of cell 0=dead 1=alive
%conM=ones(N,N);%connectivity matrix
%alpha=0.9;%feeding ability parameter
E=alpha*N;%Energy for each feeding cycle
sE=N^(3/4)/N;%metabolic parameter (at the moment we are using it only with the energy cost for each transport)
cellsE=1*cells;%energy required to keep each cell alive every index correspond to the energy still needed for that cell, during the feeding cycle it is gradually reduced when cells absorb energy till reaches 0
cellE=0*cells;%Energy given at time step 0 during feeding cycle to each cell
cellE(1,1)=E;% at the moment we are giving all energy to a single cell

for t=1:1000 %this will eventually be the number of time steps for each
%feeding cycle, not sure if we should keep it fixed or go on till we have
%no more residual energy
    for i=1:N %go through each cell and distribute energy if any present
        if cellE(1,i)==0%check energy available to the cell
            continue;
        else
            if cellsE(1,i)~=0%check energy still required
                ediff=cellsE(1,i)-cellE(1,i);%difference between energy required and available
                cellE(1,i)=0;%reset energy available at 0 (we are sending out all the energy, after taking what needed)
                if ediff<0%negative means there is more available than required
                    cellsE(1,i)=0;%set energy still required to 0
                    ediff=-ediff;%change residual energy sign
                    eT=ediff/sum(conM(i,:))-sE;% energy divided between connection after energy cost is deducted
                    if eT>=0%check enough energy for transport
                        cellE(1,find(conM(i,:)~=0))=cellE(1,find(conM(i,:)~=0))+eT;%distributeresidual energy equally between each node connected and detract energy cost
                    end
                else% positive difference means not enough available energy
                    cellsE(1,i)=ediff;%still needed energy reset to difference value
                end
            end
        end
    end
end
    for i=1:N% at the end of the time steps if a cell still need energy is signed as dead
        if cellsE(1,i)~=0
            cells(1,i)=0;
        end
    end

sN=sum(cells);%surviving cells
if sN>N/2%compute alive
    alive=1;
else
    alive=0;
end

end