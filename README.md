# Pseudo Random Numbers And True Randomness

Let's start from the beginning. 

There is no such thing as random number in Computer Science. 

A lot of things have been done in order to reach truly randomness.

But still there is no better way to generate random number on the Earth than to 
generate it in Comos with the help of quantum clocks.

Random numbers or pseudo random numbers is really interesting topic that has a lot of
practical applications.

And I want to disclose the nature of random numbers generation today.

# Content

 [What Is Pseudo-Random Number?](#what_is_pseudo_random_number)<br/>
 [Generate Random Numbers Usung Ruby Programming Language](#random_ruby)<br/>
 [Generate Random Numbers Using C Programming Language And ANSI99 Standart](#random_c)<br/>
 Methods Of Manual Random Number Generation<br/>
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

In other words, the pseudo-random number generator - generates a pseudo-random numbers.

It is not trully random number. But it LOOKS like random number.

<h1><a id="random_ruby">Generation Of Random Numbers Usungs Ruby Programming Language</a></h1>

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

There are some situations when you cannot use pre-programmed randomizer but you have to generate random number.

For instance you don't have access to your computer and have only pen and a piece of paper. 

# [EOF]


