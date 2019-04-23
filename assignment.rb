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

words_with_3, words_with_4 = [], []
combi_with_10 = combination_of_digits.select{|char| char if char.length == 10}
combi_with_7 = combination_of_digits.select{|char| char if char.length == 7}
combi_with_6 = combination_of_digits.select{|char| char if char.length == 6}
combi_with_5 = combination_of_digits.select{|char| char if char.length == 5}
combi_with_4 = combination_of_digits.select{|char| char if char.length == 4}
combi_with_3 = combination_of_digits.select{|char| char if char.length == 3}
puts combination_of_digits.inspect
#puts combi_with_3.inspect
combi_with_10 = combi_with_10[0]
	first_str = []
	sec_str = []
	third_str = []
	fourth_str = []
	fifth_str = []
	sixth_str = []
	combination_of_digits[0..2].each_with_index do |combi, index|
		load_words_from_dictionary.each do |word|
			if  combi.length == 3 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)
					first_str[index] = [] if first_str[index].nil?
					first_str[index] << word
				end
			elsif combi.length == 4 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase) && int_mapping_char[combi[3].to_i].include?(word[3].downcase)
					first_str[index] = [] if first_str[index].nil?
					first_str[index] << word
				end
			end 
		end
		#puts first_str.inspect
	end
	combination_of_digits[3..5].each_with_index do |combi, index|
		load_words_from_dictionary.each do |word|
			if  combi.length == 3 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)
					sec_str[index] = [] if sec_str[index].nil?
					sec_str[index] << word
				end
			elsif combi.length == 4 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase) && int_mapping_char[combi[3].to_i].include?(word[3].downcase)
					sec_str[index] = [] if sec_str[index].nil?
					sec_str[index] << word
				end
			end 
		end
		#puts sec_str.inspect
	end
	combination_of_digits[6..7].each_with_index do |combi, index|
		load_words_from_dictionary.each do |word|
			if  combi.length == 3 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)
					third_str[index] = [] if third_str[index].nil?
					third_str[index] << word
				end
			elsif combi.length == 7 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase) && int_mapping_char[combi[5].to_i].include?(word[5].downcase) && int_mapping_char[combi[6].to_i].include?(word[6].downcase)
					puts word
					third_str[index] = [] if third_str[index].nil?
					third_str[index] << word
				end
			end 
		end
		#puts third_str.inspect
	end
	combination_of_digits[8..10].each_with_index do |combi, index|
		load_words_from_dictionary.each do |word|
			if  combi.length == 3 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)
					fourth_str[index] = [] if fourth_str[index].nil?
					fourth_str[index] << word
				end
			elsif combi.length == 4 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase)
					fourth_str[index] = [] if fourth_str[index].nil?
					fourth_str[index] << word
				end
			end 
		end
		#puts fourth_str.inspect
	end
	combination_of_digits[11..12].each_with_index do |combi, index|
		load_words_from_dictionary.each do |word|
			if  combi.length == 4 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase) && int_mapping_char[combi[3].to_i].include?(word[3].downcase)
					fifth_str[index] = [] if fifth_str[index].nil?
					fifth_str[index] << word
				end
			elsif combi.length == 6 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase)  && int_mapping_char[combi[4].to_i].include?(word[4].downcase)  && int_mapping_char[combi[5].to_i].include?(word[5].downcase)
					fifth_str[index] = [] if fifth_str[index].nil?
					fifth_str[index] << word
				end
			end 
		end
		puts fifth_str.inspect
	end

	combination_of_digits[13..14].each_with_index do |combi, index|
		load_words_from_dictionary.each do |word|
			if combi.length == 5 && word.length == combi.length
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase)  && int_mapping_char[combi[4].to_i].include?(word[4].downcase)
					sixth_str[index] = [] if sixth_str[index].nil?
					sixth_str[index] << word
				end
			end 
		end
		puts sixth_str.inspect
	end

first_str[0].each do |ele1|
	first_str[1].each do |ele2|
		first_str[2].each do |ele3|
			words << [ele1,ele2,ele3].join(",")
		end
	end
end
sec_str[0].each do |ele1|
	sec_str[1].each do |ele2|
		sec_str[2].each do |ele3|
			words << [ele1,ele2,ele3].join(",")
		end
	end
end

fourth_str[0].each do |ele1|
	fourth_str[1].each do |ele2|
		fourth_str[2].each do |ele3|
			words << [ele1,ele2, ele3].join(",")
		end
	end
end

fifth_str[0].each do |ele1|
	fifth_str[1].each do |ele2|
			words << [ele1,ele2].join(",")
	end
end

sixth_str[0].each do |ele1|
	sixth_str[1].each do |ele2|
			words << [ele1,ele2].join(",")
	end
end
	# if word.length == 4
	# 	combi_with_4.uniq.each do |combi|
	# 		if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase)
	# 			words_with_4 <<  word
	# 		end
	# 	end 
	# end
	# if word.length == 5
	# 	combi_with_5.uniq.each do |combi|
	# 		if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase) 
	# 			#words_with_5 << word
	# 		end
	# 	end
	# end
	# if word.length == 6
	# 	combi_with_6.uniq.each do |combi|
	# 		if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase) && int_mapping_char[combi[5].to_i].include?(word[5].downcase)
	# 			#words_with_6 << word
	# 		end
	# 	end
	# end
	# if word.length == 7
	# 	combi_with_7.uniq.each do |combi|
	# 		if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase) && int_mapping_char[combi[5].to_i].include?(word[5].downcase) && int_mapping_char[combi[6].to_i].include?(word[6].downcase)
	# 			#words_with_7 << word
	# 		end
	# 	end
	# end
	# if word.length == 10
	# 	if int_mapping_char[combi_with_10[0].to_i].include?(word[0].downcase) && int_mapping_char[combi_with_10[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi_with_10[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi_with_10[3].to_i].include?(word[3].downcase) && int_mapping_char[combi_with_10[4].to_i].include?(word[4].downcase) && int_mapping_char[combi_with_10[5].to_i].include?(word[5].downcase) && int_mapping_char[combi_with_10[6].to_i].include?(word[6].downcase)
	# 		#words_with_10 << word
	# 	end
	# end

# combination_of_split.each do |combination|
# 	combination.each do |i|
# 		# if i == 3
# 		# 	words << 
# 		# elsif i == 4
# 		# elsif i == 5
# 		# 	words_with_5.each do |ww|
# 		# 		words << "#{ww}, #{}"
# 		# 	end
# 		# elsif i == 6	
# 		# end	
# 	end
# end
print words.uniq.inspect