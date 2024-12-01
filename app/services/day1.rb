class Day1
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(1)
  end

  def part2
    numbers = '1|one|2|two|3|three|4|four|5|five|6|six|7|seven|8|eight|9|nine'
    regex = Regexp.new numbers
    regex_reversed = Regexp.new numbers.reverse

    input.sum do |line|
      first = line[regex]
      last = line.reverse[regex_reversed].reverse
      (to_digits(first) + to_digits(last)).to_i
    end
  end

  private

  def to_digits(word)
    { 'one' => '1',
      'two' => '2',
      'three' => '3',
      'four' => '4',
      'five' => '5',
      'six' => '6',
      'seven' => '7',
      'eight' => '8',
      'nine' => '9' }
      .fetch(word, word)
  end
end
