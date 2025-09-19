# frozen_string_literal: true

require 'pry-byebug'

# Node class for Square
class Knight
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def knight_move(destination)
    queue = [@position, @position]
    visited_path = [@position]
    until queue.empty?
      pointer = queue.shift
      last_square = pointer.flatten.length > 2 ? pointer.last : pointer
      moves = valid_moves(last_square)
      move_list = moves.map { |move| do_move(pointer, move) }
      move_list.each do |move|
        visited_path = [pointer, move]
        return visited_path.flatten.zip.each_slice(2).to_a.map { |pair| pair.flatten } if move == destination

        test_array = [pointer, move]
        queue << test_array
      end
    end
    visited_path
  end

  def knight_constant
    [[2, 1], [-2, 1], [-2, -1], [2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

  def valid_moves(starting_position)
    possible_moves = knight_constant
    try_move = possible_moves.map { |x, y| [x + starting_position[0], y + starting_position[1]] }
    negative_index = []
    try_move.each.with_index { |number, index| negative_index << index if number.any? { |num| num <= 0 } }
    possible_moves.reject.with_index { |_, index| negative_index.include?(index) }
  end

  def do_move(move_list, move)
    starting_position = move_list.flatten.length > 2 ? move_list.last : move_list
    starting_position.zip(move).map { |a, b| a + b }
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
print knight.knight_move([7, 8])
