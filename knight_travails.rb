class Vertex
  attr_accessor :x, :y, :dist, :parent

  def initialize(x, y, dist = 0, parent = nil)
    @x = x
    @y = y
    @dist = dist
    @parent = parent
  end
end

class Board
  attr_accessor :squares

  def initialize
    @squares = []
  end

  def add_square(square)
    squares.push square
  end
end

class Knight
  attr_accessor :position

  def initialize(position = nil)
    @position = position
  end
end

def valid?(x, y)
  !(x.negative? || y.negative? || x > 7 || y > 7)
end

def knights_travails(start_s, end_s)
  row = [2, 2, -2, -2, 1, 1, -1, -1]
  col = [-1, 1, 1, -1, 2, -2, 2, -2]
  board = Board.new
  knight = Knight.new
  explored = []
  queue = []
  start_square = Vertex.new(start_s.first, start_s.last)
  board.add_square start_square
  queue.push start_square

  until queue.empty?
    knight.position = queue.shift
    if knight.position.x == end_s.first && knight.position.y == end_s.last
      puts "You made it in #{knight.position.dist} moves! Here's your path:"
      return path knight.position
    end

    unless explored.include? knight.position
      explored.push knight.position
      row.length.times do |i|
        x1 = knight.position.x + row[i]
        y1 = knight.position.y + col[i]

        if valid?(x1, y1)
          square_ = Vertex.new(x1, y1, knight.position.dist + 1, knight.position)
          queue.push square_
        end
      end
    end
  end
end

def path(vertex)
  path = []
  until vertex.parent.nil?
    path.push [vertex.x, vertex.y]
    vertex = vertex.parent
  end
  path.push [vertex.x, vertex.y]
  path.reverse
end

p knights_travails([3, 3], [4, 3])
