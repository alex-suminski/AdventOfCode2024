class Day7
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(7)
  end

  def part1
    # return "solved"
    input.sum do |line|
      value_raw, numbers_raw = line.split(':')
      puts value_raw
      value = value_raw.to_i
      numbers = numbers_raw.split.map(&:to_i)
      positions = numbers.size
      permutations = manatee(positions)

      yes = permutations.any? do |perm|
        head, *tail = numbers
        result = tail.each_with_index.reduce(head) do |acc, ((v), i)|
          acc = acc.public_send(perm[i], v)
          break acc if (acc == value) && (tail.size - 1 == i)
          break acc if acc > value

          acc
        end
        result == value
      end
      if yes
        value
      else
        0
      end
    end
  end

  def part2
    input.sum do |line|
      value_raw, numbers_raw = line.split(':')
      value = value_raw.to_i
      numbers = numbers_raw.split.map(&:to_i)
      positions = numbers.size
      permutations = manatees(positions)

      yes = permutations.any? do |perm|
        head, *tail = numbers
        result = tail.each_with_index.reduce(head) do |acc, ((v), i)|
          acc = if perm[i] == '||'
                  "#{acc}#{v}".to_i
                else
                  acc.public_send(perm[i], v)
                end
          if (acc == value) && (tail.size - 1 == i)
            break acc
          elsif acc > value
            break acc
          end

          acc
        end
        result == value
      end
      # debugger

      if yes
        value
      else
        0
      end
    end
  end

  def manatee(size)
    operators = ['+', '*']
    (0..size - 2).reduce(operators) do |acc, _|
      acc.product(operators).map(&:flatten)
    end
  end

  def manatees(size)
    operators = ['+', '*', '||']
    (0..[0, size - 3].max).reduce(operators) do |acc, _|
      acc.product(operators).map(&:flatten)
    end
  end
end
