require 'rails_helper'

RSpec.describe Day2 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }
  let(:example) do
    '7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'.split("\n")
  end

  before do
    allow(task_input_fetcher_double).to receive(:call).and_return(example)
  end

  it 'calculates part 1' do
    expect(day.part1).to eq 2
  end

  it 'calculates part 2' do
    expect(day.part2).to eq 4
  end

  describe 'no removing' do
    it 'calculates part 2 increasing' do
      allow(task_input_fetcher_double).to receive(:call).and_return(['1 3 6 7 9'])
      expect(day.part2).to eq 1
    end

    it 'calculates part 2 decresing' do
      allow(task_input_fetcher_double).to receive(:call).and_return(['7 6 4 2 1'])
      expect(day.part2).to eq 1
    end
  end

  describe 'removing' do
    it 'calculates part 2 increasing' do
      allow(task_input_fetcher_double).to receive(:call).and_return(['1 3 2 4 5'])
      expect(day.part2).to eq 1
    end

    it 'calculates part 2 decresing' do
      allow(task_input_fetcher_double).to receive(:call).and_return(['8 6 4 4 1'])
      expect(day.part2).to eq 1
    end
  end

  it 'finds wrong' do
    allow(task_input_fetcher_double).to receive(:call).and_return(['1 2 7 8 9'])
    expect(day.part2).to eq 0
  end

  it 'finds wrongs' do
    allow(task_input_fetcher_double).to receive(:call).and_return(['9 7 6 2 1'])
    expect(day.part2).to eq 0
  end
end
