function [ score ] = aa_dist_similarity( AA1, AA2, B )
%AA_DIST_SIMILARITY Summary of this function goes here
%   Detailed explanation goes here
    i = aa_idx(AA1);
    j = aa_idx(AA2);
    
    score = B(i,j);

end

