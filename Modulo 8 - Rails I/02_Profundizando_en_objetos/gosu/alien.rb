require 'gosu'
require_relative 'animation'

class Alien
  def initialize(x, y)
    @frames = Gosu::Image.load_tiles 'dude.png', 32, 48
    @x, @y = x, y
    
    @move = {:left => Animation.new(@frames[0..3], 0.2),
            :right => Animation.new(@frames[5..8], 0.2)}

    @movements = {:left => -2.0, :right => 2.0}

    @moving = false
    @facing = :left
  end

  def draw
    if @moving
      @move[@facing].start.draw @x, @y, 1
    else
      @move[@facing].stop.draw @x, @y, 1
    end
  end

  def move(direction)
    @x += @movements[direction]
    @x %= 640
    
    @facing = direction
    @moving = true if @moving != true
  end

  def stop_move
    @moving = false if @moving != false
  end
end