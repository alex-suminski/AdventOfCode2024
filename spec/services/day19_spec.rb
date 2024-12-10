require 'rails_helper'

RSpec.describe Day19 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }

  context 'when 1 example' do
    let(:example) do
      ''.split("\n")
    end

    before do
      allow(task_input_fetcher_double).to receive(:call).and_return(example)
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 1
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 0
    end
  end
end
