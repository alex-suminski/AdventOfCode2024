class Day9
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(9).first.chars.map(&:to_i)
  end

  def part1
    position = 0
    spaces = []
    sum = 0
    input.map.with_index do |location_length, i|
      if i.even?
        id_number = i / 2
        location_length * id_number
      else
        spaces << position
      end
      position += location_length
    end
  end

  def part2
    input
    0
  end
end

# 0123456789
# 0 1 2 3 4

# (i-1)/2
