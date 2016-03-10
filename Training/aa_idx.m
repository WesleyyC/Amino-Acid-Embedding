function [ i ] = aa_idx( AA )
%AA_IDX Summary of this function goes here
%   Detailed explanation goes here

AAs={'C','S','T','P','A','G','N','D','E','Q','H','R','K','M','I','L','V','F','Y','W'};

for i=1:20
    if AAs{i}==AA
        break;
    end

end

