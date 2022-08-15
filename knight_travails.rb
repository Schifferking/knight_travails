class Board
  attr_accessor :squares

  def initialize
    @squares = set_board
  end

  private

  def set_board
    arr = Array.new(8) { |i| i }
    arr.repeated_permutation(2).to_a
  end
end

class Knight
  attr_accessor :current_position

  def initialize
    @current_position = nil
  end
end
