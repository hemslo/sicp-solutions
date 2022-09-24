/*
Declare a function that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
 */

function sumOfSquares(a, b) {
    return a * a + b * b;
}

function sumOfSquaresOfTwoLarger(a, b, c) {
    return a < b && a < c
        ? sumOfSquares(b, c)
        : b < a && b < c
            ? sumOfSquares(a, c)
            : sumOfSquares(a, b);
}
