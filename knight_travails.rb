class Vertex
  attr_accessor :value, :edges

  def initialize(value)
    @value = value
    @edges = []
  end

  def add_edge(vertex)
    @edges << vertex
  end
end

class Board
  attr_accessor :squares

  def initialize
    @squares = []
  end

  def add_square(square)
    @squares << Vertex.new(square)
  end
end
