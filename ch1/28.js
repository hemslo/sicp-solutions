/*
One variant of the Fermat test that cannot be fooled is called the Miller–Rabin test (Miller 1976; Rabin 1980).
This starts from an alternate form of Fermat's Little Theorem, which states that if nn is a prime number and aa is any
positive integer less than nn, then a raised to the (n-1)st power is congruent to 1 modulo n. To test the primality of a
number n by the Miller–Rabin test, we pick a random number a < n and raise a to the (n-1)st power modulo n using the
expmod function. However, whenever we perform the squaring step in expmod, we check to see if we have discovered a
"nontrivial square root of 1 modulo n," that is, a number not equal to 1 or n-1 whose square is equal to 1 modulo n.
It is possible to prove that if such a nontrivial square root of 1 exists, then n is not prime. It is also possible to
prove that if n is an odd number that is not prime, then, for at least half the numbers a < n, computing a ^ (n−1)
in this way will reveal a nontrivial square root of 1 modulo n. (This is why the Miller–Rabin test cannot be fooled.)
Modify the expmod function to signal if it discovers a nontrivial square root of 1, and use this to implement the
Miller–Rabin test with a function analogous to fermat_test. Check your function by testing various known primes and
non-primes. Hint: One convenient way to make expmod signal is to have it return 0.
 */

function is_even(n) {
    return n % 2 === 0;
}

function square(x) {
    return x * x;
}

function random(n) {
    return Math.floor(Math.random() * n);
}

function miller_rabin_test(n) {
    function expmod(base, exp, m) {
        return exp === 0
            ? 1
            : is_even(exp)
                ? square(trivial_test(expmod(base,
                        exp / 2,
                        m),
                    m))
                % m
                : (base * expmod(base, exp - 1, m))
                % m;
    }

    function trivial_test(r, m) {
        return r === 1 || r === m - 1
            ? r
            : square(r) % m === 1
                ? 0
                : r;
    }

    function try_it(a) {
        return expmod(a, n - 1, n) === 1;
    }

    return try_it(1 + random(n - 1));
}

function do_miller_rabin_test(n, times) {
    return times === 0
        ? true
        : miller_rabin_test(n)
            ? do_miller_rabin_test(n, times - 1)
            : false;
}

do_miller_rabin_test(104743, 1000);
