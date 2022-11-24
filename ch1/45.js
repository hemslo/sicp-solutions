/*
We saw in Section 1.3.3 that attempting to compute square roots by naively
finding a fixed point of y -> x/y does not converge, and that this can be
fixed by average damping. The same method works for finding cube roots as
fixed points of the average-damped y -> x/y2. Unfortunately, the process does
not work for fourth roots — a single average damp is not enough to make a
fixed-point search for y -> x/y3 converge. On the other hand, if we average
damp twice (i.e., use the average damp of the average damp of y -> x/y3) the
fixed-point search does converge. Do some experiments to determine how many
average damps are required to compute nth roots as a fixed-point search based
upon repeated average damping of y -> x/yn−1. Use this to implement a simple
procedure for computing nth roots using fixed-point, average-damp, and the
repeated procedure of Exercise 1.43. Assume that any arithmetic operations you
need are available as primitives.
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

function average(x, y) {
    return (x + y) / 2;
}

function average_damp(f) {
    return x => average(x, f(x));
}

function compose(f, g) {
    return x => f(g(x));
}

function repeated(f, n) {
    return n === 0
        ? x => x
        : compose(f, repeated(f, n - 1));
}

function square(x) {
    return x * x;
}

function nth_root(n, x) {
    return fixed_point(repeated(average_damp,
            Math.floor(Math.log2(n)))
        (y => x / Math.pow(y, n - 1)),
        1);
}

nth_root(5, 32);
