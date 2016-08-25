% this function is to calculate 
% the value of objective function

function f = fvalue(A,p,n)

% f=0;
% for i = 1:n
%     for j = (i+1):n
%         f = f + A(i,j)*(find(p==i)-find(p==j))^2;
%     end
% end


[~,l] = sort(p); % find each person's location
d = bsxfun(@minus,l,l') .^ 2; % calculate distance
f = sum(sum(A .* d)) / 2; % calculate gross cost

end

