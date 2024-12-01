class DaysController < ActionController::Base
  def current
    day1
  end

  def day1
    @answer = Day1.new.call
  end
end

