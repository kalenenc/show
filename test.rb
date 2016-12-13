currentNum = elements[0]
currentConsecutive = 1
maxConsecutive = 1

# for (int i = 1; i < array.length; i++) {
#         if (array[i] == currentNum) {
#             currentConsecutive++;
#             maxConsecutive = Math.max(maxConsecutive, currentConsecutive);
#         } else {
#             currentNum = array[i];
#             currentConsecutive = 1;
#         }
#     }
#     return maxConsecutive;

(array.length).each do |i|
	if array[i] == currentNum
		currentConsecutive += 1
		maxConsecutive = [maxConsecutive, currentConsecutive].max
	else
		currentNum = array[i]
		currentConsecutive = 1
	end
end

return maxConsecutive


#-----------

array = [0, 0, 0, 0, 9, 7, 0, 0, 0, 7, 0]

looping = true
def reserve array, n
	#loop through the array
	(0...array.length).each do |x|
		#assign the variable to the place we want to loop from
		if array[x] == 9
			while n > 0
				#if the position to the right is open
				if array[x + 1] == 0 
					#assign that position as taken
					array[x + 1] = 7
					n -= 1
					x +=1

				#if the right position is taken, check if the position to the left is taken
				else 
					#if the position to the left is open
					if array[x - 1] == 0
						#assign that position as taken
						puts "should run"
						puts x
						puts n
						array[x - 1] = 7
						n -= 1
						x +=1
					#if the position is taken
					else
						puts "Sorry your request cant be completed at this time"
						break
					end
				end
			end
		end
	end
end

reserve array, 3
puts "array #{array}"