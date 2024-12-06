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
  SpotHit = Struct.new(:x, :y, :direction, keyword_init: true)

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(6)
  end

  def part1
    size_y = input.length
    size_x = input.first.length
    obstacles, guard = find_obstacles(input)
    visited = [Spot.new(y: guard.y, x: guard.x)]
    (0..1000).each { |_|
      if guard.direction == 1
        hit = hit_up(guard, obstacles)
        unless hit
          visited.concat((0..guard.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
          break
        end

        visited.concat((hit.y + 1..guard.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
        guard.y = hit.y + 1
        guard.direction += 1
      elsif guard.direction == 2
        hit = hit_right(guard, obstacles)
        unless hit
          visited.concat((guard.x + 1..size_x - 1).map { |x| Spot.new(x: x, y: guard.y) })
          break
        end

        visited.concat((guard.x + 1..hit.x - 1).map { |x| Spot.new(x: x, y: guard.y) })
        guard.x = hit.x - 1
        guard.direction += 1
      elsif guard.direction == 3
        hit = hit_down(guard, obstacles)
        unless hit
          visited.concat((guard.y + 1..(size_y - 1)).map { |y| Spot.new(x: guard.x, y: y) })
          break
        end

        visited.concat((guard.y + 1..hit.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
        guard.y = hit.y - 1
        guard.direction += 1
      elsif guard.direction == 4
        hit = hit_left(guard, obstacles)
        unless hit
          visited.concat((0..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) })
          break
        end

        visited.concat((hit.x + 1..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) })
        guard.x = hit.x + 1
        guard.direction = 1
      end
    }
    visited.uniq.count
  end

  def hit_up(guard, obstacles)
    obstacles.select { |obst|
      obst.x == guard.x && obst.y < guard.y
    }.sort_by { |obs| obs.y }.last
  end

  def hit_right(guard, obstacles)
    obstacles.select { |obst|
      obst.x > guard.x && obst.y == guard.y
    }.sort_by { |obs| obs.x }.first
  end

  def hit_down(guard, obstacles)
    obstacles.select { |obst|
      obst.x == guard.x && obst.y > guard.y
    }.sort_by { |obs| obs.y }.first
  end

  def hit_left(guard, obstacles)
    obstacles.select { |obst|
      obst.x < guard.x && obst.y == guard.y
    }.sort_by { |obs| obs.x }.last
  end

  def part2
    obstacles, guard = find_obstacles(input)

    size_y = input.length
    size_x = input.first.length
    visited = [Spot.new(y: guard.y, x: guard.x)]
    spot_hits = []
    bariers = []
    (0..1000).each { |_|
      if guard.direction == 1
        hit = hit_up(guard, obstacles)
        unless hit
          visited.concat((0..guard.y - 1).map { |y| Spot.new(x: guard.x, y: y) })

          new_visited = (0..guard.y).map { |y| Spot.new(x: guard.x, y: y) }
          bariers.concat(would_hit?(new_visited, spot_hits, guard.direction, obstacles))

          break
        end
        new_visited = (hit.y + 1..guard.y).map { |y| Spot.new(x: guard.x, y: y) }
        bariers.concat(would_hit?(new_visited, spot_hits, guard.direction, obstacles))

        spot_hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)
        visited.concat(new_visited)
        guard.y = hit.y + 1
        guard.direction += 1
      elsif guard.direction == 2
        hit = hit_right(guard, obstacles)
        unless hit
          visited.concat((guard.x + 1..size_x - 1).map { |x| Spot.new(x: x, y: guard.y) })

          new_visited = (guard.x + 1..size_x - 1).map { |x| Spot.new(x: x, y: guard.y) }
          bariers.concat(would_hit?(new_visited, spot_hits, guard.direction, obstacles))
          break
        end
        new_visited = (guard.x + 1..hit.x - 1).map { |x| Spot.new(x: x, y: guard.y) }
        bariers.concat(would_hit?(new_visited, spot_hits, guard.direction, obstacles))
        spot_hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)

        visited.concat((guard.x + 1..hit.x - 1).map { |x| Spot.new(x: x, y: guard.y) })
        guard.x = hit.x - 1
        guard.direction += 1
      elsif guard.direction == 3
        hit = hit_down(guard, obstacles)
        unless hit
          visited.concat((guard.y + 1..size_y - 1).map { |y| Spot.new(x: guard.x, y: y) })

          new_visited = (guard.y + 1..size_y - 1).map { |y| Spot.new(x: guard.x, y: y) }
          bariers.concat(would_hit?(new_visited, spot_hits, guard.direction, obstacles))
          break
        end
        new_visited = (guard.y + 1..hit.y - 1).map { |y| Spot.new(x: guard.x, y: y) }
        bariers.concat(would_hit?(new_visited, spot_hits, guard.direction, obstacles))
        spot_hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)

        visited.concat((guard.y + 1..hit.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
        guard.y = hit.y - 1
        guard.direction += 1
      elsif guard.direction == 4
        hit = hit_left(guard, obstacles)
        unless hit
          visited.concat((0..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) })

          new_visited = (0..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) }
          bariers.concat(would_hit?(new_visited, spot_hits, guard.direction, obstacles))
          break
        end
        new_visited = (hit.x + 1..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) }
        bariers.concat(would_hit?(new_visited, spot_hits, guard.direction, obstacles))

        spot_hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)
        visited.concat(new_visited)
        guard.x = hit.x + 1
        guard.direction = 1
      end
    }
    bariers.uniq.count
  end

  def would_hit?(positions, hits, direction, obstacles)
    bariers = []
    if direction == 4
      positions.select { |position|
        hit = hit_up(Guard.new(x: position.x, y: position.y, direction: 1), obstacles)
        next unless hit

        # debugger

        new_barier = Spot.new(y: position.y, x: position.x - 1)
        if is_loop?(Guard.new(x: position.x, y: position.y, direction: 1), obstacles + [new_barier])
          # puts new_barier
          bariers << new_barier
        end
      }
    end
    if direction == 1
      positions.select { |position|
        hit = hit_right(Guard.new(x: position.x, y: position.y, direction: 2), obstacles)
        next unless hit

        # debugger

        new_barier = Spot.new(y: position.y - 1, x: position.x)
        if is_loop?(Guard.new(x: position.x, y: position.y, direction: 2), obstacles + [new_barier])
          # puts new_barier
          bariers << new_barier
        end
      }
    end
    if direction == 2
      positions.select { |position|
        hit = hit_down(Guard.new(x: position.x, y: position.y, direction: 3), obstacles)
        next unless hit

        # debugger

        new_barier = Spot.new(y: position.y, x: position.x + 1)
        if is_loop?(Guard.new(x: position.x, y: position.y, direction: 3), obstacles + [new_barier])
          # puts new_barier
          bariers << new_barier
        end
      }
    end
    if direction == 3
      positions.each { |position|
        hit = hit_left(Guard.new(x: position.x, y: position.y, direction: 4), obstacles)
        next unless hit

        # debugger
        # debugger
        new_barier = Spot.new(y: position.y + 1, x: position.x)

        if is_loop?(Guard.new(x: position.x, y: position.y, direction: 4), obstacles + [new_barier])
          # puts new_barier
          bariers << new_barier
        end
      }
    end
    bariers
  end

  def find_obstacles(input)
    guard = []
    obstacles = []
    input.each_with_index { |line, y|
      line.chars.each_with_index { |el, x|
        if el == '#'
          obstacles << Obstacle.new(y: y, x: x)
        elsif el == '^'
          guard = Guard.new(y: y, x: x, direction: DIRECTIONS[el])
        end
      }
    }
    [obstacles, guard]
  end

  def is_loop?(guard, obstacles)
    loop = true
    hits = []

    (0..100).each { |_|
      if guard.direction == 1
        hit = hit_up(guard, obstacles)
        unless hit
          loop = false
          break
        end
        if hits.include?(hit)
          break
        end

        hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)
        guard.y = hit.y + 1
        guard.direction += 1
      elsif guard.direction == 2
        hit = hit_right(guard, obstacles)
        unless hit
          loop = false
          break
        end
        if hits.include?(hit)
          break
        end

        hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)

        guard.x = hit.x - 1
        guard.direction += 1
      elsif guard.direction == 3
        hit = hit_down(guard, obstacles)
        unless hit
          loop = false
          break
        end
        if hits.include?(hit)
          break
        end

        hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)

        guard.y = hit.y - 1
        guard.direction += 1
      elsif guard.direction == 4
        hit = hit_left(guard, obstacles)
        unless hit
          loop = false
          break
        end
        if hits.include?(hit)
          break
        end

        hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)

        guard.x = hit.x + 1
        guard.direction = 1
      end
    }
    loop
  end
end
