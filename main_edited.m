% edited verson of first coding by Prof. Martin
clear;clc;
%% 
%generate the matrix(elements are between 0 and 1)
n = 30;
count=0; % count the # of permutations found with smaller function value
rng('default');
G = rand(n,2*n);
A = G*G';
A = A - floor(A);               
A = max(A,eye(n));        % matrix A
p = linspace(1,n,n);       % initialize permutation p
fp = fvalue(A,p,n);
y=[];      % store function values of the best solution
y2=[];    % store function values of p_new

%% exchange 2 elements randomly
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
          %count=count+1;
            p=p_new;
            fp = fpnew;
%             disp(p);
%             disp(fvalue(A,p,n));
%             disp(itr);
        end
    itr = itr+1;
    
    i=i+1;
    end
    
    diff = diff+1;
    if diff==n-1
        diff=1;
    end

end

%%

for m = 3:4

    % y and y2 is used for plotting
    [p, y, y2] = switchperm(A,p,m,n,y,y2);

end
%%
hold off
plot(y)
hold on
% plot(y2,'r')
% grid on
disp(fvalue(A,p,n));



