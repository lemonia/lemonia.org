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

  def add_one(item)
	  @contents += [ item ]
  end
end


