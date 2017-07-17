require 'rubygems'
require 'gosu'

class Ball
  def initialize
    @ball = Gosu::Image.new('basketball.png')
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x,y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end



  def accelerate
    @vel_x += Gosu.offset_x(@angle,0.5)
    @vel_y += Gosu.offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480

    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @ball.draw_rot(@x, @y, 1, @angle)
  end

end


class Game < Gosu::Window
  def initialize
    super 640, 480
    @background = Gosu::Image.new(self, 'background.png', :tileable => true)

    @ball = Ball.new
    @ball.warp(320,240)
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @ball.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @ball.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @ball.accelerate
    end
    @ball.move
  end

  def draw
    @ball.draw
    @background.draw(0,0,0)
    x = 500
    y = 600
    size = 120
    draw_line(x, y, 0x1f00ffff, x, y, 0xf100ffff)

  end



end

Game.new.show
