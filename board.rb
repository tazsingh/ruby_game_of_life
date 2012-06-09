class Board
  attr_accessor :width, :height, :cells

  def initialize width, height
    self.width = width
    self.height = height

    self.cells = Array.new(self.width) do |col|
      Array.new(self.height) do |row|
        rand(10) < 4
      end
    end
  end

  def next_generation
    self.cells = self.cells.each_with_index.map do |cols, col_index|
      cols.each_with_index.map do |rows, row_index|
        self.neighbour_count(col_index, row_index).alive?
      end
    end
  end

  def neighbour_count row, col
    offset = -1..1

    offset.reduce(0) do |alive_cols, row_offset|
      alive_cols + offset.reduce(0) do |alive_rows, col_offset|
        alive_rows + self.cells[(row + row_offset) % self.width][(col + col_offset) % self.height].alive_count
      end
    end - self.cells[row][col].alive_count
  end

  def pretty_print
    self.cells.each do |row|
      puts(row.map do |col|
        col.display_cell
      end.join)
    end

    puts "=" * self.width
  end

  def pretty_print_next_generation
    self.next_generation
    self.pretty_print
  end
  alias :ppng :pretty_print_next_generation
end

class TrueClass
  def alive_count
    1
  end

  def display_cell
    "#"
  end
end

class FalseClass
  def alive_count
    0
  end

  def display_cell
    " "
  end
end

class Fixnum
  attr_accessor :alive

  def alive?
    self.alive
  end
end

{
  [0, 1] => false,
  [2, 3] => true,
  [4, 5, 6, 7, 8] => false
}.each do |k,v|
  k.each do |num|
    num.alive = v
  end
end