class Day3
  attr_reader :input

  MUL = /mul\(\d{1,3},\d{1,3}\)/

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(3)
  end

  def part1
    input.sum { |line| scan_line(line) }
  end

  def part2
    cleanup_input(input.join).sum { |part| scan_line(part) }
  end

  def scan_line(line)
    line.scan(MUL).sum do |mul|
      mul[4..-2].split(',').map(&:to_i).inject(:*)
    end
  end

  def cleanup_input(line)
    narwal = line.split("don't()")
    fang, *fin = narwal
    clean_fin = fin.flat_map { |scale| scale.split('do()')[1..] }
    clean_fin << fang
  end
end
