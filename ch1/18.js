/*
Using the results of exercises 1.16 and 1.17, devise a function that generates an iterative process for multiplying
two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.
 */

function double(x) {
    return x + x;
}

function halve(x) {
    return x / 2;
}

function is_even(n) {
    return n % 2 === 0;
}

function fast_times_iter(a, b, n) {
    return b === 0
        ? n
        : is_even(b)
            ? fast_times_iter(double(a), halve(b), n)
            : fast_times_iter(a, b - 1, n + a);
}

function times(a, b) {
    return fast_times_iter(a, b, 0);
}
