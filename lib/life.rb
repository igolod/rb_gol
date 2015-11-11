class Life

	## Attributes
	attr_accessor :cells, :width, :height

	def initialize(width = 3, height = 3)
		@width = width
		@height = height
		@cells = []
	end	

  # Goes through the life cycle of the game
	def cycle
		new_cells = []
    # Iterates through all possible fields of the life surface
		@width.times do |x|
			@height.times do |y|
        current_cell, alive = get_cell(x,y)
        if alive
        	# Any live cell with two or three live neighbours lives on to the next generation.
        	# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
        	# Any live cell with more than three live neighbours dies, as if by over-population.
          if (current_cell.neighbours.length == 2 || current_cell.neighbours.length ==3)
            new_cells << current_cell
          end
        else
          #Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
          if current_cell.neighbours.length ==3
            new_cells << current_cell
          else
            current_cell.die
          end
        end
			end
		end
		@cells = new_cells
  end

  private

  # Gets the cell from the current cells or creates a dummy cell
  # @returns [Cell, Booolean] the currently alife cell or a dummy cell
  def get_cell(x,y)
    self.cells.each do |cell|
      if cell.x == x && cell.y == y
        return cell, true
      end
    end
    return Cell.new(self,x,y), false
  end


end

