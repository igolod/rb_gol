
RSpec.describe Life do
	subject {Life.new}

	describe "rules" do
		it "Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
			cell00 = Cell.new(subject, 0,0)
			subject.cycle
			expect(subject.cells).to eq []
			expect(cell00.alive?).to be false
		end

		it "Any live cell with two or three live neighbours lives on to the next generation." do
			cell00 = Cell.new(subject, 0,0)
			cell01 = Cell.new(subject, 0,1)
			cell11 = Cell.new(subject, 1,1)
			cell10 = Cell.new(subject, 1,0)
			subject.cycle
			expect(subject.cells.length).to eq 4
			expect(cell00.alive?).to be true
			expect(cell01.alive?).to be true
			expect(cell11.alive?).to be true
			expect(cell10.alive?).to be true
		end

		it "Any live cell with more than three live neighbours dies, as if by over-population." do
			cell11 = Cell.new(subject, 1,1)
			cell00 = Cell.new(subject, 0,0)
			cell01 = Cell.new(subject, 0,1)
			cell02 = Cell.new(subject, 0,2)
			cell10 = Cell.new(subject, 1,0)
			cell12 = Cell.new(subject, 1,2)
			cell20 = Cell.new(subject, 2,0)
			cell21 = Cell.new(subject, 2,1)
			cell22 = Cell.new(subject, 2,2)

			subject.cycle

			expect(subject.cells.length).to eq 4
			expect(cell00.alive?).to be true
			expect(cell02.alive?).to be true
			expect(cell20.alive?).to be true
			expect(cell22.alive?).to be true


      expect(cell11.alive?).to be false
      expect(cell01.alive?).to be false
      expect(cell10.alive?).to be false
      expect(cell12.alive?).to be false
      expect(cell21.alive?).to be false

		end

		it "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
			cell00 = Cell.new(subject, 0,0)
			cell01 = Cell.new(subject, 0,1)
			cell11 = Cell.new(subject, 1,1)

			subject.cycle

			expect(subject.cells.length).to eq 4
		end
	end
end