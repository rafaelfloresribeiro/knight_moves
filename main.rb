# frozen_string_literal: true

require 'pry-byebug'

# Node class for Square
class Knight
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def knight_move(x_axis, y_axis)
    valid_x = @position[0] + x_axis
    valid_y = @position[1] + y_axis
    print @position
    return print 'Invalid move' if valid_x.negative? || valid_y.negative?

    @position[0] = @position[0] + x_axis
    @position[1] = @position[1] + y_axis
    print @position
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
knight.knight_move(-2, 1)
