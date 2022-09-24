/*
Alyssa P. Hacker doesn't like the syntax of conditional expressions, involving the characters ? and :.
"Why can't I just declare an ordinary conditional function whose application works just like conditional expressions?"
she asks.5 Alyssa's friend Eva Lu Ator claims this can indeed be done,
and she declares a conditional function as follows:
 */

function conditional(predicate, then_clause, else_clause) {
    return predicate ? then_clause : else_clause;
}

/*
Eva demonstrates the program for Alyssa:
 */

conditional(2 === 3, 0, 5);
// 5

conditional(1 === 1, 0, 5);
// 0

/*
Delighted, Alyssa uses conditional to rewrite the square-root program:
 */

function sqrt_iter(guess, x) {
    return conditional(is_good_enough(guess, x),
        guess,
        sqrt_iter(improve(guess, x),
            x));
}

/*
What happens when Alyssa attempts to use this to compute square roots? Explain.
 */

// Infinite loop. conditional is a function, it will evaluate all arguments first, which include sqrt_iter itself.
