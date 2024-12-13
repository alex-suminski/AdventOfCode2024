class Day12
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(13)
  end

  def part1
    cost = 0
    input.each_slice(4) do |clawA, clawB, prize, _|
      xA, yA = clawA.scan(/[X][+](\d{1,}), [Y][+](\d{1,})/).first.map(&:to_i)
      xB, yB = clawB.scan(/[X][+](\d{1,}), [Y][+](\d{1,})/).first.map(&:to_i)
      xP, yP = prize.scan(/[X][=](\d{1,}), [Y][=](\d{1,})/).first.map(&:to_i)
      (0..100).map do |i|
        move_xA = xA * i
        move_yA = yA * i
        if move_xA > xP || move_yA > yP
          break
        elsif (xP - move_xA % xB == 0) && (yP - move_yA % yB == 0)
          cost += (i * 3) + (xP - move_xA / xB)
          break
        else
          next
        end
      end
    end
    cost
  end

  def part2
    input
    0
  end
end
