function [x] = test(a)
persistent k b

if(isempty(b))
    b = 1;
    k = 10;
end

k = k+a;
x = k;
end