/*
Observe that our model of evaluation allows for applications whose function expressions are compound expressions.
Use this observation to describe the behavior of a_plus_abs_b:
 */

function plus(a, b) { return a + b; }

function minus(a, b) { return a - b; }

function a_plus_abs_b(a, b) {
    return (b >= 0 ? plus : minus)(a, b);
}

// if b is not negative then a + b , otherwise a - b.
