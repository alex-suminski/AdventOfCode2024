require 'rails_helper'

RSpec.describe Day7 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }
  let(:example) do
    '190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20'.split("\n")
  end

  before do
    allow(task_input_fetcher_double).to receive(:call).and_return(example)
  end

  it 'calculates part 1' do
    expect(day.part1).to eq 3749
  end

  it 'calculates part 2' do
    expect(day.part2).to eq 11387
  end

  context 'real' do
    let(:example) do
      '237069504000: 96 30 30 28 139 705
355813: 50 702 120 7 59
92316680: 92 22 9 66 77
3255967: 4 7 6 10 17 420 5 1 6 97
11052: 8 3 1 4 75 3 59 1 73 4 9
1257: 9 45 312
1891867: 69 96 20 573 968 1
29274: 1 4 2 9 49 435 999
735: 49 56 7
178684952: 7 944 226 9 3 9 5 87 4
931690: 6 9 6 2 21 7 1 4 8 67 53 8
3111108: 5 12 52 6 5 7 924
6367117: 386 98 15 877 97
708411564: 602 3 712 22 7 6 97 7 6'.split("\n")
    end

    before do
      allow(task_input_fetcher_double).to receive(:call).and_return(example)
    end

    it 'calculates part 1' do
      expect(day.part1).to eq 3749
    end

    it 'calculates part 2' do
      expect(day.part2).to eq 11387
    end
  end
end
