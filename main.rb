require_relative 'lib/grid'

# create battle grounds
# create a standard 10x10 grid
grid = Grid.new

ships = { :C => 5, :B => 4, :S => 3, :D => 3, :T =>2 }
ships.each { |ship, size| grid.place_ship(ship, size) }

puts grid;
