require 'rails_helper'

RSpec.describe Day14 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }

  context 'when basic' do
    let(:example) do
      'p=2,4 v=2,-3
'.split("\n")
    end

    before do
      allow(task_input_fetcher_double).to receive(:call).and_return(example)
    end

    it 'calculates part 1' do
      expect(day.part1(height: 7, width: 11, seconds: 5)).to eq 0
    end
  end

  context 'when 1 example' do
    let(:example) do
      'p=0,4 v=3,-3
p=6,3 v=-1,-3
p=10,3 v=-1,2
p=2,0 v=2,-1
p=0,0 v=1,3
p=3,0 v=-2,-2
p=7,6 v=-1,-3
p=3,0 v=-1,-2
p=9,3 v=2,3
p=7,3 v=-1,2
p=2,4 v=2,-3
p=9,5 v=-3,-3'.split("\n")
    end

    before do
      allow(task_input_fetcher_double).to receive(:call).and_return(example)
    end

    it 'calculates part 1' do
      expect(day.part1(height: 7, width: 11)).to eq 12
    end

    it 'calculates part 2' do
      expect(day.part2(height: 7, width: 11, seconds: 5)).to eq 0
    end
  end
end
