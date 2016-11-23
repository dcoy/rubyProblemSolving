### Luhn Filter

This will cover: *Iteration, Requirements, Testability, Intervals, Algorithms, Dynamic Programming, Big-O*

#### Instructions:

Given a sequence of digits, determine if it's a valid credit card number using the luhn algorithm. Starting with the rightmost digit in the sequence, double every other digit. Sum all of the digits of those products, along with the non-doubled digits of the sequence. Return true if that sum is 0 mod 10. Advanced variations included in the detail page.

The Luhn algorithm works like this:

1. Starting from the rightmost digit and working left, double every second digit.
2. If a product has two digits, treat the digits independently.
3. Sum each individual digit, including the non-doubled digits.
4. Divide the result by 10.
5. If the remainder is 0, the number passed the Luhn check.

Write the is_valid function which takes an array of digits (or alternatively a string) and tests if it constitutes a valid credit card number. Not important for implementing the basic algorithm is the information that a credit card number is always 14, 15, or 16 digits long.

Advanced variations:

* Write contains_ccn(string) which returns true if any substring is a 14-, 15-, or 16-digit CCN. Note that a series of 16 digits contains 1 possible 16-digit CCN, 2 possible 15-digit CCN's, and 3 possible 14-digit CCN's. Best implementations will use dynamic programming to handle long sequences of numbers.
* Augment contains_ccn(string) to ignore spaces and hyphens in number sequences.
* Write mask_ccn(string) which returns a the string (or a new string) that has all valid credit card numbers (including overlapping valid sequences) replaced with X's.
