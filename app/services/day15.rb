class Day15
  attr_reader :input

  def initialize(task_input_fetcher: TaskInputFetcher.new)
    @input = task_input_fetcher.call(15)
  end

  def part1
    board_raw, moves = input.split("")
    board = Board.new(board_raw)
    # debugger

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
    input
    0
  end
end

class Board
  Location = Struct.new(:x, :y, keyword_init: true)
  attr :walls, :boxes, :robot

  def initialize(board_raw)
    @walls = []
    @boxes = []

    board_raw.each_with_index { |line, y|
      line.chars.each_with_index { |char, x|
        case char
        when "#"
          @walls << Location.new(x: x, y: y)
        when "O"
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
    # debugger

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
end
