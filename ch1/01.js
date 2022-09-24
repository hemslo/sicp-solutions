/*
Below is a sequence of statements. What is the result printed by the interpreter in response to each statement?
Assume that the sequence is to be evaluated in the order in which it is presented.
*/

10;
// 10
5 + 3 + 4;
// 12
9 - 1;
// 8
6 / 2;
// 3
2 * 4 + (4 - 6);
// 6
const a = 3;
// undefined
const b = a + 1;
// undefined
a + b + b * a;
// 19
a === b;
// false
b > a && b < a * b ? b : a;
// 4
a === 4
    ? 6
    : b === 4
        ? 6 + 7 + a
        : 25;
// 16
2 + (b > a ? b : a);
// 6
(a > b
    ? a
    : a < b
        ? b
        : -1)
*
(a + 1);
// 16
