class Day2
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(2)
  end

  def part1
    input
  end

  def part2
    input
  end
end
