class MiniRobot
  require 'pp'
  attr_accessor :field, :pos_x, :pos_y, :dir, :print

  SIZE = 5
  ORIENT = %w|NORTH WEST SOUTH EAST|
  DELTA = [[-1,0], [0,1], [1,0], [0,-1]]
  DEF_VAL = -1

  def initialize(print: true)
    @field = Array.new(SIZE){ Array.new(SIZE, DEF_VAL) }
    @pos_x, @pos_y = nil
    @print = print
  end

  def place(x, y, direction)
    dir_val = ORIENT.index direction.to_s
    put_to_field(x, y, dir_val)
  end

  def move
    delta_x = @pos_x + DELTA[@dir][0]
    delta_y = @pos_y + DELTA[@dir][1]
    put_to_field(delta_x, delta_y, @dir)
  end

  def left
    @dir = (@dir==0 ? ORIENT.size-1 : @dir-1)
    put_to_field(@pos_x, @pos_y, @dir)
  end

  def right
    @dir = (@dir==ORIENT.size-1 ? 0 : @dir+1)
    put_to_field(@pos_x, @pos_y, @dir)
  end

  def report
    "#{@pos_x} #{@pos_y} #{ORIENT[@dir]}"
  end

  private

  def put_to_field(x, y, dir)
    if dir && x>=0 && y>=0 && x<SIZE && y<SIZE
      @dir = dir
      @field[x][y] = @dir
      if @pos_x && @pos_y
        @field[@pos_x][@pos_y] = DEF_VAL if x != @pos_x || y != @pos_y
      end
      @pos_x, @pos_y = x, y
    end
    pp @field if @print
    nil
  end

end