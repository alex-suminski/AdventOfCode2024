require 'rails_helper'

RSpec.describe Day11 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }

  before do
    allow(task_input_fetcher_double).to receive(:call).and_return(example)
  end

  context 'when 1 example' do
    let(:example) do
      ['0 1 10 99 999']
    end

    it 'calculates part 1' do
      expect(day.part1(1)).to eq 7
    end
  end

  context 'when 2 example' do
    let(:example) do
      ['125 17']
    end

    it 'calculates part 1' do
      expect(day.part1(6)).to eq 22
      expect(day.part1(25)).to eq 55312
    end
  end

  context 'when 2 example 2' do
    let(:example) do
      ['6']
    end

    it 'calculates part 2' do
      expect(day.part2(75)).to eq 0
    end
  end
end
