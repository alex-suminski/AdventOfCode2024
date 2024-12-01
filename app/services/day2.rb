class Day2
  attr_reader :input

  LIMITS = {
    'red' => 12,
    'green' => 13,
    'blue' => 14
  }.freeze

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(2)
  end

  def part1
    input.sum do |line|
      game, game_data = line.split(':')
      if game_valid?(game_data)
        game.split.last.to_i
      else
        0
      end
    end
  end

  def part2
    # input
  end

  private

  def game_valid?(game_data)
    game_data.split(';').all? do |round|
      round.split(',').all? do |color|
        color_data = color.split

        color_valid?(color: color_data.second, number: color_data.first.to_i)
      end
    end
  end

  def color_valid?(color:, number:)
    LIMITS[color] >= number
  end
end
