/*
Modify fixed-point so that it prints the sequence of approximations it
generates, using the newline and display primitives shown in Exercise 1.22.
Then find a solution to x ^ x = 1000 by finding a fixed point of
x -> log(1000)/ log(x). (Use Scheme’s primitive log procedure, which computes
natural logarithms.) Compare the number of steps this takes with and without
average damping. (Note that you cannot start fixed-point with a guess of 1, as
this would cause division by log(1) = 0.)
 */

const tolerance = 0.00001;

function display(x) {
    console.log(x);
}

function fixed_point(f, first_guess) {
    function close_enough(x, y) {
        return Math.abs(x - y) < tolerance;
    }
    function try_with(guess) {
        display(guess);
        const next = f(guess);
        return close_enough(guess, next)
            ? next
            : try_with(next);
    }
    return try_with(first_guess);
}

fixed_point(x => Math.log(1000) / Math.log(x), 2.0);
