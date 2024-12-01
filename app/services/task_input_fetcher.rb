class TaskInputFetcher
  def call(day)
    response = HTTParty.get("https://adventofcode.com/2023/day/#{day}/input",
                            headers: { 'Cookie' => Secrets.session_cookie })

    response.body.split("\n")
  end
end
