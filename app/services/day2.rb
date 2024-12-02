class Day2
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(2)
  end

  def part1
    input.select { |line| valid?(line.split.map(&:to_i)) }.count
  end

  def part2
    input.select do |line|
      line = line.split.map(&:to_i)
      # debugger
      valid?(line) ||
        (0..(line.size - 1)).any? do |i|
          line_without = line[0, i].concat(line[i + 1..-1])
          valid?(line_without)
        end
    end.count
  end

  def valid?(line)
    increasing = true
    decreasing = true
    diff = true
    line.each_cons(2) do |x, y|
      # break unless increasing || decreasing

      increasing = false if x >= y
      decreasing = false if x <= y
      diff = false if (x - y).abs > 3
    end
    (increasing || decreasing) & diff
  end
end
