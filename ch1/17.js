/*
The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication.
In a similar way, one can perform integer multiplication by means of repeated addition.
The following multiplication function (in which it is assumed that our language can only add, not multiply) is analogous
to the expt function:

function times(a, b) {
    return b === 0
           ? 0
           : a + times(a, b - 1);
}

This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, the
functions double, which doubles an integer, and halve, which divides an (even) integer by 2.
Using these, design a multiplication function analogous to fast_expt that uses a logarithmic number of steps.
 */

function double(x) {
    return x + x;
}

function halve(x) {
    return x / 2;
}

function fast_times(a, b) {
    return b === 0
        ? 0
        : is_even(b)
            ? fast_times(double(a), halve(b))
            : a + fast_times(a, b - 1);
}
