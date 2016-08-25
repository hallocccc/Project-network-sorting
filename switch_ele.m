% this function is to 
% switch two elements in the permutation

function p = switch_ele(p,xi,xj)
	temp = p(xi);
    p(xi) = p(xj);
    p(xj) = temp;
end

