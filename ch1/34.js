/*
Suppose we declare
 */

function f(g) {
    return g(2);
}

/*
Then we have
f(square);
4
f(z => z * (z + 1));
6
What happens if we (perversely) ask the interpreter to evaluate the application f(f)? Explain.
 */

f(f);

// Uncaught TypeError: g is not a function
//     at f (<anonymous>:2:12)
//     at f (<anonymous>:2:12)
//     at <anonymous>:1:1
