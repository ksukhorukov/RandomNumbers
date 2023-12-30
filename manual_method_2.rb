#!/usr/bin/env ruby

require 'pry'

N = 1

def padding(n)
  n = n.to_s.split('')

  size = n.size

  n = n.join('')

  return '0' + n if size < 2 

  return n
end

def increment_hours_by(timestamp = '000000', n)
  data = timestamp.split('').map(&:to_i)

  increment = ((data[0, 2].join.to_i + n) % 60).to_s

  slice = data[2,4].join('')

  result = padding(increment) + slice

  return result
end 

def increment_minutes_by(timestamp = '000000', n)
  data = timestamp.split('').map(&:to_i)
  increment = ((data[2, 2].join.to_i + n) % 60).to_s

  slice_1 = data[0,2].join('')
  slice_2 = data[4,2].join('')
  result = slice_1 + padding(increment) + slice_2

  return result
end 

def increment_seconds_by(timestamp = '000000', n)
  data = timestamp.split('').map(&:to_i)
  increment = ((data[4, 2].join.to_i + n) % 60).to_s
  slice = data[0,4].join('')
  result = padding(increment) + slice
  return result
end 

clocks = '000000'

for i in 0...N do
  clocks = increment_hours_by(clocks, 2)
  clocks = increment_minutes_by(clocks, 2)
  clocks = increment_seconds_by(clocks, 2)
  puts clocks
end 