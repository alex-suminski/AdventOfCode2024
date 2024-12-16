class Day15
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(15)
  end

  def part1
    board_raw, moves = input.split("")
    board = Board.new(board_raw)

    moves.join.chars.each { |move|
      case move
      when '<'
        board.move_left
      when '>'
        board.move_right
      when 'v'
        board.move_down
      when '^'
        board.move_up
      end
    }

    board.boxes.sum { |box| box.y * 100 + box.x }
  end

  def part2
    board_raw, moves = input.split("")
    board = Board2.new(board_raw)

    moves.join.chars.each { |move|
      case move
      when '<'
        board.move_left
      when '>'
        board.move_right
      when 'v'
        board.move_down
      when '^'
        board.move_up
      end
    }

    board.boxes.uniq.sum { |box| box.y * 100 + box.x }
  end
end

class Board
  Location = Struct.new(:x, :y, keyword_init: true)
  attr :walls, :boxes, :robot

  def initialize(board_raw)
    @walls = []
    @boxes = []
    @height = board_raw.size - 1
    @width = board_raw.first.size - 1

    board_raw.each_with_index { |line, y|
      line.chars.each_with_index { |char, x|
        case char
        when "#"
          @walls << Location.new(x: x, y: y)
        when "O"
          @boxes << Location.new(x: x, y: y)
        when "["
          @boxes << Location.new(x: x, y: y)
        when "@"
          @robot = Location.new(x: x, y: y)
        end
      }
    }
  end

  def move_left(loc: robot, first_box: nil)
    next_loc = Location.new(y: loc.y, x: (loc.x - 1))

    if is_wall?(next_loc)
      return
    elsif is_box?(next_loc)
      first_box |= loc
      move_left(loc: next_loc, first_box: first_box)
    else
      @robot = Location.new(y: robot.y, x: robot.x - 1)
      if first_box
        @boxes.delete(robot)
        @boxes << next_loc
      end
    end
  end

  def move_right(loc: robot, first_box: nil)
    next_loc = Location.new(y: loc.y, x: (loc.x + 1))

    if is_wall?(next_loc)
      return
    elsif is_box?(next_loc)
      first_box |= loc
      move_right(loc: next_loc, first_box: first_box)
    else
      @robot = Location.new(y: robot.y, x: robot.x + 1)
      if first_box
        @boxes.delete(robot)
        @boxes << next_loc
      end
    end
  end

  def move_up(loc: robot, first_box: nil)
    next_loc = Location.new(y: loc.y - 1, x: loc.x)

    if is_wall?(next_loc)
      return
    elsif is_box?(next_loc)
      first_box |= loc
      move_up(loc: next_loc, first_box: first_box)
    else
      @robot = Location.new(y: robot.y - 1, x: robot.x)
      if first_box
        @boxes.delete(robot)
        @boxes << next_loc
      end
    end
  end

  def move_down(loc: robot, first_box: nil)
    next_loc = Location.new(y: loc.y + 1, x: loc.x)

    if is_wall?(next_loc)
      return
    elsif is_box?(next_loc)
      first_box |= loc
      move_down(loc: next_loc, first_box: first_box)
    else
      @robot = Location.new(y: robot.y + 1, x: robot.x)
      if first_box
        @boxes.delete(robot)
        @boxes << next_loc
      end
    end
  end

  def is_wall?(loc)
    walls.include?(loc)
  end

  def is_box?(loc)
    boxes.include?(loc)
  end

  def draw
    (0..@height).each { |y|
      (0..@width).each_with_object({ b: false }) { |x, box|
        loc = Location.new(x: x, y: y)
        if is_wall?(loc)
          print "#"
        elsif loc == robot
          print "@"
        elsif is_box?(loc)

          print "["
          box[:b] = true
        else
          if box[:b]
            print "]"
            box[:b] = false
          else
            print "."
          end
        end
        box
      }
      puts ""
    }
  end
end

