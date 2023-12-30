# Pseudo Random Numbers And True Randomness

Let's start from the beginning. 

There is no such thing as a random number in Computer Science. 

A lot of things have been done in order to reach truly randomness.

But still there is no better way to generate random number on the Earth than to 
generate it in Comos with the help of quantum clocks.

Random numbers or pseudo random numbers is really interesting topic that has a lot of
practical applications.

And I want to disclose the nature of random numbers generation today.

# Content

 [What Is Pseudo-Random Number?](#what_is_pseudo_random_number)<br/>
 [Generate Random Numbers Using Ruby Programming Language](#random_ruby)<br/>
 [Generate Random Numbers Using C Programming Language And ANSI99 Standard](#random_c)<br/>
 [Methods Of Manual Random Number Generation](#manual_random)<br/>
 Random Numbers Applications<br/>
 Attacks On Random Numbers<br/>
 True Random Numbers<br/>

<h1><a id="what_is_pseudo_random_number">What Is Pseudo-Random Number?</a></h1>

````
A pseudorandom number generator is a function that takes a short random seed 
and outputs a longer bit sequence that “appears random.” To be cryptographically 
secure, the output of a pseudorandom number generator should be computationally 
indistinguishable from a random string. In particular, given a short prefix of the sequence, 
it should be computationally infeasible to predict the rest of the sequence without knowing the seed. 
````

[Pseudo-Random Number](https://www.sciencedirect.com/topics/mathematics/pseudo-random-number)

In other words, the pseudo-random number generator - generates pseudo-random numbers.

It is not truly random number. But it LOOKS like random number.

<h1><a id="random_ruby">Generation Of Random Numbers Using Ruby Programming Language</a></h1>

Source code: 

````
user@air RandomNumbers $ cat ./rand.rb 
#!/usr/bin/env ruby

puts rand(100_000_000_000)%   
````

Example of the results:

````
user@air RandomNumbers $ ./rand.rb    
82557048399
````

<h1><a id="random_с">Generation Of Random Numbers Using C Programming Language And ANSI99 Standart</a></h1>

````
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main() {
  int seed = (int)time(NULL);
  
  srand(seed);

  int random_number = rand() % 1000;

  printf("\nrandom number: %d\n\n", random_number);

  return 0;
}
````

Let's build and run this example:

````
user@air RandomNumbers $ make
gcc rand.c -o rand
user@air RandomNumbers $ ./rand

random number: 33

````
<br/>
<h1><a id="manual_random">Methods Of Manual Random Numbers Generation</a></h1>

There are some situations when you cannot use a pre-programmed randomizer but you have to generate a random number.

For instance you don't have access to your computer and have only a pen and a piece of paper. 

### Method 1

If you know the current date then write it down on paper, e.g. 31.12.23 
If you have clocks then write down the exact value that you see on the clocks, e.g. 04:51:45

Concatenate two values: '31' + '12' + '23' + '04' + '51' + '45'

Result is: 311223045145

It will be random number by itself but if you want to get the number in some diapasone then perform modulus division.

For instance if you want to get the random number somewhere between 1 and 33 inclusively then do the following operation
in order to get it:

311223045145 % 33 = 1

The result will be a random number. In this case it equals to 1.

### Method 2

Let's suppose that you have two pairs of clocks, is it possible to generate random number even if you don't know 
the exact date? Yes, it is.

Write down the value that you see on your first clocks:

123456

Write down the value that you see on your second clocks:

123506

Then repeat the same set that consists of two operations N times and perform modulo operation in order to get
the random number in certain range

# [EOF]

