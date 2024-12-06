class Day6
  attr_reader :input

  DIRECTIONS = {
    '^' => 1,
    '>' => 2,
    'd' => 3,
    '<' => 4,
  }

  Guard = Struct.new(:x, :y, :direction, keyword_init: true)
  Obstacle = Struct.new(:x, :y, keyword_init: true)
  Spot = Struct.new(:x, :y, keyword_init: true)

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(6)
  end

  def part1
    size_y = input.length
    size_x = input.first.length
    obstacles, guard = find_obstacles(input)
    visited = [Spot.new(y: guard.y, x: guard.x)]
    (0..100000).each { |_|
      if guard.direction == 1
        hit = obstacles.select { |obst|
          obst.x == guard.x && obst.y < guard.y
        }.last
        unless hit
          visited.concat((0..guard.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
          break
        end

        visited.concat((hit.y + 1..guard.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
        guard.y = hit.y + 1
        guard.direction += 1
      elsif guard.direction == 2
        hit = obstacles.select { |obst|
          obst.x > guard.x && obst.y == guard.y
        }.first
        unless hit
          visited.concat((guard.x + 1..size_x - 1).map { |x| Spot.new(x: x, y: guard.y) })
          break
        end

        visited.concat((guard.x + 1..hit.x - 1).map { |x| Spot.new(x: x, y: guard.y) })
        guard.x = hit.x - 1
        guard.direction += 1
      elsif guard.direction == 3
        hit = obstacles.select { |obst|
          obst.x == guard.x && obst.y > guard.y
        }.first
        unless hit
          visited.concat((guard.y + 1..(size_y - 1)).map { |y| Spot.new(x: guard.x, y: y) })
          break
        end

        visited.concat((guard.y + 1..hit.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
        guard.y = hit.y - 1
        guard.direction += 1
      elsif guard.direction == 4
        hit = obstacles.select { |obst|
          obst.x < guard.x && obst.y == guard.y
        }.last
        unless hit
          visited.concat((0..guard.x - 1).map { |y| Spot.new(x: x, y: guard.y) })
          break
        end

        visited.concat((hit.x + 1..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) })
        guard.x = hit.x + 1
        guard.direction = 1
      end
    }
    visited.uniq.count
  end

  def part2
    size_y = input.length
    size_x = input.first.length
    obstacles, guard = find_obstacles(input)
    visited = [Spot.new(y: guard.y, x: guard.x)]
    (0..100000).each { |_|
      if guard.direction == 1
        hit = obstacles.select { |obst|
          obst.x == guard.x && obst.y < guard.y
        }.last
        unless hit
          visited.concat((0..guard.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
          break
        end

        visited.concat((hit.y + 1..guard.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
        guard.y = hit.y + 1
        guard.direction += 1
      elsif guard.direction == 2
        hit = obstacles.select { |obst|
          obst.x > guard.x && obst.y == guard.y
        }.first
        unless hit
          visited.concat((guard.x + 1..size_x - 1).map { |x| Spot.new(x: x, y: guard.y) })
          break
        end

        visited.concat((guard.x + 1..hit.x - 1).map { |x| Spot.new(x: x, y: guard.y) })
        guard.x = hit.x - 1
        guard.direction += 1
      elsif guard.direction == 3
        hit = obstacles.select { |obst|
          obst.x == guard.x && obst.y > guard.y
        }.first
        unless hit
          visited.concat((guard.y + 1..(size_y - 1)).map { |y| Spot.new(x: guard.x, y: y) })
          break
        end

        visited.concat((guard.y + 1..hit.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
        guard.y = hit.y - 1
        guard.direction += 1
      elsif guard.direction == 4
        hit = obstacles.select { |obst|
          obst.x < guard.x && obst.y == guard.y
        }.last
        unless hit
          visited.concat((0..guard.x - 1).map { |y| Spot.new(x: x, y: guard.y) })
          break
        end

        visited.concat((hit.x + 1..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) })
        guard.x = hit.x + 1
        guard.direction = 1
      end
    }
    visited.uniq.count
  end

  def find_obstacles(input)
    guard = []
    obstacles = []
    input.each_with_index { |line, y|
      line.chars.each_with_index { |el, x|
        if el == '#'
          obstacles << Obstacle.new(y: y, x: x)
        elsif el == '^'
          # debugger
          guard = Guard.new(y: y, x: x, direction: DIRECTIONS[el])
        end
      }
    }
    [obstacles, guard]
  end
end
