### FizzBuzz

This will cover: *Iteration, Classification, Requirements, Testability, Intervals.*

###### Instructions:

Print each number 1..max on a line by itself, except when divisible by 3, 5, or both, instead print fizz, buzz, and fizzbuzz respectively.


````
<?php
// break out classification into a separate function
function fizzy($n) {
    // notice that % 15 == 0 is the fizzbuzz test
    if ($n % 15 === 0) return 'fizzbuzz';
    if ($n % 5 === 0) return 'buzz';
    if ($n % 3 === 0) return 'fizz';
    return $n;
}
  
// there is an opportunity here to pass an output target as well as max
function fizzbuzz($max) {
    // this iteration strategy is available in most C-ish languages
    // to neatly avoid fencepost and INT_MAX problems with 1..X closed intervals
    for ($i = 0; $i < $max;) {
        $i++;
        // opportunity here to accumulate an array to return at loop end instead of printing
        echo fizzy($i) . PHP_EOL;
    }
}
 
// easy 'run it' testing strategy built in
fizzbuzz((int)$argv[1]);
````
