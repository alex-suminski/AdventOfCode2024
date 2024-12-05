class Day5
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(5)
  end

  def part1
    sum_middle
  end

  def part2
    ordering_raw, programs_raw = input.split("")
    ordering = ordering_raw.map { |rule| rule.split('|').map(&:to_i) }.group_by(&:shift).transform_values(&:flatten)
    programs = programs_raw.map { |program| program.split(',').map(&:to_i) }
    programs.sum { |program|
      all_good = true
      program.each_with_index { |page, i|
        if shit?(page, i, program, ordering)
          program = sort_shit(page, i, program, ordering)
          all_good = false
        end
      }
      if all_good
        0
      else
        program[(program.size - 1) / 2]
      end
    }
  end

  def sum_middle
    ordering_raw, programs_raw = input.split("")
    ordering = ordering_raw.map { |rule| rule.split('|').map(&:to_i) }
                           .group_by(&:shift)
                           .transform_values(&:flatten)

    programs_raw.sum { |program_raw|
      all_good = true
      program = program_raw.split(',').map(&:to_i)
      program.each_with_index { |page, i|
        all_good = false if shit?(page, i, program, ordering)
      }
      if all_good
        program[(program.size - 1) / 2]
      else
        0
      end
    }
  end

  def shit?(page, i, program, ordering)
    if (followers = ordering[page])
      followers.intersection(program[0..i]).present?
    else
      false
    end
  end

  def sort_shit(page, i, program, ordering)
    rule = ordering[page]
    remove, leave = program[0..i - 1].partition { |el| rule.include?(el) }
    leave + [page] + remove + program[(i + 1)..]
  end
end
