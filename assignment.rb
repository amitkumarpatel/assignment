puts "Please Enter 10 digit number except 0 and 1"
digits = gets.strip#.split("")
int_mapping_char = {2 => ['a', 'b', 'c'], 3 => ['d', 'e', 'f'], 4 => ['g', 'h', 'i'], 5 => ['j', 'k', 'l'], 6 => ['m', 'n', 'o'], 7 => ['p', 'q', 'r', 's'], 8 => ['t', 'u', 'v'], 9 => ['w', 'x', 'y', 'z']}
# Need to add test to check the entered number is having 10 digit and also does not contain 0,1
combination_of_split = [[3,3,4], [3,4,3], [3,7], [4,3,3], [4,6], [5,5], [6,4], [7,3], [10]]
combination_of_digits = []
first_element = []
combination_of_split.each do |elements|
	index = 0
	elements.each do |ele|
		combination_of_digits << digits[index..(index+ele - 1)]
		first_element << digits[index]
		index += ele
	end
end
load_words_from_dictionary = []
first_characters = []
first_element.uniq.each do |ele|
first_characters << int_mapping_char[ele.to_i]
end
#puts first_characters.flatten
File.open("./dictionary.txt", "r") do |f|
  f.each_line do |line|
    load_words_from_dictionary << line.strip if first_characters.flatten.include?(line[0].downcase) && (line.strip.length <= 10 && line.strip.length > 2)
  end
end
words = []
#print combination_of_digits.inspect
combination_of_digits.each do |characters|
	if characters.length == 3
		#(0..characters.length - 1).each do |index|
			int_mapping_char[characters[0].to_i].each do |i|
				int_mapping_char[characters[1].to_i].each do |j|
					int_mapping_char[characters[2].to_i].each do |k|
						words << i+j+k if load_words_from_dictionary.include?( (i+j+k).upcase)
					end
				end
			end
		#end
	# elsif characters.length == 4
	# 	int_mapping_char[characters[0].to_i].each do |i|
	# 		int_mapping_char[characters[1].to_i].each do |j|
	# 			int_mapping_char[characters[2].to_i].each do |k|
	# 				int_mapping_char[characters[3].to_i].each do |l|
	# 					words << i+j+k+l if load_words_from_dictionary.include?((i+j+k+l).upcase)
	# 				end
	# 			end
	# 		end
	# 	end
	# elsif characters.length == 5
	# 	int_mapping_char[characters[0].to_i].each do |i|
	# 		int_mapping_char[characters[1].to_i].each do |j|
	# 			int_mapping_char[characters[2].to_i].each do |k|
	# 				int_mapping_char[characters[3].to_i].each do |l|
	# 					int_mapping_char[characters[4].to_i].each do |m|
	# 						words << i+j+k+l+m if load_words_from_dictionary.include?((i+j+k+l+m).upcase)
	# 					end
	# 				end		
	# 			end
	# 		end
	# 	end	
	# elsif characters.length == 6 
	# 	int_mapping_char[characters[0].to_i].each do |i|
	# 		int_mapping_char[characters[1].to_i].each do |j|
	# 			int_mapping_char[characters[2].to_i].each do |k|
	# 				int_mapping_char[characters[3].to_i].each do |l|
	# 					int_mapping_char[characters[4].to_i].each do |m|
	# 						int_mapping_char[characters[5].to_i].each do |n|
	# 							words << i+j+k+l+m+n if load_words_from_dictionary.include?((i+j+k+l+m+n).upcase)
	# 						end
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# elsif characters.length == 7
	# 	int_mapping_char[characters[0].to_i].each do |i|
	# 		int_mapping_char[characters[1].to_i].each do |j|
	# 			int_mapping_char[characters[2].to_i].each do |k|
	# 				int_mapping_char[characters[3].to_i].each do |l|
	# 					int_mapping_char[characters[4].to_i].each do |m|
	# 						int_mapping_char[characters[5].to_i].each do |n|
	# 							int_mapping_char[characters[6].to_i].each do |o|
	# 								words << i+j+k+l+m+n+o if load_words_from_dictionary.include?((i+j+k+l+m+n+o).upcase)
	# 							end
	# 						end
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# elsif characters.length == 10
	# 	int_mapping_char[characters[0].to_i].each do |i|
	# 		int_mapping_char[characters[1].to_i].each do |j|
	# 			int_mapping_char[characters[2].to_i].each do |k|
	# 				int_mapping_char[characters[3].to_i].each do |l|
	# 					int_mapping_char[characters[4].to_i].each do |m|
	# 						int_mapping_char[characters[5].to_i].each do |n|
	# 							int_mapping_char[characters[6].to_i].each do |o|
	# 								int_mapping_char[characters[7].to_i].each do |p|
	# 									int_mapping_char[characters[8].to_i].each do |q|
	# 										int_mapping_char[characters[9].to_i].each do |r|
	# 											words << i+j+k+l+m+n+o+p+q+r if load_words_from_dictionary.include?(((i+j+k+l+m+n+o+p+q+r).upcase))
	# 										end
	# 									end
	# 								end
	# 							end
	# 						end
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	end				
end

combi_with_10 = combination_of_digits.select{|char| char if char.length == 10}
combi_with_7 = combination_of_digits.select{|char| char if char.length == 7}
combi_with_5 = combination_of_digits.select{|char| char if char.length == 5}
combi_with_4 = combination_of_digits.select{|char| char if char.length == 4}
combi_with_10 = combi_with_10[0]
combi_with_7 = combi_with_7[0]
combi_with_5 = combi_with_5[0]
combi_with_4 = combi_with_4[0]
load_words_from_dictionary.each do |word|
	if word.length == 4
		if int_mapping_char[combi_with_4[0].to_i].include?(word[0].downcase) && int_mapping_char[combi_with_4[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi_with_4[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi_with_4[3].to_i].include?(word[3].downcase)
			puts word
		end
	end
	if word.length == 5
		if int_mapping_char[combi_with_5[0].to_i].include?(word[0].downcase) && int_mapping_char[combi_with_5[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi_with_5[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi_with_5[3].to_i].include?(word[3].downcase) && int_mapping_char[combi_with_5[4].to_i].include?(word[4].downcase) 
			puts word
		end
	end
	if word.length == 7
		if int_mapping_char[combi_with_7[0].to_i].include?(word[0].downcase) && int_mapping_char[combi_with_7[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi_with_7[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi_with_7[3].to_i].include?(word[3].downcase) && int_mapping_char[combi_with_7[4].to_i].include?(word[4].downcase) && int_mapping_char[combi_with_7[5].to_i].include?(word[5].downcase) && int_mapping_char[combi_with_7[6].to_i].include?(word[6].downcase)
			puts word
		end
	end
	if word.length == 10
		if int_mapping_char[combi_with_10[0].to_i].include?(word[0].downcase) && int_mapping_char[combi_with_10[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi_with_10[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi_with_10[3].to_i].include?(word[3].downcase) && int_mapping_char[combi_with_10[4].to_i].include?(word[4].downcase) && int_mapping_char[combi_with_10[5].to_i].include?(word[5].downcase) && int_mapping_char[combi_with_10[6].to_i].include?(word[6].downcase)
			puts word
		end
	end
end

#print words.uniq.inspect

#print load_words_from_dictionary