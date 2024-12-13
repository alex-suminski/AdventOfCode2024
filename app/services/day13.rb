class Day13
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(13)
  end

  def part1
    cost = 0
    input.each_slice(4) do |clawA, clawB, prize, _|
      alt_costs = []
      xA, yA = clawA.scan(/[X][+](\d{1,}), [Y][+](\d{1,})/).first.map(&:to_i)
      xB, yB = clawB.scan(/[X][+](\d{1,}), [Y][+](\d{1,})/).first.map(&:to_i)
      xP, yP = prize.scan(/[X][=](\d{1,}), [Y][=](\d{1,})/).first.map(&:to_i)
      if xA >= (xB * 3) || yA >= (yB * 3)
        puts clawA, clawB, prize, _
        (0..100).map do |i|
          move_xB = xB * i
          move_yB = yB * i
          if move_xB > xP || move_yB > yP
            break
          elsif ((xP - move_xB) % xA == 0) &&
                ((yP - move_yB) % yA == 0) &&
                (((xP - move_xB) / xA) == ((yP - move_yB) / yA))
            # ((xP - move_xB) / xA) == ((yP - move_yB) / yA)
            alt_costs << (i + (((xP - move_xB) / xA) * 3))
          else
            next
          end
        end
      end
      (0..100).map do |i|
        move_xA = xA * i
        move_yA = yA * i
        if move_xA > xP || move_yA > yP
          break
        elsif ((xP - move_xA) % xB == 0) &&
              ((yP - move_yA) % yB == 0) &&
              (((xP - move_xA) / xB) == ((yP - move_yA) / yB))
          alt_costs << (i * 3) + ((xP - move_xA) / xB)
          # break
        else
          next
        end
      end
      puts "==========================="
      print alt_costs
      puts "==========================="
      cost += alt_costs.min || 0
    end
    cost
  end

  def part2
    input
    0
  end
end
