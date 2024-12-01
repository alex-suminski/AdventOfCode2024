class DaysController < ActionController::Base
  def current
    day1
  end

  def day1
    day1 = Day1.new
    @answer = day1.part1
    @answer2 = day1.part2
  end
end
