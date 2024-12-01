class Day1
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(1)
  end

  def part1
    input
      .map { |line| line.split.map(&:to_i) }
      .transpose
      .map(&:sort)
      .transpose
      .map { |args| (args.first - args.last).abs }
      .sum
  end

  def part2
    list1, list2 = input
                   .map { |line| line.split.map(&:to_i) }
                   .transpose

    list1.map { |el| el * list2.count(el) }.sum
  end
end
