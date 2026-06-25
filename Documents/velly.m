%% Problem 1: Numerical Integration Comparison
clear; clc;

a = 0; b = 2;
n_values = [1 4 8];  
funcs = {@(x)x, @(x)x.^2, @(x)x.^4, @(x)1./(1+x), @(x)sin(x)};
names = {'x','x^2','x^4','1/(1+x)','sin(x)'};

for k = 1:length(funcs)
    f = funcs{k};
    exact = integral(f,a,b);
    fprintf('\nFunction: f(x) = %s\n', names{k});
    fprintf('Exact Integral: %.8f\n', exact);

    for n = n_values
        h = (b - a) / n;
        x = a:h:b;
        y = f(x);

        I_T = h/2 * (y(1) + 2*sum(y(2:end-1)) + y(end));
        I_S = h/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));

        fprintf('n = %d | Trap = %.8f | ErrT = %.8e | Simp = %.8f | ErrS = %.8e\n', ...
            n, I_T, abs(exact - I_T), I_S, abs(exact - I_S));
    end
end

%% Problem 2: Step Size Estimation
clear; clc;

a = 0; b = pi;
tol = 2e-6;

ET_coef = (b - a) / 12;
ES_coef = (b - a) / 180;
max_f2 = 1;
max_f4 = 1;

h_trap = sqrt(tol / (ET_coef * max_f2));
h_simp = (tol / (ES_coef * max_f4))^(1/4);

fprintf('Trapezoidal required h: %.8e\n', h_trap);
fprintf('Simpson required h: %.8e\n', h_simp);

%% Problem 3: Numerical Differentiation
clear; clc;

f = @(x)cos(x);
x0 = 0.5;
exact = -cos(x0);
h_values = [1/32 1/64 1/128];

Dh = zeros(size(h_values));
E = zeros(size(h_values));

for i = 1:length(h_values)
    h = h_values(i);
    Dh(i) = (f(x0+h) - 2*f(x0) + f(x0-h)) / h^2;
    E(i) = abs(Dh(i) - exact);
end

EOC = [NaN, log(E(1:end-1)./E(2:end)) ./ log(h_values(1:end-1)./h_values(2:end))];

T = table(h_values', Dh', E', EOC', 'VariableNames', {'h','Dh','Error','EOC'});
disp(T)
