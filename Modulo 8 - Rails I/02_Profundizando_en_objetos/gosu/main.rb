require 'gosu' #trae la gema
require_relative 'player'
require_relative 'alien'

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Tutorial Game"

    @background_image = Gosu::Image.new("space.png", :tileable => true)

    @player = Player.new
    @player.warp(320, 240)
    @player2 = Player.new
    @player2.warp(320, 240)

    @alien = Alien.new 320,240
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP
      @player.accelerate
    end
    @player.move

    if Gosu::button_down? Gosu::KB_A
      #@player2.turn_left
      @alien.move :left
    end
    if Gosu::button_down? Gosu::KB_D
      # @player2.turn_right
      @alien.move :right
    end
    if Gosu::button_down? Gosu::KB_W
      @player2.accelerate
    end
    @player2.move
  end

  def draw
    @alien.draw
    @player.draw
    @player2.draw
    @background_image.draw(0, 0, 0)
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

Tutorial.new.show
