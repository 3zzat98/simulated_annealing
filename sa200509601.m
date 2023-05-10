f = @(x) -x^3 + 60*x^2 - 900*x - 100;
x = [1 0 0 1 1]; 
x_decimal = bi2de(x);
f_x = f(x_decimal);
Tmax = 500;
Tmin = 200;
g = 0.9;

T = Tmax;
while T > Tmin
    x_new = x;
    flip_idx = randi(length(x));
    x_new(flip_idx) = ~x_new(flip_idx);
    x_new_decimal = bi2de(x_new);
    f_x_new = f(x_new_decimal);
    delta_f = f_x_new - f_x;
    p = exp(-delta_f / T);
    if rand() < p
        x = x_new;
        x_decimal = x_new_decimal;
        f_x = f_x_new;
    end
    T = g * T;
end
fprintf('Solution: x = %d (%s), f(x) = %f\n', x_decimal, num2str(x), f_x);
