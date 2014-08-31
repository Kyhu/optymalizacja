function [ streched_vector ] = strech_vector(vector, len)
%STRECH_VECTOR Funkcja skalujace wektor do porzadanej dlugosci
%  len - dlugosc wektora wynikowego
streched_vector = interp1(1:length(vector), vector, linspace(1, length(vector), len), 'linear');
end

