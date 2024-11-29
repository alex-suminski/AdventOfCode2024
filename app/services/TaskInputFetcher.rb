class TaskInputFetcher
  def call
    response = HTTParty.get('https://adventofcode.com/2023/day/1/input', headers: {'Cookie' => Secrets.session_cookie})

    response.body
  end
end