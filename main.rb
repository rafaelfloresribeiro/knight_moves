# frozen_string_literal: true

require 'pry-byebug'

# Node class for Square
class Knight
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def knight_move(destination)
    queue = []
    moves = valid_moves
    path = []
    path << @position
    pointer = @position
    binding.pry
    while pointer != destination
      pointer = moves.map { |move| do_move(pointer, move) }
    end
    binding.pry
  end

  def knight_constant
    [[2, 1], [-2, 1], [-2, -1], [2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

  def valid_moves
    possible_moves = knight_constant
    try_move = possible_moves.map { |x, y| [x + @position[0], y + @position[1]] }
    negative_index = []
    try_move.each.with_index { |number, index| negative_index << index if number.any? { |num| num <= 0 } }
    possible_moves.reject.with_index { |_, index| negative_index.include?(index) }
  end

  def do_move(starting_position, ending_position)
    starting_position.zip(ending_position).map { |a, b| a + b }
  end
end

# Class to represent the chessboard
class Chessboard
  attr_accessor :square

  def initialize
    @square = Array.new(8) { Array.new(8) }
  end

  def valid_position(x_coo, y_coo)
    x_coo <= 7 && y_coo <= 7
  end

  def create_knight(x_axis, y_axis)
    if !valid_position(x_axis, y_axis)
      print 'Invalid coordinate, use array format [x, y]'
    else
      Knight.new([x_axis, y_axis])
    end
  end
end

board = Chessboard.new
knight = board.create_knight(1, 1)
print knight.knight_move([2, 3])
