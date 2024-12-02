class Day2
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(2)
  end

  def part1
    input.select {|line| valid?(line)}.count
  end

  def part2
    # input
  end

  def valid?(line)
  increasing = true
  decreasing = true
  diff = true
    line.split.map(&:to_i).each_cons(2) {|x,y|
    
    if x >= y
      increasing = false 
    end
    if  x <= y
      decreasing = false
    end
    if (x-y).abs > 3
      diff = false
    end
  }
  (increasing || decreasing) & diff
  end
end
