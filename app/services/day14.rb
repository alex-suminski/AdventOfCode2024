class Day14
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(14)
  end

  def part1(height: 103, width: 101, seconds: 100)
    midx = (width - 1) / 2
    midy = (height - 1) / 2
    q1 = q2 = q3 = q4 = 0
    input.map do |robot|
      p, v = robot.split()
      px, py = p.split('=').last.split(',').map(&:to_i)
      vx, vy = v.split('=').last.split(',').map(&:to_i)

      fx = (px + (seconds * vx)) % width
      fy = (py + (seconds * vy)) % height
      if fx < midx && fy < midy
        q1 += 1
      elsif fx > midx && fy < midy
        q2 += 1
      elsif fx < midx && fy > midy
        q3 += 1
      elsif fx > midx && fy > midy
        q4 += 1
      end
    end
    [q1, q2, q3, q4].reduce(:*)
  end

  def part2(height: 103, width: 101, seconds: 10000)
    first_line = (0..width).map { |x| [x, 0] }
    (7000..seconds).each do |seconds|
      maybe_tree = input.map do |robot|
        p, v = robot.split()
        px, py = p.split('=').last.split(',').map(&:to_i)
        vx, vy = v.split('=').last.split(',').map(&:to_i)

        fx = (px + (seconds * vx)) % width
        fy = (py + (seconds * vy)) % height
        [fx, fy]
      end
      puts seconds
      if is_tree?(maybe_tree)
        puts "------------------------------------------------------------------------------------------------------------------------"
        light_tree(maybe_tree, height, width)
        puts "------------------------------------------------------------------------------------------------------------------------"
      end
    end
  end

  def light_tree(tree, height, width)
    (0..height).each do |y|
      (0..width).each do |x|
        if tree.include?([x, y])
          print '*'
        else
          print ' '
        end
      end
      print "\n"
    end
  end

  def is_tree?(tree)
    tree.group_by(&:second).values.any? do |bobbles|
      bobbles.count > 30
    end
  end
end
