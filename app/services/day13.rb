require 'bigdecimal'

class Day13
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
        elsif ((xP - move_xA) % xB == 0) &&
              ((yP - move_yA) % yB == 0) &&
              (((xP - move_xA) / xB) == ((yP - move_yA) / yB))
          cost += (i * 3) + ((xP - move_xA) / xB)
          break
        else
          next
        end
      end
    end

    cost
    math
  end

  def part2
    math(shift: 10000000000000)
  end

  # def punkt_przeciecia_z_x(y, x, a)
  #   -((y - x * a) / a)
  # end

  def math(shift: 0)
    time = Time.current
    cost = 0

    input.each_slice(4) do |clawA, clawB, prize, _|
      xA, yA = clawA.scan(/[X][+](\d{1,}), [Y][+](\d{1,})/).first.map(&:to_i)
      xB, yB = clawB.scan(/[X][+](\d{1,}), [Y][+](\d{1,})/).first.map(&:to_i)
      xP, yP = prize.scan(/[X][=](\d{1,}), [Y][=](\d{1,})/).first.map { |z| z.to_i + shift }

      aB = BigDecimal(yB) / BigDecimal(xB)
      bB = BigDecimal(0.0)

      aA = BigDecimal(yA) / BigDecimal(xA)

      # x0 = punkt_przeciecia_z_x(yP, xP, aA)
      bA = find_b(BigDecimal(xP), BigDecimal(yP), BigDecimal(aA))

      x, y = punkt_przeciecia(BigDecimal(aA), BigDecimal(aB), BigDecimal(bA), BigDecimal(bB))
      prec = 5
      x_moves = x / xB
      y_moves = (xP - x) / xA
      # debugger
      if (x_moves.round == x_moves.round(prec)) && (y_moves.round == y_moves.round(prec))
        cost += (x_moves + y_moves * 3).round
      end
    end
    puts (Time.current - time)
    cost
  end

  def find_b(x, y, a)
    y - a * x
  end

  def punkt_przeciecia(a1, a2, b1, b2)
    if a1 == a2
      raise "zero"
    end

    x = (b2 - b1) / (a1 - a2)
    y = a1 * ((b2 - b1) / (a1 - a2)) * x + b1

    [x, y]
  end
end
