%******************************************************
%      Monte Carlo Code for Numerical Integration
%      Three Numerical Examples will be Analysed here
%      1. Exponent Function e.g.    exp^x
%      2. Power Function e.g.       2^x
%      3. Polynomial Function e.g.  x^3
%******************************************************

clc;
clear;
close all;

%------------------------
%-                      -
%-    f(x) = exp^x      -
%-                      -
%------------------------

f = @(x) exp(x);
xint = [0,2];
yint = [0,exp(2)];
fplot(f,xint,'LineWidth',2)
xlabel('x')
ylabel('f(x) = exp(x)')
title('Monte Carlo simulation of f(x) = exp(x) in [0,2]')
grid on
hold on
ylim(yint)
N = 10000;
rng(1051)
xvals = xint(2)*rand(N,1);
yvals = yint(2)*rand(N,1);
plot(xvals,yvals,'g.')
legend('e^x','Random Points')

yfunc = exp(xvals);
M = 0;
for i=1:length(yvals)
    if yvals(i) <= yfunc(i)
        M = M+1;
    end
end
apprx_integral = (M/N)*(xint(2)-xint(1))*(yint(2)-yint(1));
syms x
act_integral = eval(int(exp(x),0,2));
error = abs(apprx_integral-act_integral);
fprintf('Actual and Approximated Integrals for e^x in [0, 2]\n')
fprintf('\tActual Integral = %.4f\n', act_integral)
fprintf('\tApproximated Integral using MonteCarlo Method = %.4f\n',...
    apprx_integral)
fprintf('\tAbsolute Error = %.4f\n', error)
