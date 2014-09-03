function [xopt,fopt]=line_search(FUN,x0,sd,opt,T,varargin);
% Poszukiwanie na kierunku (by A. Korytowski)
% Przyk³adowe wywo³anie funkcji
% [xopt,fopt]=ls('fun',x0,sd,opt,T,varargin);
% fun - funkcja minimalizowana
% x0 - punkt pocz¹tkowy (parametry sterowania)
% sd - kierunek poszukiwania
% opt - struktura opt.gradd=rzut gradientu na kierunek poszukiwania=sd'g,
% gdzie sd - kier poszukiwania, g - gradient
% opt.maxstep = maksymalny krok
% opt.f0 - opcjonalnie wartoœæ funkcji celu w punkcie x0
% T - horyzont sterowania
% varargin - dodatkowe parametry potrzebne do wyliczenia funkcji celu

% FUN
diagn=0;
thr1=0.9;              % Próg spodziewanej wartoœci
thr2=0.1;              % Próg spodziewanej poprawy
sigma=3;               % Wspó³czynnik ekspansji
der=opt.gradd; 	       % Rzut gradientu na kierunek poszukiwania
smax=opt.maxstep;      % Maksymalny krok
global F_CNT;

s(1)=0;
if isfield(opt,'f0'), f(1)=opt.f0;
else f(1)=feval(FUN,s(1),x0,sd,T,varargin{:}); end
typ(1,:)='start ';                % Typ iteracji

[s(2),is2]=min([1,-f(1)/der,1/norm(sd),smax]);
des=['unit  ';'tangen';'normsd';'smax  '];
typ(2,:)=des(is2,:);
f(2)=feval(FUN,s(2),x0,sd,T,varargin{:});

delta=sigma*s(2);               % Pocz.krok ekspansji

it=2;
sm=min(smax,s(2)+delta);        % Apr.par.2-punktowa
a=(f(2)-f(1)-der*s(2))/s(2)^2;
if a>-0.5*der/sm,sm=-0.5*der/a;
else,delta=sigma*delta;end
pm=max(0,a*sm^2+der*sm+f(1));
if pm<thr1*min(f)|f(2)-pm>thr2*(f(1)-min(f))
    it=3;s(3)=sm;typ(3,:)='parab2';
    f(3)=feval(FUN,s(3),x0,sd,T,varargin{:});
    r(2)=(f(2)-f(1)-s(2)*der)/s(2)^2;  % Przygot.do a.s.3-p.
end

while f(1)==min(f) & s(it)>1e-16     % Apr.szeœc.3-punktowa
    r(it)=(f(it)-f(1)-s(it)*der)/s(it)^2;
    a=(r(it)-r(it-1))/(s(it)-s(it-1));
    b=r(it)-a*s(it);
    denom=b+sqrt(b^2-3*a*der);
    it=it+1;typ(it,:)='cubic3';
    if 3*abs(a)>abs(denom)
        s(it)=(denom-2*b)/(3*a);
    else s(it)=-der/denom;end
    f(it)=feval(FUN,s(it),x0,sd,T,varargin{:});
end
f;
if it==3 & min(s(2:3))>1e-16        % Apr.szeœc.3-punktowa
    sm=min(smax,max(s)+delta);j=1;
    r(3)=(f(3)-f(1)-s(3)*der)/s(3)^2;
    a=(r(3)-r(2))/(s(3)-s(2));
    b=r(3)-a*s(3);
    delt=b^2-3*a*der;
    if delt>1e-20
        denom=b+sqrt(delt);
        if 3*abs(a)>abs(denom)+1e-16
            [sm,j]=min([sm,(denom-2*b)/(3*a)]);
        elseif abs(denom)>1e-10
            [sm,j]=min([sm,-der/denom]);
        end
    end
    if j==1,delta=sigma*delta;end
    pm=max(0,a*sm^3+b*sm^2+der*sm+f(1));
    if pm<thr1*min(f)|min(f)-pm>thr2*(f(1)-min(f))
        it=it+1;s(it)=sm;typ(it,:)='cubic3';
        f(it)=feval(FUN,s(it),x0,sd,T,varargin{:});
    end
end

