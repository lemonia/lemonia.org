#!/usr/bin/env ruby
require randombag.rb
adjectives = Randombag.new(["blue", "green", "flailsome", "feck-shaped"])

while(true)
  puts adjectives.select_one
end
