function ecoli2(A)
    function dx = netA(t,x,A)
        k=1.2;
        n=length(A);
        dx = zeros(n,1);    % a column vector
        a=0.5;
        for i=1:n
            dx(i)=-a*x(i);
            dx(i)=dx(i)+sum(heaviside(x(find(A(i,:)==1))-k));
            dx(i)=dx(i)-sum(heaviside(x(find(A(i,:)==2)))-k);
            dx(i)=dx(i)+sum(heaviside(x(find(A(i,:)==3))-k))-sum(heaviside(k-x(find(A(i,:)==3))));
        end
    end
    function dx=net(t,x)
        dx=netA(t,x,A);
    end
    options = odeset('RelTol',1e-4,'AbsTol',1e-2*ones(length(A),1),'NonNegative', 1:length(A));
    [T,X] = ode45(@net,[0 50],10*rand(length(A),1),options);
    err=0.000000000001;
    X(end,:)=X(end,:)+2*err*rand(1,length(A))-err*ones(1,length(A));
    for ii=1:length(A)
        if X(end,ii)<0
            X(end,ii)=0;
        end
    end
        
    [TT,XX] = ode45(@net,[50 100],X(end,:),options);
    tt=[T;TT];
    xx=[X;XX];
    plot(tt,xx)
    
end