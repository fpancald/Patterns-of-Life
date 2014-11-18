function ecoli(A)
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
    plot(T,X)
end