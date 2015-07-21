require 'debugger'
class Sudoku

  attr_reader :board, :sudoku, :candidates
  def initialize(board_string)
    @board = []
    @flat_board = board_string.split("").map(&:to_i)
    @flat_board.each_slice(9) {|row| @board += [row]}
    @box_hash = Hash.new
    @flat_board.each_with_index do |entry, index|
      box_number = find_box(index)
      @box_hash[box_number] += [entry] if @box_hash[box_number]
      @box_hash[box_number] = [entry] if !(@box_hash[box_number])
    end
    @solved = false
  end

  def check_candidates(ary)
    @candidates = (1..9).reject {|num| ary.include?(num)}
    @candidates
  end

  def find_box(index)
    coord = index.divmod(9)
    box_num = (coord[0]/3) + (coord[1]/3) * 3
    box_num
  end

  def solve!
    while @board.flatten.include?(0)
      @board.each_with_index do |row, row_index|
        row.each_with_index do |entry, entry_index|
          if entry == 0
            flat_index = row_index * 9 + entry_index
            # Write arrays
            row_check = @board[row_index]
            col_check = @board.transpose[entry_index]
            box_check = @box_hash[find_box(flat_index)]
            # Check candidates
            row_cand = check_candidates(row_check)
            col_cand = check_candidates(col_check)
            box_cand = check_candidates(box_check)
            #Compute Intersection
            intersection = row_cand & col_cand & box_cand
            #Add to board if only one possible choice
            @board[row_index][entry_index] = intersection.first if intersection.length == 1
            @box_hash[find_box(flat_index)] += [intersection.first] if intersection.length == 1
          end
        end
      end
    end
  end

  def board
    puts "---------------------"
    @board.each do |row|
      row.each_with_index do |col, index|

        if (index + 1) % 9 == 0
          print "#{col} \n"
        elsif (index + 1) % 3 == 0
          print "#{col} | "
        else
          print "#{col} "
        end
      end

      if (@board.index(row) + 1) % 3 == 0
        puts "---------------------"
      end

    end
  end
end

# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
new_game = File.readlines('sample.unsolved.txt').first.chomp
game = []
File.readlines('sample.unsolved.txt').each_with_index do |str, index|
  game << Sudoku.new(str.chomp)
end

game.each_with_index do |sudoku, index|
  sudoku.board
  sudoku.solve!
  sudoku.board
end
