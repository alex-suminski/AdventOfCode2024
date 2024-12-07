require 'rails_helper'

RSpec.describe Day7 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }
  let(:example) do
    '190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20'.split("\n")
  end

  before do
    allow(task_input_fetcher_double).to receive(:call).and_return(example)
  end

  it 'calculates part 1' do
    expect(day.part1).to eq 3749
  end

  it 'calculates part 2' do
    expect(day.part2).to eq 11387
  end
end
