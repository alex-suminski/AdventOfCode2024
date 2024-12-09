class Day8
  attr_reader :input

  Location = Struct.new(:x, :y, keyword_init: true)

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(8)
  end

  def part1
    mapping = Hash.new { |h, k| h[k] = [] }
    input.each_with_index do |line, y|
      line.chars.each_with_index do |char, x|
        if char == '.'
        else
          mapping[char] << Location.new(x: x, y: y)
        end
      end
    end
    antinodes = []
    mapping.each do |_, locations|
      next if locations.size < 2

      locations.combination(2) do |antena1, antena2|
        if antena1.y < antena2.y
          y_diff = antena2.y - antena1.y
          if antena1.x < antena2.x
            x_diff = antena2.x - antena1.x
            node1 = Location.new(x: antena1.x - x_diff, y: antena1.y - y_diff)
            node2 = Location.new(x: antena2.x + x_diff, y: antena2.y + y_diff)
            antinodes += [node1, node2]
          elsif antena1.x > antena2.x
            x_diff = antena1.x - antena2.x
            node1 = Location.new(x: antena1.x + x_diff, y: antena1.y - y_diff)
            node2 = Location.new(x: antena2.x - x_diff, y: antena2.y + y_diff)
            antinodes += [node1, node2]
          else
            raise 'dupa'
          end
        else
          raise 'ass'
        end
      end
    end
    antinodes.uniq.count do |node|
      node.x >= 0 && node.x < input.first.size && node.y >= 0 && node.y < input.size
    end
  end

  def part2
    mapping = Hash.new { |h, k| h[k] = [] }
    input.each_with_index do |line, y|
      line.chars.each_with_index do |char, x|
        if char == '.'
        else
          mapping[char] << Location.new(x: x, y: y)
        end
      end
    end
    y_size = input.size
    x_size = input.first.size

    antinodes = []
    mapping.each do |_, locations|
      next if locations.size < 2

      locations.combination(2) do |antena1, antena2|
        if antena1.y < antena2.y
          y_diff = antena2.y - antena1.y
          y = 0
          if antena1.x < antena2.x
            x_diff = antena2.x - antena1.x
            nodes_right =
              (antena1.x..x_size).step(x_diff).map do |x|
                l = Location.new(x: x, y: antena1.y + y)
                y += y_diff
                l
              end
            y = 0
            nodes_left =
              (-antena1.x..0).step(x_diff).map do |x|
                l = Location.new(x: -x, y: antena1.y - y)
                y += y_diff
                l
              end
            antinodes += nodes_right
            antinodes += nodes_left
          elsif antena1.x > antena2.x
            x_diff = antena1.x - antena2.x
            nodes_right =
              (antena1.x..x_size).step(x_diff).map do |x|
                l = Location.new(x: x, y: antena1.y - y)
                y += y_diff
                l
              end
            y = 0
            nodes_left =
              (-antena1.x..0).step(x_diff).map do |x|
                l = Location.new(x: -x, y: antena1.y + y)
                y += y_diff
                l
              end
            antinodes += nodes_right
            antinodes += nodes_left
          else
            raise 'dupa'
          end
        else
          raise 'ass'
        end
      end
    end

    antinodes.flatten.uniq.count do |node|
      node.x >= 0 && node.x < x_size && node.y >= 0 && node.y < y_size
    end
  end
end
