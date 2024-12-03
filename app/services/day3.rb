class Day3
  attr_reader :input

  MUL = /mul\(\d{1,3},\d{1,3}\)/
  OTTER = /\d{1,3},\d{1,3}/

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(3)
  end

  def part1
    input.sum do |line|
      line.scan(MUL).sum do |mul|
        mul[4..-2].split(',').map(&:to_i).inject(:*)
      end
    end
  end

  def part2
    # input
  end
end
