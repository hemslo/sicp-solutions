/*
Use the smallest_divisor function to find the smallest divisor of each of the following numbers: 199, 1999, 19999.
 */

function square(x) {
    return x * x;
}

function smallest_divisor(n) {
    return find_divisor(n, 2);
}

function find_divisor(n, test_divisor) {
    return square(test_divisor) > n
        ? n
        : divides(test_divisor, n)
            ? test_divisor
            : find_divisor(n, test_divisor + 1);
}

function divides(a, b) {
    return b % a === 0;
}


smallest_divisor(199);
// 199
smallest_divisor(1999);
// 1999
smallest_divisor(19999);
// 7
