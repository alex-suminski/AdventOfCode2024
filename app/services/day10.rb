class Day10
  attr_reader :input, :topography

  Location = Struct.new(:x, :y, keyword_init: true)

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(10)

    @topography = Hash.new { |h, k| h[k] = [] }

    input.each_with_index do |line, y|
      line.chars.each_with_index do |level, x|
        next if level == '.'

        @topography[level.to_i] << Location.new(y: y, x: x)
      end
    end
  end

  def part1
    topography[0].map do |location|
      step_up(location, 0).flatten.uniq
    end.flatten.count
  end

  def part2
    # topography[0].map do |location|
    #   step_up2(location, 0, 0)
    # end.flatten.sum
    topography[0].map do |location|
      step_up(location, 0)
    end.flatten.count
  end

  def find_neigbours(location)
    [Location.new(y: location.y - 1, x: location.x),
     Location.new(y: location.y, x: location.x - 1),
     Location.new(y: location.y + 1, x: location.x),
     Location.new(y: location.y, x: location.x + 1)]
      .select { |level| level.x >= 0 && level.y >= 0 }
  end

  def step_up(location, level)
    if level == 9
      return location
    else
      next_level = level + 1
      neighbours = find_neigbours(location)
      neighbours.intersection(topography[next_level]).map do |next_location|
        step_up(next_location, next_level)
      end
    end
  end

  def step_up2(location, level, score)
    if level == 9
      return score + 1
    else
      next_level = level + 1
      neighbours = find_neigbours(location)

      match = neighbours.intersection(topography[next_level])
      return 0 if match.blank?

      match.map do |next_location|
        step_up2(next_location, next_level, score)
      end
    end
  end
end
