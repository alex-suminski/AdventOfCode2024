class Day4
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(4)
  end

  def part1
    input
  end

  def part2
    input
  end
end
