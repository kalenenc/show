#I unfortunately was not able to finish this challenge in time. I was able to finish the first function, build,
#but could not finish the reserve function. I have detailed my notes the best I could. I know my
#code isn't the cleanest right now, but I sadly didn't have time to refactor the way I wanted to, as I was
#too fucused of figuring out finishing the reserve function.

#I didn't add in any additional functions other than build and and reserve, as I didn't know if that was allowed.

#I hope it's okay I requested 2 additional days, as from December 2nd to December 4th, I was on vacation (Toronto!)

#As for my first build function, I realize now I could have assigned each coordinate to a hash which would
#have been easier to access each coordinate in the seating chart. Further notes on it can be seen in the code

#In regards to the reserve function, I was trying to loop through the map array, check to see if the 
#sub-arrays that represented the rows contained a consecutive series of empty seats, represted by "O"s.

#If they did, I was then going to calculate the distance from the the first index of the series of consecutive "O"s
#and then push them in an array so I can access them later to then calcuate the distance from that coordinate.

#I was then going to see if n was less than or equal to the number of consecutive Os in a row
#and if it was greater, to calculate the closest distance from the front center position so fill in the 
#seats. If n was greater than or equal to the number of consecutive Os consecutive numbers, I would have 
#then checked to see the next closest distance from the center front position was available, and keep going 
#until I found if there were any consecutive seats open.

#If not, it would have output: "Sorry, your request cannot be handled at this time."

#Thanks for giving me the chance to do this challenge! I know my code definitely can use some improvement in
#lots of ways, but I'm so eager to learn more and write better code. 



#more of my code can be found on my github page github.com/kalenenc

class Seating

	
	def build rows, cols, reserved
		#this part builds the seating chart
		col_array = []
		row_array = []
		@rows = rows
		@cols = cols
		@reserved = reserved
		#assigns makes the seating chart
		@chart = Array.new(@rows)  {Array.new(@cols){"O"}}
		#loop through the given array
		@reserved.each do |x|
			#splits the reserved array at the "c"
			c_split = x.split("C") # for example: this would return ["R1", "5"] 
			#splits the array at the "R"
			both_split = c_split[0].split("R") #this would then bring back an array of ["", "1"]

			#separates the items in the array
			col = c_split[1] #the number of the columns would be, split so we get the number and not the empty first index
			row = both_split[1] #allows us to get the get the rows 
			#we subtract 1 so that it would be equal to the index position in the 2d array 
			#and then we convert it to an int
			col = col.to_i - 1
			row = row.to_i - 1
			
		
			col_array.push(col) #pushes the col # to col_array
			row_array.push(row) #pushes the row # to row_array
		end

		#-------------------------------------------
		
		index_col_array = []
		index_row_array = []

		puts "index_col_array: #{index_col_array}"

		#loops through and pushes the number of rows to a row array and the number of cols to a col array
		(0...@rows).each do |r|
		    (0...@cols).each do |c|
		    	index_col_array.push(c)
		    	index_row_array.push(r)
		    end
		end

		#makes an array of the coordinates that the user input (eg, R1C4 becomes [0, 3] inside of 
		#an array called combine_array) 
		combine_array = row_array.zip col_array
		

		# --------------Print Chart------------------

		#prints the seating chart out
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

	#Everything after this line isn't completely functioning the way I want it to

	def reserve n

		map = @chart #for right now, set map as an instance variable

		puts n #just a test i wrote
		#gives the y coordinate of the front center row
			#so map[0][front_cent] would be the front center position
		front_cent = ((0 + (@cols - 1 )) / 2).abs #this finds the front center y position

		currentNum = "O"  #variable used to see what the consecutive values I'd be searching for in the chart
		currentConsecutive = 0 #what the value is defined at first, increases if the current iteration has more than 1 consecutive "Os"
		maxConsecutive = 0 #what the max consecutive number is 
		distance = @cols * @rows # I just chose this value to be cols * rows so that it would always default to bigger than the largest distance on the seating chart
		lowest_dist = @cols * @rows # I just chose this value to be cols * rows so that it would always default to bigger than the largest distance on the seating chart
		max_array = [] #array that contains the max nubmer of consecutive Os in a row
		hash = {} #an empty hash I made to test something
		

	

		(0...@rows).each do |x| #was 
			(0...@cols).each do |y|	
				distance = (x - 0).abs + (y - front_cent).abs #trying to calculate the distance from the front center coordinate
				#for this, i was trying to see if i could definte a variable as lowest dist (lowest distance from the 
				#front center seat, and then update it each time we loop through it so that closest dist can be updated)
				if lowest_dist > answer && map[x][y] != "X" 
					lowest_dist = answer 
		    			closest_coord = map[x][y]
		    			#here i was doing some tests to figure out if it was looping properly
		    			puts "closest coord: #{closest_coord}"
		    			puts "map: map[#{x}][#{y}]"
		    			puts "distance = #{lowest_dist}"
		    			puts "coordinate: #{map[x][y]}"
		    			puts "--------"
				end
				
				#here I was trying to se see if there are consecutive "O"s that we can then calculate the 
				#distance from to figure out where to go 
				if map[x][y] == currentNum 
					currentConsecutive += 1
		     		maxConsecutive = [maxConsecutive, currentConsecutive].max
		     		puts "maxConsecutive #{maxConsecutive}"
				else
					currentConsecutive = 0
					#resets it if there the number is not a O
				end
				#here i was trying to see if a hash could be used to hold the first index of each consective
				#Os that ocurred
				hash[x] = y
				
			end
			#pushes the max consecutive number of each row to an array called max array. i was hoping to use
			#this array so that i could then use the calculation for the closest distance to the front center
			#seat to see where to seat the people
			max_array.push(maxConsecutive)
			#reset both values
			currentConsecutive = 0
			maxConsecutive = 0
		end
		
		max = max_array.max #value that contains the max nubmer of consecutive Os in a row

	end

end

seat = Seating.new
seat.build 3, 11, ["R1C4","R1C6","R2C3","R2C7","R3C9","R3C10"]
seat.reserve 6 #didn't get around to using a map parameter, as the class just contains an 
#instance variable of the array built in the first function

