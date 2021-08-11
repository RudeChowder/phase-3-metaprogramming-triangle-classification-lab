class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid_triangle?
    sides = [@side1, @side2, @side3]
    if sides.all?(&:positive?)
      @side1 + @side2 > @side3 && @side1 + @side3 > @side2 && @side2 + @side3 > @side1
    end
  end

  def kind
    if valid_triangle?
      if @side1 == @side2 && @side2 == @side3
        :equilateral
      elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
        :isosceles
      else
        :scalene
      end
    else
      begin
        raise TriangleError
      end
    end
  end

  class TriangleError < StandardError
  end
end
