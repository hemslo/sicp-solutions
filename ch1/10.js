/*
The following function computes a mathematical function called Ackermann's function.
 */

function A(x, y) {
    return y === 0
        ? 0
        : x === 0
            ? 2 * y
            : y === 1
                ? 2
                : A(x - 1, A(x, y - 1));
}

/*
What are the values of the following statements?
 */

A(1, 10);
// 1024

A(2, 4);
// 65536

A(3, 3);
// 65536

/*
Consider the following functions, where A is the function declared above:
 */

function f(n) {
    return A(0, n);
}
function g(n) {
    return A(1, n);
}
function h(n) {
    return A(2, n);
}
function k(n) {
    return 5 * n * n;
}

/*
Give concise mathematical definitions for the functions computed by the functions
f, g, and h for positive integer values of n. For example, k(n)k(n) computes 5n^2
 */

// f(n) = 2n
// g(n) = 2^n
// h(n) = 2^(2^n)
