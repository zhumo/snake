require "bundler/setup"
require "hasu"

Hasu.load "snake.rb"

class SnakeGame < Hasu::Window
  HEIGHT = 800
  WIDTH = (HEIGHT * 1.61803398875).to_i

  def initialize
    super(WIDTH,HEIGHT,false)
  end

  def reset
    @snake = Snake.new
    @right_score = 0

    @font = Gosu::Font.new(self,"Arial", 70)
  end

  def draw
    @snake.draw(self)

    @font.draw(@right_score,WIDTH - 100,HEIGHT - 100,0)
  end

  def update
    @snake.move!

    if button_down?(Gosu::KbLeft)
      @snake.left!
    end

    if button_down?(Gosu::KbRight)
      @snake.right!
    end

    # if @snake.off_left?
    #   @snake.x1 =
  end

  #Def press esc to exit game
  def button_down(button)
    case button
    when Gosu::KbEscape
      close
    end
  end
end

SnakeGame.run
