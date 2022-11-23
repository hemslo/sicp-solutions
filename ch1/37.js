/*
a. An infinite continued fraction is an expression of the form
f = N1/(D1 + N2 / (D2 + N3/ (D3 + ... )))
As an example, one can show that the infinite continued fraction expansion
with the Ni and the Di all equal to 1 produces 1/φ, where φ is the golden
ratio (described in Section 1.2.2). One way to approximate an infinite
continued fraction is to truncate the expansion after a given number of terms.
Such a truncation — a so-called k-term finite continued fraction—has the form
N1 / (D1 + N2 / (... + Nk/ Dk))
Suppose that n and d are procedures of one argument (the term index i) that
return the Ni and Di of the terms of the continued fraction. Define a
procedure cont-frac such that evaluating (cont-frac n d k) computes the value
of the k-term finite continued fraction. Check your procedure by approximating
1/φ using

cont_frac(i => 1, i => 1, k);

for successive values of k. How large must you make k in order to get an
approximation that is accurate to 4 decimal places?
b. If your cont-frac procedure generates a recursive process, write one that
generates an iterative process. If it generates an iterative process, write
one that generates a recursive process.
 */

function cont_frac_recur(n, d, k) {
    function fraction(i) {
        return i > k
            ? 0
            : n(i) / (d(i) + fraction(i + 1));
    }
    return fraction(1);
}

cont_frac_recur(i => 1, i => 1, 20);

function cont_frac_iter(n, d, k) {
    function fraction(i, current) {
        return i === 0
            ? current
            : fraction(i - 1, n(i) / (d(i) + current));
    }
    return fraction(k, 0);
}

cont_frac_iter(i => 1, i => 1, 20);
