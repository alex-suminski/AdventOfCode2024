require 'rails_helper'

RSpec.describe Day9 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }

  before do
    allow(task_input_fetcher_double).to receive(:call).and_return(example)
  end

  context 'simple' do
    let(:example) do
      '12345'.split("\n")
    end

    it 'calculates part 1' do
      '0..111....22222'
      expect(day.part1).to eq 0
    end
  end

  context 'example' do
    let(:example) do
      '2333133121414131402'.split("\n")
    end

    it 'calculates part 2' do
      '00...111...2...333.44.5555.6666.777.888899'
      expect(day.part1).to eq 1928
    end
  end
end
