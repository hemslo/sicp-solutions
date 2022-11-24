/*
; Define a procedure cubic that can be used together with the newtons-method
; function in expressions of the form
; newtons_method(cubic(a, b, c), 1)
; to approximate zeros of the cubic x^3 + ax^2 + bx + c.
 */

const tolerance = 0.00001;

function fixed_point(f, first_guess) {
    function close_enough(x, y) {
        return Math.abs(x - y) < tolerance;
    }

    function try_with(guess) {
        const next = f(guess);
        return close_enough(guess, next)
            ? next
            : try_with(next);
    }

    return try_with(first_guess);
}

const dx = 0.00001;

function deriv(g) {
    return x => (g(x + dx) - g(x)) / dx;
}

function newton_transform(g) {
    return x => x - g(x) / deriv(g)(x);
}

function newtons_method(g, guess) {
    return fixed_point(newton_transform(g), guess);
}

function cubic(a, b, c) {
    return x => x * x * x + a * x * x + b * x + c;
}

newtons_method(cubic(2, 3, 4), 1);
