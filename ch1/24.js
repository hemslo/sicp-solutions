/*
Modify the timed_prime_test function of exercise 1.22 to use fast_is_prime (the Fermat method), and test each of the 12
primes you found in that exercise. Since the Fermat test has Θ(logn) growth, how would you expect the time to test
primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out?
Can you explain any discrepancy you find?
 */


function square(x) {
    return x * x;
}

function is_even(n) {
    return n % 2 === 0;
}

function display(x) {
    console.log(x);
}

function get_time() {
    return Date.now();
}

function expmod(base, exp, m) {
    return exp === 0
        ? 1
        : is_even(exp)
            ? square(expmod(base, exp / 2, m)) % m
            : (base * expmod(base, exp - 1, m)) % m;
}

function fermat_test(n) {
    function try_it(a) {
        return expmod(a, n, n) === a;
    }

    return try_it(1 + Math.floor(Math.random() * (n - 1)));
}

function fast_is_prime(n, times) {
    return times === 0
        ? true
        : fermat_test(n)
            ? fast_is_prime(n, times - 1)
            : false;
}

function timed_prime_test(n) {
    display(n);
    return start_prime_test(n, get_time());
}

function start_prime_test(n, start_time) {
    return fast_is_prime(n, Math.floor(Math.log(n)))
        ? report_prime(get_time() - start_time)
        : true;
}

function report_prime(elapsed_time) {
    display(" *** ");
    display(elapsed_time);
}

timed_prime_test(10007);
