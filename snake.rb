class Snake
  SIZE = 20
  attr_reader :x, :y, :angle, :speed

  def initialize
    @x = SnakeGame::WIDTH/2
    @y = SnakeGame::HEIGHT/2

    @angle = 0
    @speed = 5
  end

  def x1; @x - SIZE/2; end
  def x2; @x + SIZE/2; end
  def y1; @y - SIZE/2; end
  def y2; @y + SIZE/2; end

  def draw(window)
    color = Gosu::Color::RED

    window.draw_quad(
      x1, y1, color,
      x1, y2, color,
      x2, y1, color,
      x2, y2, color,
      )
  end

  def dx; Gosu.offset_x(angle,speed); end
  def dy; Gosu.offset_y(angle,speed); end

  def move!
    @x += dx
    @y += dy
  end

  def left!
    if @angle == 180
      @angle += 90
    elsif @angle == 0
      @angle = 270
    else
      @angle -= 90
    end
  end

  def right!
    if @angle == 180
      @angle -= 90
    elsif @angle == 270
      @angle = 0
    else
      @angle += 90
    end
  end

  def off_left?
    x1 < 0
  end

  def off_right?
    x2 > SnakeGame::WIDTH
  end

  def off_top?
    y1 < 0
  end

  def off_bottom?
    y2 > SnakeGame::HEIGHT
  end

end

