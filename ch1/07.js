/*
The is_good_enough test used in computing square roots will not be very
effective for finding the square roots of very small numbers.
Also, in real computers, arithmetic operations are almost always performed with limited precision.
This makes our test inadequate for very large numbers.
Explain these statements, with examples showing how the test fails for small and large numbers.
An alternative strategy for implementing is_good_enough is to watch how guess changes from one iteration to the next and
to stop when the change is a very small fraction of the guess.
Design a square-root function that uses this kind of end test.
Does this work better for small and large numbers?
 */

function abs(x) {
    return x >= 0 ? x : - x;
}

function square(x) {
    return x * x;
}

function average(x, y) {
    return (x + y) / 2;
}

function improve(guess, x) {
    return average(guess, x / guess);
}

function is_good_enough(guess, x) {
    return abs(improve(guess, x) - guess) / guess < 0.0001;
}

function sqrt_iter(guess, x) {
    return is_good_enough(guess, x)
        ? guess
        : sqrt_iter(improve(guess, x), x);
}

function sqrt(x) {
    return sqrt_iter(1, x);
}
