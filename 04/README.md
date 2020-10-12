# Largest palindrome product


A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

___

I start by generating all the 6 digit palindromes from the top down. In Haskell it's lazy so it shouldn't actually generate any of the numbers I don't test. Next I just see the first number which is a multiple of two 3 digit numbers. Some of the functions are simpler than they could be since they only work for the number of digits given. I'm not going to do this one in python or rust because the approach wouldn't change.
