class Day6First
  attr_reader :input

  DIRECTIONS = {
    '^' => 1,
    '>' => 2,
    'd' => 3,
    '<' => 4,
  }

  Guard = Struct.new(:x, :y, :direction, keyword_init: true)
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
    (0..1000).each { |i|
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
    (0..200).each { |i|
      if guard.direction == 1
        hit = hit_up(guard, obstacles)
        unless hit
          visited.concat((0..guard.y - 1).map { |y| Spot.new(x: guard.x, y: y) })

          new_visited = (0..guard.y).map { |y| Spot.new(x: guard.x, y: y) }
          bariers.concat(would_hit?(new_visited, guard.direction, obstacles))

          break
        end
        new_visited = (hit.y + 1..guard.y).map { |y| Spot.new(x: guard.x, y: y) }
        bariers.concat(would_hit?(new_visited, guard.direction, obstacles))

        spot_hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)
        visited.concat(new_visited)
        guard.y = hit.y + 1
        guard.direction += 1
      elsif guard.direction == 2
        hit = hit_right(guard, obstacles)
        unless hit
          visited.concat((guard.x + 1..size_x - 1).map { |x| Spot.new(x: x, y: guard.y) })

          new_visited = (guard.x + 1..size_x - 1).map { |x| Spot.new(x: x, y: guard.y) }
          bariers.concat(would_hit?(new_visited, guard.direction, obstacles))
          break
        end
        new_visited = (guard.x + 1..hit.x - 1).map { |x| Spot.new(x: x, y: guard.y) }
        bariers.concat(would_hit?(new_visited, guard.direction, obstacles))
        spot_hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)

        visited.concat((guard.x + 1..hit.x - 1).map { |x| Spot.new(x: x, y: guard.y) })
        guard.x = hit.x - 1
        guard.direction += 1
      elsif guard.direction == 3
        hit = hit_down(guard, obstacles)
        unless hit
          visited.concat((guard.y + 1..size_y - 1).map { |y| Spot.new(x: guard.x, y: y) })

          new_visited = (guard.y + 1..size_y - 1).map { |y| Spot.new(x: guard.x, y: y) }
          bariers.concat(would_hit?(new_visited, guard.direction, obstacles))
          break
        end
        new_visited = (guard.y + 1..hit.y - 1).map { |y| Spot.new(x: guard.x, y: y) }
        bariers.concat(would_hit?(new_visited, guard.direction, obstacles))
        spot_hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)

        visited.concat((guard.y + 1..hit.y - 1).map { |y| Spot.new(x: guard.x, y: y) })
        guard.y = hit.y - 1
        guard.direction += 1
      elsif guard.direction == 4
        hit = hit_left(guard, obstacles)
        unless hit
          visited.concat((0..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) })

          new_visited = (0..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) }
          bariers.concat(would_hit?(new_visited, guard.direction, obstacles))
          break
        end
        new_visited = (hit.x + 1..guard.x - 1).map { |x| Spot.new(x: x, y: guard.y) }
        bariers.concat(would_hit?(new_visited, guard.direction, obstacles))

        spot_hits << SpotHit.new(x: hit.x, y: hit.y, direction: guard.direction)
        visited.concat(new_visited)
        guard.x = hit.x + 1
        guard.direction = 1
      end
    }
    # debugger
    bariers_final = bariers.uniq - obstacles
    # bariers_really_final = doubt_check(bariers_final)

    bariers_final
  end

  def doubt_check(bariers)
    obstacles, guard = find_obstacles(input)
    bariers.select { |b|
      win = (obstacles + [b]).sort_by { |b| [b.y, b.x] }
      is_loop?(guard, win)
    }
  end

  def would_hit?(positions, direction, obstacles)
    bariers = []
    if direction == 4
      positions.select { |position|
        hit = hit_up(Guard.new(x: position.x, y: position.y, direction: 1), obstacles)
        next unless hit

        new_barier = Spot.new(y: position.y, x: position.x - 1)
        if is_loop?(Guard.new(x: position.x, y: position.y, direction: 1), obstacles + [new_barier])
          bariers << new_barier
        end
      }
    elsif direction == 1
      positions.select { |position|
        hit = hit_right(Guard.new(x: position.x, y: position.y, direction: 2), obstacles)
        next unless hit

        new_barier = Spot.new(y: position.y - 1, x: position.x)
        if is_loop?(Guard.new(x: position.x, y: position.y, direction: 2), obstacles + [new_barier])
          bariers << new_barier
        end
      }
    elsif direction == 2
      positions.select { |position|
        hit = hit_down(Guard.new(x: position.x, y: position.y, direction: 3), obstacles)
        next unless hit

        new_barier = Spot.new(y: position.y, x: position.x + 1)
        if is_loop?(Guard.new(x: position.x, y: position.y, direction: 3), obstacles + [new_barier])
          bariers << new_barier
        end
      }
    elsif direction == 3
      positions.each { |position|
        hit = hit_left(Guard.new(x: position.x, y: position.y, direction: 4), obstacles)
        next unless hit

        new_barier = Spot.new(y: position.y + 1, x: position.x)

        if is_loop?(Guard.new(x: position.x, y: position.y, direction: 4), obstacles + [new_barier])
          bariers << new_barier
        end
      }
    end
    bariers
  end

  def is_loop?(guard, obstacles)
    guard_tmp = Guard.new(x: guard.x, y: guard.y, direction: guard.direction)
    loop = true
    hits = []

    (0..200).each { |i|
      if i == 199
        raise "dupa"
      end

      if guard_tmp.direction == 1
        hit = hit_up(guard_tmp, obstacles)
        unless hit
          loop = false
          break
        end
        new_hit = SpotHit.new(x: hit.x, y: hit.y, direction: guard_tmp.direction)
        if hits.include?(new_hit)
          break
        end

        hits << new_hit
        guard_tmp.y = hit.y + 1
        guard_tmp.direction += 1
      elsif guard_tmp.direction == 2
        hit = hit_right(guard_tmp, obstacles)
        unless hit
          loop = false
          break
        end
        new_hit = SpotHit.new(x: hit.x, y: hit.y, direction: guard_tmp.direction)
        if hits.include?(new_hit)
          break
        end

        hits << new_hit

        guard_tmp.x = hit.x - 1
        guard_tmp.direction += 1
      elsif guard_tmp.direction == 3
        hit = hit_down(guard_tmp, obstacles)
        unless hit
          loop = false
          break
        end
        new_hit = SpotHit.new(x: hit.x, y: hit.y, direction: guard_tmp.direction)
        if hits.include?(new_hit)
          break
        end

        hits << new_hit

        guard_tmp.y = hit.y - 1
        guard_tmp.direction += 1
      elsif guard_tmp.direction == 4
        hit = hit_left(guard_tmp, obstacles)
        unless hit
          loop = false
          break
        end
        new_hit = SpotHit.new(x: hit.x, y: hit.y, direction: guard_tmp.direction)
        if hits.include?(new_hit)
          break
        end

        hits << new_hit

        guard_tmp.x = hit.x + 1
        guard_tmp.direction = 1
      end
    }
    loop
  end

  def find_obstacles(input)
    guard = []
    obstacles = []
    input.each_with_index { |line, y|
      line.chars.each_with_index { |el, x|
        if el == '#'
          obstacles << Spot.new(y: y, x: x)
        elsif el == '^'
          guard = Guard.new(y: y, x: x, direction: DIRECTIONS[el])
        end
      }
    }
    [obstacles, guard]
  end
end
