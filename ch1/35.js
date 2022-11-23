/*
Show that the golden ratio φ (Section 1.2.2) is a fixed point of the
transformation x -> 1 + 1/x, and use this fact to compute φ by means of the
fixed-point procedure.
 */

const tolerance = 0.00001;

function fixed_point(f, first_guess) {
    function close_enough(x, y) {
        return Math.abs(x - y) < tolerance;
    }

    function try_with(guess) {
        const next = f(guess);
        return close_enough(guess, next)
            ? next
            : try_with(next);
    }

    return try_with(first_guess);
}

fixed_point(x => 1 + (1 / x), 1);
