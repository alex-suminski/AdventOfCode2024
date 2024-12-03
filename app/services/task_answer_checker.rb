class TaskAnswerChecker
  attr_reader :day

  MAIN = %r{(?<=<main>\n<article><p>)(.*?)(?=</a></p></article>\n</main>)}

  def initialize(day)
    @day = day
  end

  def call(level, answer)
    response = HTTParty.post("https://adventofcode.com/2024/day/#{day}/answer",
                             body: { level: level, answer: answer },
                             headers: { 'Cookie' => Secrets.session_cookie })

    select_response(response.body)
  end

  def select_response(text)
    if (match = text.match(MAIN))
      match[0].strip
    else
      'No match found.'
    end
  end
end
