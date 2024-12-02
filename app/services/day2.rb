class Day2
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(2)
  end

  def part1
    input.select { |line| valid?(line) }.count
  end

  def part2
    input.select { |line| valid2?(line) }.count
  end

  def valid?(line)
    increasing = true
    decreasing = true
    diff = true
    line.split.map(&:to_i).each_cons(2) do |x, y|
      break unless increasing || decreasing

      # break unless diff

      increasing = false if x >= y
      decreasing = false if x <= y
      diff = false if (x - y).abs > 3
    end
    (increasing || decreasing) & diff
  end

  def valid2?(line)
    increasing = true
    decreasing = true
    diff = true
    dampened_increase_level = -1
    dampened_decrease_level = -1
    dampened_diff_level = -1
    line.split.map(&:to_i).each_cons(2).to_a.each_with_index do |(x, y), i|
      if x >= y
        if dampened_increase_level == -1
          dampened_increase_level = i + 1
        elsif dampened_increase_level == i
        else
          increasing = false
        end
      end

      if x <= y
        if dampened_increase_level == -1
          dampened_increase_level = i + 1
        elsif dampened_increase_level == i
        else
          decreasing = false
        end
      end

      if (x - y).abs > 3
        if dampened_diff_level == -1
          dampened_diff_level = i + 1
        elsif dampened_diff_level == i
        else
          diff = false
        end
      end
    end
    (increasing || decreasing) & diff
  end
end
