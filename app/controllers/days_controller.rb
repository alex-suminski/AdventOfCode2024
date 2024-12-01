class DaysController < ActionController::Base
  def current
    day2
  end

  def day1
    day = Day1.new
    @answer = day.part1
    @answer2 = day.part2
  end

  def day2
    day = Day2.new
    @answer = day.part1
    @answer2 = day.part2
  end

  def day2
    day = Day1.new
    @answer = day.part1
    @answer2 = day.part2
  end
end
