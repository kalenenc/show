require './lib/my_class'

class Seating

	# def initialize
	# 	@chart = []


	# end

	def build rows, cols, reserved
		#this part builds the seating chart
		#r_num = 1
		#c_num = 1
		col_array = []
		row_array = []
		@rows = rows
		@cols = cols
		@reserved = reserved
	
		@chart = Array.new(@rows)  {Array.new(@cols){"S"}}


		
		#this all works!
		@reserved.each do |x|
			c_split = x.split("C") #this would return ["R1", "5"] 
			both_split = c_split[0].split("R") #this would then bring back an array of ["", "1"]

			#separates the items in the array
			col = c_split[1] 
			row = both_split[1]
			col = col.to_i - 1
			row = row.to_i - 1
			
		
			col_array.push(col) #pushes the col # to col_array
			row_array.push(row) #pushes the row # to row_array
		end

		#convert col_array and row_array to ints
		col_array.map {|x| x.to_i}
		#convert row_array and row_array to ints
		row_array.map {|x| x.to_i}

		#-----------------------------------------------
		index_col_array = []
		index_row_array = []

		(0...@rows).each do |r|
		    (0...@cols).each do |c|
		    	index_col_array.push(c)
		    	index_row_array.push(r)
		    end
		end

		combine_array = row_array.zip col_array
		#=> [[1,4],[1,6],[2,3],[2,7],[3,9],[3,10]]
		index_combine_array = index_row_array.zip index_col_array

		# --------------Print Chart------------------
		


		(0...@rows).each do |r|
		    (0...@cols).each do |c|
		    	
		    	combine_array.each do |x|
		    		if x[0] == r && x[1] == c
		    			@chart[r][c] = "X"
		    		end
		    	end
		    	print @chart[r][c]
		    end
		     puts
		end
		

	end

	def reserve 

		map = @chart

		xmid = ((0 - (@rows -1 )) / 2).abs
		ymid = ((0 - (@rows + 1 )) / 2).abs

		midpoint = map[xmid][ymid]

		(0...@rows).each do |r|
		    (0...@cols).each do |c|

		    	#probably try to do the majority of stuff while in this loop here

		    		#figure out the midpoint of a 2D array (or maybe just a reg array to start)

		    		#figure out the closes distance to the midpoint
		    		#on that midpoint, distribute seats equally along the midpoint of the number of 
		    		# seats that they want
		    		#if there is NOT an "X" already filled in the closest area from the middle
		    			#update the array where they want to sit with an "X"
		    		#if there is an "X" already filled in the closest area from the middle
		    			#say, sorry, your request can't be submitted at this time
		    		#print back the array again
		    		


		    	#this should be the last step and probably in an if statement, if else, skip it
		    	print map[r][c]
		    end
		    puts
		end




	# 	#Find the best available seats
	# 	#Mark those seats as reserved in the seating map
	# 	#Print the start and end seats that were just reserved (e.g. reserve(map, 3) could print "R1C4-R1C6")
	# 	#Return map with these seated now reserved
	# 	#If its not possible to fulfill a request, print "Not Available" and return the map as is

	end

end

seat = Seating.new
seat.build 3, 11, ["R1C4","R1C6","R2C3","R2C7","R3C9","R3C10"]
# seat.reserve

