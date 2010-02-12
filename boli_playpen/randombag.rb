#!/usr/bin/env ruby

class Randombag
  def initialize(contents)
    @contents = contents
  end

  def select_one
    if @contents.empty?
      raise RuntimeError, "doh! out of stuff"
    end

    selection = @contents[rand(@contents.size)]
    @contents -= [ selection ]
    return selection
  end
end

adjectives = Randombag.new(["blue", "green", "flailsome", "feck-shaped"])

while(true)
  puts adjectives.select_one
end
