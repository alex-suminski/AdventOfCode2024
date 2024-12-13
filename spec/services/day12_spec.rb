require 'rails_helper'

RSpec.describe Day12 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }

  context 'when 1 example' do
    let(:example) do
      'Button A: X+94, Y+34
Button B: X+22, Y+67
Prize: X=8400, Y=5400

Button A: X+26, Y+66
Button B: X+67, Y+21
Prize: X=12748, Y=12176

Button A: X+17, Y+86
Button B: X+84, Y+37
Prize: X=7870, Y=6450

Button A: X+69, Y+23
Button B: X+27, Y+71
Prize: X=18641, Y=10279'.split("\n")
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
