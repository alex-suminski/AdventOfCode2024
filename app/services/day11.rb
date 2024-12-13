class Day11
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(11).first.split.map(&:to_i)
  end

  def part1(blinks = 25)
    (1..blinks).reduce(input) do |acc, _|
      blink(acc)
    end.count
  end

  def part2(blinks = 75)
    part1(blinks)
  end

  def blink(stones)
    stones.flat_map do |stone|
      stone_size = "#{stone}".size
      if stone == 0
        1
      elsif stone_size.even?
        "#{stone}".partition(/.{#{stone_size / 2}}/)[1, 2].map(&:to_i)
      else
        stone * 2024
      end
    end
  end

  # def blink2(stones)
  #   stones.flat_map do |stone|
  #     stone_size = "#{stone}".size
  #     if stone == 0
  #       1
  #     elsif stone_size.even?
  #       "#{stone}".partition(/.{#{stone_size / 2}}/)[1, 2].map(&:to_i)
  #     else
  #       stone * 2024
  #     end
  #   end
  # end
end
