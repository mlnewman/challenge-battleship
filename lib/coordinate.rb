class Coordinate
  attr_reader :x, :y
  attr_accessor :ship

  def initialize(grid, x, y)
    @grid = grid
    @x = x
    @y = y
  end

  def blank?
    ship.nil?
  end

  def free_cell?
    blank? && adjacent_cells.all?(&:blank?)
  end

  def adjacent_cells
    @adjacent_cells ||= [-1, 0, 1].repeated_permutation(2).map do |dx, dy|
      @grid[x + dx, y + dy] unless dx.zero? && dy.zero?
    end.compact
  end

  def to_s
    blank? ? "·" : ship
  end
end