class Board2 < Board
  class Wall < StandardError; end

  def initialize(board_raw)
    wide_board = widen(board_raw)
    @moved_boxes_g = []
    super(wide_board)
  end

  def widen(board_raw)
    board_raw.map { |line|
      line.chars.map { |char|
        case char
        when "#"
          "##"
        when "O"
          "[]"
        when "@"
          "@."
        when "."
          ".."
        end
      }.join
    }
  end

  def move_right(loc: robot, moved_boxes: [])
    next_loc = Location.new(y: loc.y, x: loc.x + 1)
    box_ass = Location.new(y: loc.y, x: loc.x + 2)

    if is_wall?(next_loc)
      return
    elsif is_box?(next_loc)
      moved_boxes << next_loc
      move_right(loc: box_ass, moved_boxes: moved_boxes)
    else
      @robot = Location.new(y: robot.y, x: robot.x + 1)
      moved_boxes.each { |moved_box|
        @boxes.delete(moved_box)
        @boxes << Location.new(y: moved_box.y, x: moved_box.x + 1)
      }
    end
  end

  def move_left(loc: robot, moved_boxes: [])
    next_loc = Location.new(y: loc.y, x: loc.x - 1)
    next_box_loc = Location.new(y: loc.y, x: loc.x - 2)

    if is_wall?(next_loc)
      return
    elsif is_box?(next_box_loc)
      moved_boxes << next_box_loc
      move_left(loc: next_box_loc, moved_boxes: moved_boxes)
    else
      @robot = Location.new(y: robot.y, x: robot.x - 1)
      moved_boxes.each { |moved_box|
        @boxes.delete(moved_box)
        @boxes << Location.new(y: moved_box.y, x: moved_box.x - 1)
      }
    end
  end

  def move_up(loc: robot)
    next_loc = Location.new(y: loc.y - 1, x: loc.x)
    next_loc_left = Location.new(y: loc.y - 1, x: loc.x - 1)

    next_box_loc = [next_loc, next_loc_left].select { |l| is_box?(l) }.first

    if is_wall?(next_loc)
      return
    elsif next_box_loc
      move_box_up(next_box_loc)
      @robot = Location.new(y: robot.y - 1, x: robot.x)
      @moved_boxes_g.each { |moved_box|
        @boxes.delete(moved_box)
      }
      @moved_boxes_g.each { |moved_box|
        @boxes << Location.new(x: moved_box.x, y: moved_box.y - 1)
      }
      @moved_boxes_g = []
    else
      @robot = Location.new(y: robot.y - 1, x: robot.x)
    end
  rescue Wall => e
    @moved_boxes_g = []
  end

  def move_box_up(box)
    if is_wall?(Location.new(y: box.y - 1, x: box.x)) || is_wall?(Location.new(x: box.x + 1, y: box.y - 1))
      raise Wall.new(box)
    end

    @moved_boxes_g << box

    [
      Location.new(x: box.x - 1, y: box.y - 1),
      Location.new(x: box.x, y: box.y - 1),
      Location.new(x: box.x + 1, y: box.y - 1)
    ].select { |l| is_box?(l) }
      .each { |b| move_box_up(b) }
  end

  def move_down(loc: robot)
    next_loc = Location.new(y: loc.y + 1, x: loc.x)
    next_loc_left = Location.new(y: loc.y + 1, x: loc.x - 1)

    next_box_loc = [next_loc, next_loc_left].select { |l| is_box?(l) }.first

    if is_wall?(next_loc)
      return
    elsif next_box_loc
      move_box_down(next_box_loc)
      @robot = Location.new(y: robot.y + 1, x: robot.x)
      @moved_boxes_g.each { |moved_box|
        @boxes.delete(moved_box)
      }
      @moved_boxes_g.each { |moved_box|
        @boxes << Location.new(y: moved_box.y + 1, x: moved_box.x)
      }
      @moved_boxes_g = []
    else
      @robot = Location.new(y: robot.y + 1, x: robot.x)
    end
  rescue Wall => e
    @moved_boxes_g = []
  end

  def move_box_down(box)
    if is_wall?(Location.new(y: box.y + 1, x: box.x)) || is_wall?(Location.new(x: box.x + 1, y: box.y + 1))
      raise Wall.new(box)
    end

    @moved_boxes_g << box

    [
      Location.new(x: box.x - 1, y: box.y + 1),
      Location.new(x: box.x, y: box.y + 1),
      Location.new(x: box.x + 1, y: box.y + 1)
    ].select { |l| is_box?(l) }
      .each { |b| move_box_down(b) }
  end

  def is_box?(loc)
    boxes.include?(loc) # || boxes.include?(Location.new(y: loc.y, x: loc.x - 1))
  end
end
