class Cell
	attr_accessor :life, :x, :y

  # initializer with basic validation for the cell
  # @param life [Life] a life to where this cell belongs
  # @param x [x] a horizontal position of this cell can't be outside of this life
  # @param y [y] a vertical position of this cell can't be outside of this life
	def initialize(life, x = 0, y= 0)
		@life = life
    #validation
    validate_x(x)
    validate_y(y)
		@x = x
		@y = y
		@life.cells << self
	end

  # Searches for all neighbours of the cell
  # @return [Array] returns an array of neighbours
	def neighbours
		neighbours = []
		life.cells.each do |cell|
			# horizontal neighbours
			if cell.y == y && (cell.x == x - 1 || cell.x == x + 1)
				neighbours << cell
			end

			# vertical neighbours
			if (cell.y == y - 1 || cell.y == y + 1) && cell.x == x
				neighbours << cell
			end

			#  edges
			if (cell.y == y - 1 || cell.y == y + 1) && (cell.x == x - 1 || cell.x == x + 1) 
				neighbours << cell
			end
		end
		neighbours
	end

  # Checks if the cell is alive
  # @return [Boolean]
	def alive?
		life.cells.include?(self)
	end
  # Kills the cell in the life
	def die
		life.cells = life.cells - [self]
  end

  private
  def validate_x(x)
    raise ArgumentError.new "outside of life in x: #{x} is bigger then #{life.width}" if x > @life.width
  end

  def validate_y(y)
    raise ArgumentError.new "outside of life in y: #{y} is bigger then #{life.height}" if y > @life.height
  end
end