function [ idx ] = context_idx( context,dict )

    idx = 0;
    for i = 1:size(dict,1)
        if dict(i,:)==context
            idx=i;
            break
        end
    end

end

