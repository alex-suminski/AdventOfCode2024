class Day4
  attr_reader :input

  MMS = ['MS', 'SM']

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(4)
  end

  def part1
    h = input.sum do |string|
      count_xmas(string)
    end
    matrix = input.map(&:chars)
    v = matrix.transpose.sum do |string|
      count_xmas(string.join)
    end
    d = count_diagonals(matrix)
    d2 = count_diagonals(matrix.map(&:reverse))

    h + v + d + d2
  end

  def part2
    acc = 0
    input.map(&:chars).each_with_index do |line, y|
      next if y == 0 || y == input.size - 1

      line.each_with_index do |char, x|
        next if x == 0 || x == line.size - 1

        if char == 'A' && check_neighbors(input, y, x)
          acc += 1
        end
      end
    end
    acc
  end

  def check_neighbors(input, y, x)
    MMS.include?(input[y - 1][x - 1] + input[y + 1][x + 1]) &&
      MMS.include?(input[y - 1][x + 1] + input[y + 1][x - 1])
  end

  def count_xmas(string)
    string.scan('XMAS').count + string.scan('SAMX').count
  end

  def count_diagonals(matrix)
    height = matrix.size - 1
    start = 3
    finish = height - start + height

    (start..finish).sum { |i|
      scan_diagonal(matrix, height, i)
    }
  end

  def scan_diagonal(matrix, height, start)
    diagonal = []
    (0..height).map do |i|
      y = 0 + i
      x = start - i
      letter = matrix[y][x]
      if x >= 0 && letter
        diagonal << letter
      end
    end

    count_xmas(diagonal.compact.join)
  end
end
