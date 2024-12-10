require 'rails_helper'

RSpec.describe Day10 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }

  before do
    allow(task_input_fetcher_double).to receive(:call).and_return(example)
  end

  context '1' do
    let(:example) do
      '0123
1234
8765
9876'.split("\n")
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 1
    end
  end

  context '2' do
    let(:example) do
      '...0...
...1...
...2...
6543456
7.....7
8.....8
9.....96'.split("\n")
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 2
    end
  end

  context '3' do
    let(:example) do
      '..90..9
...1.98
...2..7
6543456
765.987
876....
987....'.split("\n")
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 4
    end
  end

  context '4' do
    let(:example) do
      '10..9..
2...8..
3...7..
4567654
...8..3
...9..2
.....01'.split("\n")
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 3
    end
  end

  context '6' do
    let(:example) do
      '.....0.
..4321.
..5..2.
..6543.
..7..4.
..8765.
..9....'.split("\n")
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 3
    end
  end

  context '7' do
    let(:example) do
      '..90..9
...1.98
...2..7
6543456
765.987
876....
987....1'.split("\n")
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 13
    end
  end

  context '8' do
    let(:example) do
      '012345
123456
234567
345678
4.6789
56789.'.split("\n")
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 227
    end
  end

  context '5' do
    let(:example) do
      '89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732'.split("\n")
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 36
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 81
    end
  end
end
