### Binary Search

This will cover: *Intervals, Search Space, Comparison*

###### Instructions:

Write a function that takes a sorted array of integers and a needle, and finds an index or absence of the needle in O(log N) time, and preferably O(1) space.  With that function, now return the lowest index containing the needle. Assume in an array of millions, the runs will be no more than 10


````
<?php
// takes the array in a manner that avoid copying the array
function bsearch(&$a, $x) {
    // we've decided here that the remaining search space is the half-open interval [$lo,$hi)
    // and this is initialized OUTSIDE the loop
    $lo = 0;
    // some people will naturally pick a closed interval and this will be `count($a) - 1`
    $hi = count($a);

    // while the search space is not empty
    while ($lo < $hi) {
        // the midpoint need only be calculated inside the loop,
        // floor is important for PHP because there is no integer division
        // this exact formulation is to avoid overflow bugs when your search array is large
        // do not expect this formulation to people who aren't Josh Bloch cult members
        $mid = $lo + floor(($hi - $lo) / 2);
        if ($a[$mid] == $x) {
            // found! return the index
            return $mid;
        } else if ($a[$mid] < $x) {
            // undershot, move $lo past the midpoint because that end
            // of the search space is inclusive and $mid has been eliminated
            // and we must be sure that the search space will always shrink
            $lo = $mid + 1;
        } else {
            // overshot, set $hi to the midpoint because that end of the search
            // space is exclusive and we'll never check that spot again
            // and we must be sure that the search space will always shrink
            // if the search space is a closed interval then this should be `$mid - 1`;
            $hi = $mid;
        }
    }
    // search space is exhausted, indicate we did not find
    return false;
}

// make sure the array is passed to avoid copies
function bsearch_first(&$a, $x) {
    // did we find it at all?
    if (false !== $i = bsearch($a, $x)) {
        // walk back one at a time until encountering a non-match
        while ($i > 0 && $a[$i - 1] == $x) {
            $i--;
        }
    }
    return $i;
}

// read test data from STDIN so we can provide varied test data
while (false !== $line = fgets(STDIN)) {
    $a[] = (int) trim($line);
}

$x = isset($argv[1]) ? (int) $argv[1] : 7;
echo bsearch_first($a, $x) . PHP_EOL;
````
