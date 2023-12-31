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

It is not a truly random number. But it LOOKS like a random number.

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

It will be random number by itself but if you want to get the number in some diapason then perform modulus division.

For instance if you want to get the random number somewhere between 1 and 33 inclusively then do the following operation
in order to get it:

311223045145 % 33 = 1

The result will be a random number. In this case it equals 1.

### Method 2

Let's suppose that you have two pairs of clocks, is it possible to generate random number even if you don't know 
the exact date? Yes, it is.

Write down the value that you see on your first clocks:

123456

Write down the value that you see on your second clocks:

123506

Then repeat the same set that consists of two operations N times and perform modulo operation in order to get
the random number in certain range.

Implementation example using Ruby programming language:

````
#!/usr/bin/env ruby

class RandomizedClocks 
  N = 10
  RANGE = 100
  CLOCKS_DEFAULT_VALUE = '112233'
  CLOCKS_ZERO_VALUE = '000000'

  attr_reader :n, :range
  attr_accessor :clocks

  def initialize(clocks = CLOCKS_DEFAULT_VALUE, n = N, range = RANGE)
    @clocks = clocks 
    @range = range 
    @n = n

    perform
  end 

  def perform
    for i in 0...N do
      increment_hours_by(clocks, rand(60))
      increment_minutes_by(clocks, rand(60))
      increment_seconds_by(clocks, rand(60))      
    end 

    puts "random number: #{random_number}"
  end 

  private 

  def random_number
    clocks.to_i % range
  end

  def padding(n)
    n = n.to_s.split('')
    size = n.size
    n = n.join('')

    return '0' + n if size < 2 

    n
  end

  def increment_hours_by(timestamp = CLOCKS_ZERO_VALUE, n)
    data = timestamp.split('').map(&:to_i)
    increment = ((data[0, 2].join.to_i + n) % 60).to_s
    slice = data[2,4].join('')
    @clocks = padding(increment) + slice
  end 

  def increment_minutes_by(timestamp = CLOCKS_ZERO_VALUE, n)
    data = timestamp.split('').map(&:to_i)
    increment = ((data[2, 2].join.to_i + n) % 60).to_s
    slice_1 = data[0,2].join('')
    slice_2 = data[4,2].join('')
    @clocks = slice_1 + padding(increment) + slice_2
  end 

  def increment_seconds_by(timestamp = CLOCKS_ZERO_VALUE, n)
    data = timestamp.split('').map(&:to_i)
    increment = ((data[4, 2].join.to_i + n) % 60).to_s
    slice = data[0,4].join('')
    @clocks = padding(increment) + slice
  end 
end 

RandomizedClocks.new
````

Let's run it!

```
user@air RandomNumbers $ ./manual_method_2.rb         
random number: 3
user@air RandomNumbers $ ./manual_method_2.rb
random number: 24
user@air RandomNumbers $ ./manual_method_2.rb
random number: 37
user@air RandomNumbers $ ./manual_method_2.rb
random number: 17
user@air RandomNumbers $ ./manual_method_2.rb
random number: 29
user@air RandomNumbers $ ./manual_method_2.rb
random number: 18
user@air RandomNumbers $ ./manual_method_2.rb
random number: 32
user@air RandomNumbers $ ./manual_method_2.rb
random number: 51
user@air RandomNumbers $ ./manual_method_2.rb
random number: 25
user@air RandomNumbers $ ./manual_method_2.rb
random number: 25
user@air RandomNumbers $ ./manual_method_2.rb
random number: 5
user@air RandomNumbers $ ./manual_method_2.rb
random number: 28
```

It looks like everything is working well.

### Method 3

There is a pure mathematical formula for pseudo-random numbers generation.

Let's take a look at this formula:

# Litrature

<ul>
 <li><[1] [Concrete Math. Chapter 3](https://www.math.arizona.edu/~tgk/mc/book_chap3.pdf)</li>
</ul>
  
# [EOF]


