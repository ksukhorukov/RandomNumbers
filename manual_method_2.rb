#!/usr/bin/env ruby

class RandomizedClocks 
  N = 10
  RANGE = 100
  CLOCKS_DEFAULT_VALUE = '112233'

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

  def increment_hours_by(timestamp = '000000', n)
    data = timestamp.split('').map(&:to_i)
    increment = ((data[0, 2].join.to_i + n) % 60).to_s
    slice = data[2,4].join('')
    @clocks = padding(increment) + slice
  end 

  def increment_minutes_by(timestamp = '000000', n)
    data = timestamp.split('').map(&:to_i)
    increment = ((data[2, 2].join.to_i + n) % 60).to_s
    slice_1 = data[0,2].join('')
    slice_2 = data[4,2].join('')
    @clocks = slice_1 + padding(increment) + slice_2
  end 

  def increment_seconds_by(timestamp = '000000', n)
    data = timestamp.split('').map(&:to_i)
    increment = ((data[4, 2].join.to_i + n) % 60).to_s
    slice = data[0,4].join('')
    @clocks = padding(increment) + slice
  end 
end 

RandomizedClocks.new