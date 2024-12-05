class DaysController < ActionController::Base
  CURRENT_DAY = 4

  def current
    day_solver = Object.const_get("Day#{CURRENT_DAY}").new
    @answer = day_solver.part1
    @answer2 = day_solver.part2
    @congrats_msg = params[:congrats_msg]
  end

  def post1
    post(1)
  end

  def post2
    post(2)
  end

  def post(part)
    redirect_to controller: 'days', action: 'current',
                congrats_msg: TaskAnswerChecker.new(CURRENT_DAY).call(part, params[:answer])
  end
end
