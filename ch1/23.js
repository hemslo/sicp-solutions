/*
The smallest_divisor function shown at the start of this section does lots of needless testing: After it checks to see
 if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers.
 This suggests that the values used for test_divisor should not be 2, 3, 4, 5, 6, ... but rather 2, 3, 5, 7, 9, ....
 To implement this change, declare a function next that returns 3 if its input is equal to 2 and otherwise returns its
 input plus 2. Modify the smallest_divisor function to use next(test_divisor) instead of test_divisor + 1.
 With timed_prime_test incorporating this modified version of smallest_divisor, run the test for each of the 12 primes
 found in exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about
 twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms,
  and how do you explain the fact that it is different from 2?
 */

function square(x) {
    return x * x;
}

function smallest_divisor(n) {
    return find_divisor(n, 2);
}

function divides(a, b) {
    return b % a === 0;
}

function next(input) {
    return input === 2 ? 3 : input + 2;
}

function find_divisor(n, test_divisor) {
    return square(test_divisor) > n
        ? n
        : divides(test_divisor, n)
            ? test_divisor
            : find_divisor(n, next(test_divisor));
}

smallest_divisor(19999);
