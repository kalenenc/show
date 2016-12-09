class Seating



	def build(rows, cols, reserved) 
		#builds and returns a data structure representing a seating map


		#rows (int) number of rows
		rows 

		#cols (int) number of columns (seats per row)


		#reserved (array) 1D array of strings represententing seats that have already been reserved
		


	end

	def reserve(map, n)
		#reserves the best available contiguous block of n seats and returns map with those seats reserved

		#The reserve function should:

		#Find the best available seats

		#Mark those seats as reserved in the seating map

		#Print the start and end seats that were just reserved (e.g. reserve(map, 3) could print "R1C4-R1C6")

		#Return map with these seated now reserved

		#If its not possible to fulfill a request, print "Not Available" and return the map as is

	end

	# Your starting map should have these 6 seats reserved for parents and friends:
	# R1C4 R1C6 R2C3 R2C7 R3C9 R3C10

	#By default, per your sisters initial seating map, your build method should be called with
	#build(3, 11, ["R1C4","R1C6","R2C3","R2C7","R3C9","R3C10"])

	# Always try to reserve the best available block of seats. How "good" a particular seat is is simply the Manhattan Distance from the front center seat (in this case R1C6).
	# The solution should be flexible enough so that it can work well with a variable number of seats and rows
	# The max number of tickets someone can request at once is 10
	# You are to choose the data structure of your choice for representing the map
	# Seat reservations cannot span more than one row, e.g. for a 2 seat request, R1C3-R1C4 is valid but R1C3-R2C3 is not
	

end