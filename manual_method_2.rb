#!/usr/bin/env ruby

require 'pry'

N = 1

def padding(n)
  n = n.to_s.split('')

  size = n.size

  n = n.join('')
  binding.pry
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

end 

def increment_seconds_by(timestamp = '000000', n)

end 

clocks = '000000'

for i in 0...N do
  puts increment_hours_by(clocks, 2)
end 