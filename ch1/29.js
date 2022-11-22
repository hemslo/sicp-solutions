/*
Simpson's Rule is a more accurate method of numerical integration than the method illustrated above.
Using Simpson's Rule, the integral of a function f between a and b is approximated as
(1/3)h[y0 + 4fy1 + 2y2 + 4y3 + ... + 2y(n-2) + 4y(n-1) + yn]

where h=(b-a)/n, for some even integer n, and yk =f(a+kh). (Increasing n increases the accuracy of the approximation.)
Declare a function that takes as arguments f, a, b, and n and returns the value of the integral,
computed using Simpson's Rule.
Use your function to integrate cube between 0 and 1 (with n=100 and n=1000), and compare the results to those of the
integral function shown above.
 */

function cube(x) {
    return x * x * x;
}

function sum(term, a, next, b) {
    return a > b
        ? 0
        : term(a) + sum(term, next(a), next, b);
}

function inc(k) {
    return k + 1;
}

function simpsons_rule_integral(f, a, b, n) {
    const h = (b - a) / n;

    function y(k) {
        return f((k * h) + a);
    }

    function term(k) {
        return y(k) * (k === 0 || k === n ? 1 : k % 2 === 0 ? 2 : 4);
    }

    return (h / 3) * sum(term, 0, inc, n);
}

simpsons_rule_integral(cube, 0, 1, 100);
