require 'rails_helper'

RSpec.describe Day1 do
  subject(:day1) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }
  let(:example) do
    "two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen".split("\n")
  end

  before do
    allow(task_input_fetcher_double).to receive(:call).with(1).and_return(example)
  end

  it 'calculates part 2' do
    expect(day1.part2).to eq 281
  end
end