indz=1;
while it>3 & s(it)>1e-16           % Apr.szeœc.4-punktowa
    if indz
        [sorts,is]=sort(s);sortf=f(is);
        [fmin,imin]=min(sortf);
        if imin<it & it>5,break,end    % Zatrzymanie interpolacji
        dlmin=inf;
        for i=max(4,imin):min(imin+3,it)
            if dlmin>sorts(i)-sorts(i-3)
                dlmin=sorts(i)-sorts(i-3);
                ng=i;
            end
        end
    end
    z=sorts(ng-3:ng);w=sortf(ng-3:ng);
    if max(abs(diff(w)))<1e-10,break,end
    s12=z(1)-z(2);s13=z(1)-z(3);s14=z(1)-z(4);
    s23=z(2)-z(3);s24=z(2)-z(4);s34=z(3)-z(4);
    a1=w(1)/(s12*s13*s14);a2=-w(2)/(s12*s23*s24);
    a3=w(3)/(s13*s23*s34);a4=-w(4)/(s14*s24*s34);
    b1=-a1*(z(2)+z(3)+z(4));b2=-a2*(z(1)+z(3)+z(4));
    b3=-a3*(z(1)+z(2)+z(4));b4=-a4*(z(1)+z(2)+z(3));
    c1=a1*(z(2)*z(3)+z(2)*z(4)+z(3)*z(4));
    c2=a2*(z(1)*z(3)+z(1)*z(4)+z(3)*z(4));
    c3=a3*(z(1)*z(2)+z(1)*z(4)+z(2)*z(4));
    c4=a4*(z(1)*z(2)+z(1)*z(3)+z(2)*z(3));
    d1=-a1*z(2)*z(3)*z(4);d2=-a2*z(1)*z(3)*z(4);
    d3=-a3*z(1)*z(2)*z(4);d4=-a4*z(1)*z(2)*z(3);
    a=a1+a2+a3+a4;b=b1+b2+b3+b4;
    c=c1+c2+c3+c4;d=d1+d2+d3+d4;
    sm=-1;
    delt=b^2-3*a*c;
    if delt>1e-20
        denom=b+sqrt(delt);
        if 3*abs(a)>abs(denom)+1e-16
            sm=(denom-2*b)/(3*a);
        elseif abs(denom)>1e-10
            sm=-c/denom;
        end
    end
    
    if ~indz
        indz=1;
        if imin==ng-1
            [sm,j]=max([sm,z(3)+0.2*(z(4)-z(3))]);
        elseif imin==ng-2
            [sm,j]=min([sm,z(2)-0.2*(z(2)-z(1))]);
        end
    else
        j=1;
        if imin==ng
            if ng==it
                if sm<=z(3)
                    sm=min(max(s)+delta,smax);
                    delta=sigma*delta;
                else
                    [sm,jj]=min([sm,max(s)+delta,smax]);
                    if jj==2,delta=sigma*delta;end
                end
            elseif sm<=z(3)|sm>0.5*(z(4)+sorts(ng+1))
                indz=0;ng=ng+1;
            end
        elseif imin==ng-3
            if sm>=z(2)|sm<0.5*(z(1)+sorts(ng-4))
                indz=0;ng=ng-1;
            end
        end
    end
    if indz
        if j==1,pm=max(0,a*sm^3+b*sm^2+c*sm+d);
        else,pm=0;end
        if pm<thr1*min(f)|min(f)-pm>thr2*(f(1)-min(f))
            it=it+1;s(it)=sm;typ(it,:)='cubic4';
            f(it)=feval(FUN,s(it),x0,sd,T,varargin{:});
        else,break,end
    end
end

[fopt,iopt]=min(f);
if s(iopt)>1e-16,
    if isempty(sd), xopt=x0; else xopt=x0+s(iopt)*sd; end
else
    fopt=f(1); xopt=x0;
end

if diagn
    disp(' ');clear spacje;spacje(1:length(s),1:3)=' ';
    disp([num2str(s',10) spacje num2str(f',10) spacje typ]);
    if diagn>1
        sssmax=max(s);
        sss=[0:.01*sssmax:sssmax];
        for iii=1:length(sss)
            fiii(iii)=feval(FUN,sss(iii),x0,sd,T,varargin{:});
            F_CNT=F_CNT-1;
        end
        [zzz,isss]=sort([sss s]); fiii=[fiii f]; fiii=fiii(isss);
        figure(1),plot(s,f,'r.',zzz,fiii);
        pause
    end
end

