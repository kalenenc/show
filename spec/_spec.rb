require "my_class"

describe Seating do
	describe "build function" do
		context "give it $1.00" do
			it "return 1 one(s)" do
				seat = Seating.new
				expect(seat.build(1.00)).to eql("1 one(s) ")
			end
		end
		
		

	end

	describe "reserve function" do
		context "give it $1.00" do
			it "return 1 one(s)" do
				seat = Seating.new
				expect(seat.reserve(1.00)).to eql("1 one(s) ")
			end
		end
		
		

	end
end