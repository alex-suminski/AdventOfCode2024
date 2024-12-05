require 'rails_helper'

RSpec.describe Day4 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }
  let(:example_simple) do
    '..X...
.SAMX.
.A..A.
XMAS.S
.X....'.split("\n")
  end

  let(:example_dots) do
    '....XXMAS.
.SAMXMS...
...S..A...
..A.A.MS.X
XMASAMX.MM
X.....XA.A
S.S.S.S.SS
.A.A.A.A.A
..M.M.M.MM
.X.X.XMASX'.split("\n")
  end

  let(:example_mases) do
    '.M.S......
..A..MSMS.
.M.S.MAA..
..A.ASMSM.
.M.S.M....
..........
S.S.S.S.S.
.A.A.A.A..
M.M.M.M.M.
..........'.split("\n")
  end

  it 'calculates part 1 simple' do
    allow(task_input_fetcher_double).to receive(:call).and_return(example_simple)
    expect(day.part1).to eq 4
  end

  it 'calculates part 1' do
    allow(task_input_fetcher_double).to receive(:call).and_return(example_dots)
    expect(day.part1).to eq 18
  end

  it 'calculates part 2' do
    allow(task_input_fetcher_double).to receive(:call).and_return(example_mases)
    expect(day.part2).to eq 9
  end
end
