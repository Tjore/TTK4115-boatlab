function [Observability_matrix] = obs(A,C)
%OBS Regner observabilitet av A og C matrisene i et system
%   Ingen mer detaljert beskrivelse er nødvendig

Observability_matrix = obsv(A,C);
[r,c] = size(A);
if ((rank(Observability_matrix) == r)&&(rank(Observability_matrix)==c))
   fprintf('The system is observable \n');    
else
   fprintf('The system is not observable \n');
end

