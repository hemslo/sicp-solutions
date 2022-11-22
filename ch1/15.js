/*
The sine of an angle (specified in radians) can be computed by making use of the approximation sin x ~= x
if x is sufficiently small, and the trigonometric identity sin x = 3sin x/3 − 4sin3 x/3
to reduce the size of the argument of sin.
(For purposes of this exercise an angle is considered "sufficiently small" if its magnitude is not greater than 0.1 radians.)
 These ideas are incorporated in the following functions:
 */

function abs(x) {
    return x >= 0 ? x : - x;
}

function cube(x) {
    return x * x * x;
}

function p(x) {
    console.count('p');
    return 3 * x - 4 * cube(x);
}

function sine(angle) {
    return ! (abs(angle) > 0.1)
        ? angle
        : p(sine(angle / 3));
}

/*
1. How many times is the functionp applied when sine(12.15) is evaluated?
5
 */

/*
2. What is the order of growth in space and number of steps (as a function of a) used by the process generated by the
sine function when sine(a) is evaluated?

Space: O(log a)
 */