function [nsur,vsur,fx]=NOA01(n,m)
format long
    %n=50;
    %m=100;
    function [r,A]=randcoeff(n)
        w=1.25;
%         r=rand(n,1)*2*w-w*ones(n,1);
%         A=rand(n,n)*2*w-w*ones(n,n);
        r=randn(n,1)*w;
        A=randn(n,n)*w;
    end
    function dx = genlotvol(t,x,r,A)
        
        dx = zeros(n,1);    % a column vector
        dx=x.*(r+A*x);
    end
    function dx=glt(t,x)
        dx=genlotvol(t,x,r,A);
    end
    [r,A]=randcoeff(n);
    options = odeset('RelTol',1e-4,'AbsTol',ones(n,1));
    [T,X] = ode45(@glt,[0 50],rand(n,1),options);
    figure()
    plot(X*m);
    figure()
    %hist(X(end,:)');
    scatter([1:n],log10(m*X(end,:)));
    fx=X(end,:)
    nsur=0;
    vsur=zeros(1,n);
    for i=1:n
        if m*fx(i)>1
            nsur=nsur+1;
            vsur(1,i)=1;
        end
    end
    nsur
    vsur

end