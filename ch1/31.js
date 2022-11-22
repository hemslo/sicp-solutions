/*
a. The sum procedure is only the simplest of a vast number of similar
abstractions that can be captured as higher-order procedures. Write an
analogous procedure called product that returns the product of the values of a
function at points over a given range. Show how to define factorial in terms
of product. Also use product to compute approximations to π using the formula
π / 4 = (2 * 4 * 4 * 6 * 6 * 8 ...) / (3 * 3 * 5 * 5 * 7 * 7 ...)

b. If your product procedure generates a recursive process, write one that
generates an iterative process. If it generates an iterative process, write
one that generates a recursive process.
 */

function factorial(n) {
    function term(i) {
        return i;
    }

    function next(i) {
        return i + 1;
    }

    return product_r(term, 1, next, n);
}

function pi(n) {
    function is_odd(i) {
        return i % 2 === 1;
    }

    function term(i) {
        return is_odd(i)
            ? (i + 1) / (i + 2)
            : (i + 2) / (i + 1);
    }

    function next(i) {
        return i + 1;
    }

    return 4 * (product_i(term, 1.0, next, n));
}

function product_r(term, a, next, b) {
    return a > b
        ? 1
        : term(a) * product_r(term, next(a), next, b);
}

function product_i(term, a, next, b) {
    function iter(a, result) {
        return a > b
            ? result
            : iter(next(a), term(a) * result);
    }

    return iter(a, 1);
}

factorial(10);
pi(100);
