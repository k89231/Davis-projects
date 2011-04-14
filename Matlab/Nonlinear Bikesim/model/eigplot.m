function eigplot

%% Defining variables:

parms.M0  = [  80.812100000000   2.323431426235;   2.323431426235  0.301265709342];
parms.C1 = [   0.000000000000  33.773869475930;  -0.848234478256  1.706965397923];
parms.K0 = [-794.119500000000 -25.739089291258; -25.739089291258 -8.139414705882];
parms.K2 = [   0.000000000000  76.406208759656;   0.000000000000  2.675605536332];

parms.A  = 0.074406;
parms.B  = 0.930081;
    
%% Calculate eigenvalues for different speeds

n  = 101;
v  = linspace(0,10,n);
e = zeros(4,n);

for i = 1:n
     e(:,i) = eigcalc(v(i),parms);
end

%% Calculate eigenvalues at points of interest

realmaxzero = @(v,parms)max(real(eigcalc(v,parms)));

v1 = fzero(@(v)realmaxzero(v,parms), 4);
v2 = fzero(@(v)realmaxzero(v,parms), 6);

%% plotten

% Real part
hold on; box on;
area([v1 v2 v2 v1 v1],[10 10 -10 -10 20],'FaceColor',[.9 .9 .9],'EdgeColor','none');
plot([v1 v2],[10 10],'k'); plot([v1 v2],[-10 -10],'k');
hr = plot(v,real(e),'-k');

% Imaginairy part
hi = plot(v,imag(e),':k');

% Legend, text & labels
legend([hr(1),hi(1)],'real','imag',1);