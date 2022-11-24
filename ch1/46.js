/*
Several of the numerical methods described in this chapter are instances of an
extremely general computational strategy known as iterative improvement.
Iterative improvement says that, to compute something, we start with an
initial guess for the answer, test if the guess is good enough, and otherwise
improve the guess and continue the process using the improved guess as the new
guess. Write a function iterative_improve that takes two functions as arguments:
a method for telling whether a guess is good enough and a method for improving a guess.
The function iterative_improve should return as its value a function that takes a guess as argument
and keeps improving the guess until it is good enough. Rewrite the sqrt function of section 1.1.7 and
the fixed_point function of section 1.3.3 in terms of iterative_improve.
 */

function iterative_improve(good_enough, improve) {
    return guess => good_enough(guess)
        ? guess
        : iterative_improve(good_enough, improve)(improve(guess));
}

const tolerance = 0.00001;

function fixed_point(f, first_guess) {
    function close_enough(x, y) {
        return Math.abs(x - y) < tolerance;
    }

    return iterative_improve(x => close_enough(x, f(x)), f)(first_guess);
}

function sqrt(x) {
    return fixed_point(y => (y + x / y) / 2, 1);
}

sqrt(49);
