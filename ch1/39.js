/*
A continued fraction representation of the tangent function was published in
1770 by the German math- ematician J.H. Lambert:
tan(x) = x / (1 - x ^ 2 / (3 - x ^ 2 / (5 - ...)))
where x is in radians. Define a procedure (tan-cf x k) that computes an
approximation to the tangent function based on Lambert’s formula. k specifies
the number of terms to compute, as in Exercise 1.37.
 */

function cont_frac_recur(n, d, k) {
    function fraction(i) {
        return i > k
            ? 0
            : n(i) / (d(i) + fraction(i + 1));
    }

    return fraction(1);
}

function tan_cf(x, k) {
    return cont_frac_recur(i => i === 1 ? x : -x * x,
        i => 2 * i - 1,
        k);
}
