class Day7
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(7)
  end

  def part1
    return "solved"
    input.sum { |line|
      value_raw, numbers_raw = line.split(":")
      puts value_raw
      value = value_raw.to_i
      numbers = numbers_raw.split.map(&:to_i)
      positions = numbers.size
      permutations = manatee(positions)

      yes = permutations.any? { |perm|
        result = numbers.each_with_index.reduce(0) { |acc, ((v), i)|
          acc = acc.public_send(perm[i], v)
          if acc >= value
            break acc
          end

          acc
        }
        result == value
      }
      if yes
        value
      else
        0
      end
    }
  end

  def part2
    input.sum { |line|
      value_raw, numbers_raw = line.split(":")
      puts value_raw
      value = value_raw.to_i
      numbers = numbers_raw.split.map(&:to_i)
      positions = numbers.size
      permutations = manatees(positions)

      yes = permutations.any? { |perm|
        result = numbers.each_with_index.reduce(0) { |acc, ((v), i)|
          acc = if perm[i] == '||'
                  "#{acc}#{v}".to_i
                else
                  acc.public_send(perm[i], v)
                end
          if acc >= value
            break acc
          end

          acc
        }
        result == value
      }
      if yes
        value
      else
        0
      end
    }
  end

  def manatee(size)
    operators = ['+', '*']
    (0..size - 2).reduce(operators) { |acc, _|
      acc.product(operators).map(&:flatten)
    }
  end

  def manatees(size)
    operators = ['+', '*', '||']
    (0..size - 1).reduce(operators) { |acc, _|
      acc.product(operators).map(&:flatten)
    }
  end

  def manateess(size, operators)
    count_operators = operators.count
    (0..size - 1).reduce(operators) { |acc, _|
      acc.product(operators).map(&:flatten)
    }
  end
end
