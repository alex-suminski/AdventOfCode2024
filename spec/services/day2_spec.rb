require 'rails_helper'

RSpec.describe Day2 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }
  let(:example) do
    'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green'.split("\n")
  end

  before do
    allow(task_input_fetcher_double).to receive(:call).and_return(example)
  end

  it 'calculates part 1' do
    expect(day.part1).to eq 8
  end

  it 'calculates part 2' do
    expect(day.part2).to eq 0
  end
end
