class Day7
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(7)
  end

  def part1
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
    # input
  end

  def manatee(size)
    operators = ['+', '*']
    (0..size - 2).reduce(operators) { |acc, i|
      acc.product(['*', '+']).map(&:flatten)
    }
  end
end
