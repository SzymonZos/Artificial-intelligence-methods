function [Y]=funkcja_z_szumem(X)
Y=funkcja(X) + 0.1*randn(size(X));
end