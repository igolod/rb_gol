
RSpec.describe Cell do
	let(:life) {Life.new}
	it "should be able to find neighbours" do
		cellx = Cell.new(life, 1,1)
		cell00 = Cell.new(life, 0,0)
		cell01 = Cell.new(life, 0,1)
		cell02 = Cell.new(life, 0,2)
		cell10 = Cell.new(life, 1,0)
		cell12 = Cell.new(life, 1,2)
		cell20 = Cell.new(life, 2,0)
		cell21 = Cell.new(life, 2,1)
		cell22 = Cell.new(life, 2,2)

		expect(cellx.neighbours.length).to be 8
		expect(cell00.neighbours.length).to be 3
  end

  it "should be able to die" do
    cellx = Cell.new(life, 1,1)

    cellx.die
    expect(cellx.alive?).to be false
  end
end