/*
The following pattern of numbers is called Pascal's triangle.

1
1 1
1 2 1
1 3 3 1
1 4 6 4 1

The numbers at the edge of the triangle are all 1,
and each number inside the triangle is the sum of the two numbers above it.
Write a function that computes elements of Pascal's triangle by means of a recursive process.
 */

function pascal(row, col) {
    return col === 0 || col === row
        ? 1
        : pascal(row - 1, col - 1) + pascal(row - 1, col);
}
