require 'rails_helper'

RSpec.describe Day13 do
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
      expect(day.part1).to eq 480
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 0
    end
  end

  context 'when 2 example' do
    let(:example) do
      'Button A: X+43, Y+21
Button B: X+16, Y+31
Prize: X=6735, Y=9135

Button A: X+52, Y+55
Button B: X+69, Y+11
Prize: X=2798, Y=1100

Button A: X+13, Y+32
Button B: X+68, Y+24
Prize: X=8243, Y=3816

Button A: X+97, Y+34
Button B: X+72, Y+97
Prize: X=5459, Y=6291

Button A: X+66, Y+14
Button B: X+81, Y+77
Prize: X=5910, Y=3766

Button A: X+65, Y+77
Button B: X+82, Y+24
Prize: X=8533, Y=3599

Button A: X+63, Y+47
Button B: X+16, Y+39
Prize: X=852, Y=798
'.split("\n")
    end

    before do
      allow(task_input_fetcher_double).to receive(:call).and_return(example)
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 500
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 0
    end
  end
end
