### Anagrams

This will cover: *Big-O, Algorithms, Testability, Comparison, I/O, Validation*

###### Instructions:

Given an input file of dictionary words, one per line, and another input file of words to unscramble, one per line, print each scrambled word and the corresponding unscrambled word.

How do you store/look-up the two lists?  What is the O() of your algorithm?  How would you validate input?

There's an ah-ha: You can alphabetize the letters in the dictionary, using that as the key mapping back to the original word.  Then take each input word, alphabetize, and look-up.  We probably don't expect candidates to get the "ah-ha," although it's a bonus if they do, but we could propose that algorithm and ask them how O() changes (in speed and memory) and what data structures they need to implement that efficiently.
