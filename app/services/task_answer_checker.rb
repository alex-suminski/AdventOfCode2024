class TaskAnswerChecker
  attr_reader :day

  # MAIN = %r{(?<=<main>\\n<article><p>)(.*?)(?=</a></p></article>\n</main>)}
  MAIN = /(?<=<main>\n<article><p>)(.*?)(?=<\/a><\/p><\/article>\n<\/main>)/
  MAIN2 = /(?<=<main>\n<article><p>)(.*?)(?=You can <span)/

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
    if (match = text.match(MAIN)) || (match = text.match(MAIN2))
      match[0].strip
    else
      "No match found: #{text}"
    end
  end
end
