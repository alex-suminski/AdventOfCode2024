class Day9
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(9)
  end

  def part1
    position = 0
    input.first.chars.map.with_index do |el, i|
      if i.even?
        el.to_i * position
      else
        0
      end
    end
  end

  def part2
    input
    0
  end
end
