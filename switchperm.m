% this function is to randomly 
% switch m elements(n>2) for some iterations and
% then switch 2 elements randomly for 2000 iterations.

% p=p(randperm(numel(p)))  % repermutate

function [p, y, y2] = switchperm(A,p,m,n,y,y2)

fp = fvalue(A,p,n);
%% exchange m elements randomly
fp = fvalue(A,p,n);
    
for j = 1:8000
    p_new = p;
    pos = randperm(n,m); % pos stores m randomly selected elements
    P = p_new(pos);
    P = P(randperm(numel(P)));
    p_new(pos) = P;
    fpnew = fvalue(A,p_new,n);
        
    if fpnew<fp
        p=p_new;
        %break;
    end
end
    
    disp(m);

%% then exchange 2 elements randomly
itr = 0;
diff=1;
maxitr=2000;
while (itr < maxitr) && (diff<=n-1)
    i=1;
     
    while i+diff<n
        j=i+diff;
        xi=find(p==i);
        xj=find(p==j);
        p_new=switch_ele(p,xi,xj);
        fpnew=fvalue(A,p_new,n);
%      fp=fvalue(A,p,n);
        y=[y fp];
        y2=[y2 fpnew];
        if fpnew<fp
            p=p_new;
            fp = fpnew;
        end
    itr = itr+1;
    
    i=i+1;
    end
    
    diff = diff+1;
    if diff==n-1
        diff=1;
    end

end

end

