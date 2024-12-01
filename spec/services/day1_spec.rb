require 'rails_helper'

RSpec.describe Day1 do
  subject(:day1) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }
  let(:example) do
    "3   4
     4   3
     2   5
     1   3
     3   9
     3   3".split("\n")
  end

  before do
    allow(task_input_fetcher_double).to receive(:call).with(1).and_return(example)
  end

  it 'calculates part 1' do
    expect(day1.part1).to eq 11
  end

  it 'calculates part 2' do
    expect(day1.part2).to eq 31
  end
end
