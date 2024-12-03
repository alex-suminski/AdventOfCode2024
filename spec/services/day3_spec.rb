require 'rails_helper'

RSpec.describe Day3 do
  subject(:day) { described_class.new(task_input_fetcher: task_input_fetcher_double) }

  let(:task_input_fetcher_double) { instance_double(TaskInputFetcher) }
  let(:example) do
    'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'.split("\n")
  end
  let(:example2) do
    "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
  end

  it 'calculates part 1' do
    allow(task_input_fetcher_double).to receive(:call).and_return(example)
    expect(day.part1).to eq 161 + 161
  end

  it 'calculates part 2' do
    allow(task_input_fetcher_double).to receive(:call).and_return(example2)
    expect(day.part2).to eq 0
  end
end
