%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Note: If the plot below does not contain all four functions,
%%%       the command window will spit out a warning: "Ignoring
%%%       extra legend entries". 
%%%
%%%       The code will still run, but the legend label might not 
%%%       correspond to the curve that's actually shown. 
%%%
%%%       It's recommended
%%%       you comment out the 'legend' command below unless plotting
%%%       all four curves at once. 
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 20;      % number of interpolation points
a = -1;      % left endpoint of interval
b = 1;       % right endpoint of interval


f = @(x) 1./(1.+25.*x.^2);      % create function 'handle'
                                % note the '.' after x in the quadratic
                                % term. If this is removed, code will break

xinterp = linspace(-1,1,N);     % equispaced interpolation points
yinterp = f(xinterp);           % values of f(x) at these points


Nplot = 1000;                   % number of evaluation/plotting points
xplot = linspace(-1,1,Nplot);   % xvals at which each function will be 
                                %    evaluated

ytrue = f(xplot);               % values of the true f(x) to be plotted

%%%%% get lagrange interpolant
ylagrange = lagrange(xplot,xinterp,yinterp);

%%%%% get chebyshev interpolant
c = chebyshev_coefficients ( a, b, N-1, f);
ycheb = chebyshev_interpolant ( a, b, N-1, c, Nplot, xplot );

%%%% get cubic spline interpolant
yspline = spline(xinterp,yinterp,xplot);
%                                   [this function is native to matlab and
%                                        doesn't require an extra .m file]


%%%% plot each function from -1 to 1
plot(xplot,ytrue,'g-o','MarkerIndices', 100:500:length(xplot),'MarkerSize',8); hold on;
plot(xplot,ylagrange,'r-s','MarkerIndices',400:500:length(xplot),'MarkerSize',8); hold on;
plot(xplot,ycheb, 'm-x','MarkerIndices', 300:500:length(xplot),'MarkerSize',8); hold on; 
plot(xplot,yspline,'b-p','MarkerIndices',200:500:length(xplot),'MarkerSize',8); hold on; 
axis([-1,1,-2,2])
legend('1/(1+x^2)', 'Lagrange', 'Chebyshev', 'Spline') % only call me if all four curves are plotted


