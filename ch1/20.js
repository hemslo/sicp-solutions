/*
The process that a function generates is of course dependent on the rules used by the interpreter.
As an example, consider the iterative gcd function given above.
Suppose we were to interpret this function using normal-order evaluation, as discussed in section 1.1.5.
(The normal-order-evaluation rule for conditional expressions is described in exercise 1.5.)
Using the substitution method (for normal order), illustrate the process generated in evaluating gcd(206, 40) and
indicate the remainder operations that are actually performed. How many remainder operations are actually performed in
the normal-order evaluation of gcd(206, 40)? In the applicative-order evaluation?
 */

function gcd(a, b) {
    return b === 0 ? a : gcd(b, a % b);
}

gcd(206, 40)

// normal
// gcd(206, 40)
// gcd(40, 206 % 40)
// 206 % 40 === 0 ? 40 : gcd(206 % 40, 40 % (206 % 40))
// ...

// 18 times

// application

// gcd(206, 40)
// gcd(40, 206 % 40)
// gcd(40, 6)
// ...
// 4 times
