require 'pp'

class MiniRobot
  attr_accessor :field, :pos_x, :pos_y, :dir, :is_placed, :print
  SIZE = 5
  ORIENT = %I[NORTH WEST SOUTH EAST].freeze
  DELTA = [[-1, 0], [0, 1], [1, 0], [0, -1]].freeze
  DEF_VAL = -1

  def initialize(print: nil)
    @field = Array.new(SIZE) { Array.new(SIZE, DEF_VAL) }
    @pos_x, @pos_y, @dir = 0, 0
    @dir = 0
    @print = print
  end

  def place(x, y, direction)
    dir_val = ORIENT.index direction.to_sym
    @is_placed = put_to_field(x, y, dir_val, place: true)
  end

  def move
    delta_x = @pos_x + DELTA[@dir][0]
    delta_y = @pos_y + DELTA[@dir][1]
    put_to_field(delta_x, delta_y, @dir)
  end

  def left
    @dir = (@dir.zero? ? ORIENT.size - 1 : @dir - 1)
    put_to_field(@pos_x, @pos_y, @dir)
  end

  def right
    @dir = (@dir == ORIENT.size - 1 ? 0 : @dir + 1)
    put_to_field(@pos_x, @pos_y, @dir)
  end

  def report
    "#{@pos_x} #{@pos_y} #{ORIENT[@dir]}" if @is_placed
  end

  private

  def put_to_field(x, y, dir, place: false)
    return false unless @is_placed || place
    if in_field?(x, y) && dir
      @dir = dir
      res = put_data_field x, y, dir
      pp @field if @print
    end
    res || false
  end

  def in_field?(x, y)
    x >= 0 && y >= 0 && x < SIZE && y < SIZE
  end

  def put_data_field(x, y, dir)
    @dir = dir
    @field[x][y] = @dir
    if @pos_x && @pos_y
      @field[@pos_x][@pos_y] = DEF_VAL if x != @pos_x || y != @pos_y
    end
    @pos_x = x
    @pos_y = y
    true
  end
end
