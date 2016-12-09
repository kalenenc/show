require './lib/my_class'

class Seating




	def build rows, cols, reserved
		#this part builds the seating chart
		#r_num = 1
		#c_num = 1
		col_array = []
		row_array = []
	
		chart = Array.new(rows)  {Array.new(cols){"S"}}
		puts "this is chart #{chart}"
		
		#this all works!
		reserved.each do |x|
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

		(0...rows).each do |r|
		    (0...cols).each do |c|
		    	index_col_array.push(c)
		    	index_row_array.push(r)
		    end
		end

		combine_array = row_array.zip col_array
		#=> [[1,4],[1,6],[2,3],[2,7],[3,9],[3,10]]
		index_combine_array = index_row_array.zip index_col_array

		puts "combine array #{combine_array}"

		# (index_combine_array.length).times do |i|
		# 	(combine_array.length).times do |c|
		# 		# puts "this is the index combine array: #{i}" 
		# 		# puts "this is the combined array: #{c}" 
		# 		if index_combine_array[i] == combine_array[c]
		# 			puts "equal! #{index_combine_array[i]} #{combine_array[c]}"
		# 			puts "this is i #{i}"
		# 			puts "this is c #{c}"
		# 			puts "this is chart[i][c] #{chart[i][c]}"
		# 			# equal_array.push(c)
		# 			#puts "chart[i][c] is #{chart[i][c]}"
		# 			chart[i][c] = "X"
		# 			#puts "this is the chart position that should be x #{chart[c][i]}"
			
		# 		end
				
		# 	end
			
		# end
	
		

		


		# --------------Print Chart------------------

		
		(0...rows).each do |r|
		    (0...cols).each do |c|
		    	
		    	combine_array.each do |x|
		    		if x[0] == r && x[1] == c
		    			chart[r][c] = "X"
		    		end
		    	end
		    
		    
		    	print chart[r][c]
		    
		    end
		  
		    puts 
		end


	end
end

seat = Seating.new
seat.build 3, 11, ["R1C4","R1C6","R2C3","R2C7","R3C9","R3C10"]


# chart = Array.new(3)  {Array.new(11){"O"}}



# def make_grid chart
# 	(0..2).each do |i|
# 	    (0..10).each do |j|
# 	        print chart[i][j]
# 	    end
# 	    puts
# 	end
# end

# while true
# 	answer_array = []
# 	puts "Please choose the seat you would like to reserve, separated by a comma"
# 	#get user input
# 	answer = gets.chomp.split(",").map(&:to_i)

# 	row = answer[0]
# 	col = answer[1]

# 	if chart[row][col] == "O"
# 		chart[row][col] = "X"
# 		puts "cool, you changed the seat!"
# 		make_grid chart

# 	else
# 		puts "That seat is already taken"
# 	end
# end