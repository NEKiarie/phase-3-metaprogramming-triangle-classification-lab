class Triangle

  attr_reader :sidea, :sideb, :sidec
  
  def initialize(sidea, sideb, sidec)
    @sidea = sidea
    @sideb = sideb
    @sidec = sidec
  end

  def kind
    validate_triangle
    if sidea == sideb && sideb == sidec
      :equilateral
    elsif sidea == sideb || sideb == sidec || sidea == sidec
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(sidea + sideb > sidec), (sidea + sidec > sideb), (sideb + sidec > sidea)]
    [sidea, sideb, sidec].each do |side|
      real_triangle << false if side <= 0 
    raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end

# SECOND SOLUTION

# class Triangle
#   attr_accessor :sides
  
#   @sides = []
  
#   def initialize (side1, side2, side3)
#     @sides = [side1, side2, side3]
#     @sides.sort!
#   end
  
#   def kind
#     if @sides.any?{|side| side <= 0} || ((@sides[0] + @sides[1]) <= @sides[2])
#       raise TriangleError
#     elsif @sides.uniq.length == 1
#       :equilateral
#     elsif @sides.uniq.length == 2
#       :isosceles
#     else
#       :scalene
#     end
#   end
  
#   class TriangleError < StandardError
    
#   end
# end