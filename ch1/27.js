/*
Demonstrate that the Carmichael numbers listed in footnote 4 really do fool the Fermat test.
That is, write a function that takes an integer nn and tests whether a^n is congruent to aa modulo n for every a < n,
and try your function on the given Carmichael numbers.
 */

function carmichael(n) {
    function is_even(n) {
        return n % 2 === 0;
    }

    function expmod(base, exp, m) {
        return exp === 0
            ? 1
            : is_even(exp)
                ? square(expmod(base, exp / 2, m)) % m
                : (base * expmod(base, exp - 1, m)) % m;
    }

    function fermat_test(n, a) {
        return expmod(a, n, n) === a;
    }

    function iter(n, i) {
        return i === n
            ? true
            : fermat_test(n, i)
                ? iter(n, i + 1)
                : false;
    }

    return iter(n, 2);
}

carmichael(561);
