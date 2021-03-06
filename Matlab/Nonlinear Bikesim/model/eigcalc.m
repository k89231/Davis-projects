function [e,V] = eigcalc(v,parms)

    M = parms.M0;
    C = parms.C1*v;
    K = parms.K0+parms.K2*v^2;
       
    A = [ zeros(2)        M;         M  C];
    B = [       -M zeros(2);  zeros(2)  K];
    
    [V,D] = eigs(-A\B,4);
    
    e = D*ones(4,1);
    
    % Manual adjustment for indices of first eigenvalue.
    ii = [2 1 4 3];
    if v == 0;
        e = e(ii);
        V = V(:,ii);
    end
    
end