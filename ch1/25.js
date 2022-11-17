/*
Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already
 know how to compute exponentials, we could have simply written
 */

function expmod(base, exp, m) {
    return fast_expt(base, exp) % m;
}

/*
Is she correct? Would this function serve as well for our fast prime tester? Explain.
 */

//  No. The exponentials are too large. More Time and space required.
