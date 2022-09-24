/*
A function f is defined by the rules f(n)=n if n < 3 and f(n)=f(n-1)+2f(n-2)+3f(n-3) if n >= 3.
Write a JavaScript function that computes f by means of a recursive process.
Write a function that computes f by means of an iterative process.
 */

function recurF(n) {
    return n < 3
        ? n
        : recurF(n - 1) + 2 * recurF(n - 2) + 3 * recurF(n - 3);
}

function iterF(n) {
    function iter(a, b, c, count) {
        return count === 0
            ? c
            : iter(a + 2 * b + 3 * c, a, b, count - 1);
    }
    return iter(2, 1, 0, n);
}
