class DaysController < ActionController::Base
  CALENDAR = [0, Day1.new, Day2.new].freeze
  CURRENT_DAY = 2

  def current
    day_solver = CALENDAR[CURRENT_DAY]
    @answer = day_solver.part1
    @answer2 = day_solver.part2
    @response1 = params[:response1]
    @response2 = params[:response2]
  end

  def post1
    redirect_to controller: 'days', action: 'current',
                response1: TaskAnswerChecker.new(CURRENT_DAY).call(1, params[:answer])
  end

  def post2
    redirect_to controller: 'days', action: 'current',
                response2: TaskAnswerChecker.new(CURRENT_DAY).call(2, params[:answer])
  end
end
