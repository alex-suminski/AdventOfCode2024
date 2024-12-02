class Day2FuckThisImGoingBurteForce
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(2)
  end

  def part1
    input.select { |line| valid?(line) }.count
  end

  def part2
    input.select { |line| valid2?(line) }.count
  end

  def valid?(line)
    increasing = true
    decreasing = true
    diff = true
    line.split.map(&:to_i).each_cons(2) do |x, y|
      break unless increasing || decreasing

      increasing = false if x >= y
      decreasing = false if x <= y
      diff = false if (x - y).abs > 3
    end
    (increasing || decreasing) & diff
  end

  def valid2?(line)
    increasing = true
    decreasing = true

    @dampened_increase_level = -1
    @dampened_decrease_level = -1

    line.split.map(&:to_i).each_cons(2).to_a.each_with_index do |(x, y), i|
      puts '=========================='
      puts x, y, i
      puts line
      increasing = increasing?(x, y, i, line) if increasing
      decreasing = decreasing?(x, y, i, line) if decreasing
      puts increasing
      puts decreasing
      puts '=========================='
    end
    increasing || decreasing
  end

  def increasing?(x, y, i, line)
    x = read_previous_x(line, i).to_i if at_dumpened_level?(i)
    # debugger
    if all_good?(x, y)
      true
    elsif something_wrong?(x, y)
      if dumpening_not_used?
        dumpen_y(i)
        true
      else
        false
      end
    else
      raise 'dupa'
    end
  end

  def dumpening_not_used?
    @dampened_increase_level == -1
  end

  def dumpen_y(i)
    @dampened_increase_level = i + 1
  end

  def at_dumpened_level?(i)
    @dampened_increase_level == i
  end

  def read_previous_x(line, i)
    line[i - 1]
  end

  def all_good?(x, y)
    x < y && (x - y).abs <= 3
  end

  def something_wrong?(x, y)
    x >= y || (x - y).abs > 3
  end

  def decreasing?(x, y, i, line)
    xx = if at_dumpened_level2?(i)
           read_previous_x(line, i).to_i
         else
           x
         end

    if all_good2?(xx, y)
      true
    elsif something_wrong2?(xx, y)
      if dumpening_not_used2?
        dumpen_y2(i)
        true
      else
        false
      end
    else
      raise 'dupa'
    end
  end

  def all_good2?(x, y)
    x > y && (x - y).abs <= 3
  end

  def something_wrong2?(x, y)
    x <= y || (x - y).abs > 3
  end

  def dumpening_not_used2?
    @dampened_decrease_level == -1
  end

  def dumpen_y2(i)
    @dampened_decrease_level = i + 1
  end

  def at_dumpened_level2?(i)
    @dampened_decrease_level == i
  end
end
