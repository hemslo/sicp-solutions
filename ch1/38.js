/*
In 1737, the Swiss mathematician Leonhard Euler published a memoir De
Fractionibus Continuis, which included a continued fraction expansion for
e − 2, where e is the base of the natural logarithms. In this fraction, the Ni
are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...
Write a program that uses your cont-frac procedure from Exercise 1.37 to
approximate e, based on Euler’s expansion.
 */

function cont_frac_recur(n, d, k) {
    function fraction(i) {
        return i > k
            ? 0
            : n(i) / (d(i) + fraction(i + 1));
    }

    return fraction(1);
}

2 + cont_frac_recur(
    i => 1,
    i => i % 3 === 2 ? 2 * (i + 1) / 3 : 1,
    10);
