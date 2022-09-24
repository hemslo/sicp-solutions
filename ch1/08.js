/*
Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x,
then a better approximation is given by the value

x/y^2 + 2y
----------
3

Use this formula to implement a cube-root function analogous to the square-root function.
(In section 1.3.4 we will see how to implement Newton's method in general as an abstraction of these square-root
and cube-root functions.)
 */


function abs(x) {
    return x >= 0 ? x : - x;
}

function improve(guess, x) {
    return (x / (guess * guess) + 2 * guess) / 3;
}

function is_good_enough(guess, x) {
    return abs(improve(guess, x) - guess) / guess < 0.0001;
}

function cube_root_iter(guess, x) {
    return is_good_enough(guess, x)
        ? guess
        : cube_root_iter(improve(guess, x), x);
}

function cube_root(x) {
    return cube_root_iter(1, x);
}
