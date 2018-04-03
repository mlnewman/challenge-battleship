require_relative 'coordinate'

class Grid
  attr_reader :size

  def initialize(size = 10)
    @size = size
    @ship_coords = []
    @coords = Array.new(size) do |y|
      Array.new(size) { |x| Coordinate.new(self, x, y) }
    end
  end

  def [](x, y)
    return nil unless (0...size).cover?(x) # Check to see if x coordinate is in range
    return nil unless (0...size).cover?(y) # Check to see if y coordinate is in range
    @coords[y][x]
  end

  def free_squares
    free_space(@coords) + free_space(@coords.transpose) # transpose so that we can create col/rows (transpose allows rows to becom columns)
  end

  def place_ship(ship, size)
    span = free_squares.select { |span| span.count >= size }.sample
    raise "There is no room on the board" unless span
    offset = rand(0..span.count - size)

    @ship_coords << span.slice(offset, size)
    @ship_coords.last.each { |cell| cell.ship = ship }
  end

  def ship_coordinates
    @ship_coords.map do |coords|
      coords.map { |coord| [coord.x, coord.y] }
    end
  end

  def to_s
    @coords.map do |row|
      puts row.map(&:to_s).join(" ")
    end
  end

  private

  def free_space(grid)
    grid.map { |row| row.chunk(&:free_cell?).select(&:first).map(&:last) }.flatten!(1)
  end
end