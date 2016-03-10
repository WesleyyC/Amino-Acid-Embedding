function [ score ] = aa_dist_vector( AA1, AA2, vector )
%AA_DIST Summary of this function goes here
%   Detailed explanation goes here
    i = aa_idx(AA1);
    j = aa_idx(AA2);
    
    score = 1- pdist([vector(i,:);vector(j,:)],'cosine');

end

