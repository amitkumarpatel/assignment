# function loads required words from dictonary
def load_words_dictionary(characters_arr)
	loaded_words_3chars, loaded_words_4chars, loaded_words_5chars, loaded_words_6chars, loaded_words_7chars, loaded_words_10chars = [],[],[],[],[],[]
	File.open("./dictionary.txt", "r") do |f|
	  f.each_line do |line|
			if characters_arr.flatten.include?(line[0].downcase) && (line.strip.length <= 10 && line.strip.length > 2)
				case line.strip.size
					when 3
						loaded_words_3chars << line.strip
					when 4
						loaded_words_4chars << line.strip 
					when 5
						loaded_words_5chars << line.strip 
					when 6
						loaded_words_6chars << line.strip 
					when 7
						loaded_words_7chars << line.strip
					when 10
						loaded_words_10chars << line.strip
				end
			end	
	  end
	end
	return loaded_words_3chars, loaded_words_4chars, loaded_words_5chars, loaded_words_6chars, loaded_words_7chars, loaded_words_10chars
end

# generate combination of numbers from the entered phone number
def get_combination_of_number(numbers, combination_of_split, int_mapping_char)
	combination_of_numbers, first_characters_of_words  = [], []
	combination_of_split.each do |elements|
		index = 0
		elements.each do |element|
			combination_of_numbers << numbers[index..(index+element - 1)]
			first_characters_of_words << int_mapping_char[numbers[index].to_i]
			index += element
		end
	end
	return combination_of_numbers, first_characters_of_words
end

#function joins words to generate the desired output
def make_words(str)
	words = []
	(0..2).each do |count|
		if !str.compact[0].nil? && !str.compact[1].nil?
			str[0].compact.each do |ele1|
				str.compact[1].each do |ele2|
					words << [ele1,ele2].join(",") if ele1.size + ele2.size == 10
				end
			end
			str.shift(2)
		end
	end
	words
end

# function to loop in all the combinations of digits and returns the words from dictionary
def combination_of_words(combination_of_digits, first_characters_of_word, int_mapping_char)
	words = []
	first_str_arr, third_str_arr, fourth_str_arr, fifth_str_arr = [], [], [], []
	loaded_words_3chars, loaded_words_4chars, loaded_words_5chars, loaded_words_6chars, loaded_words_7chars, loaded_words_10chars = load_words_dictionary(first_characters_of_word.uniq)
	combination_of_digits.each_with_index do |combi, index|
		if  combi.length == 3
			loaded_words_3chars.each do |word|
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)
					if index == 0 || index == 1 || index == 3 || index == 5 || index == 7 || index == 8
						first_str_arr[index] = [] if first_str_arr[index].nil?
						first_str_arr[index] << word
					end
					 if index == 9 || index == 12
						third_str_arr[index] = [] if third_str_arr[index].nil?
						third_str_arr[index] << word
					end
				end
			end
		end
		if combi.length == 4
			loaded_words_4chars.each do |word|
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase) && int_mapping_char[combi[3].to_i].include?(word[3].downcase)
					if index == 2 || index == 4 || index == 6
						first_str_arr[index] = [] if first_str_arr[index].nil?
						first_str_arr[index] << word
					end
					if index == 13 || index == 16	
						fourth_str_arr[index] = [] if fourth_str_arr[index].nil?
						fourth_str_arr[index] << word
					end
				end
			end
		end
		if combi.length == 7
			loaded_words_7chars.each do |word|
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase) && int_mapping_char[combi[5].to_i].include?(word[5].downcase) && int_mapping_char[combi[6].to_i].include?(word[6].downcase)
					third_str_arr[index] = [] if third_str_arr[index].nil?
					third_str_arr[index] << word
				end
			end
		end
		if combi.length == 5
			loaded_words_5chars.each do |word|
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase)
					fifth_str_arr[index] = [] if fifth_str_arr[index].nil?
					fifth_str_arr[index] << word
				end
			end
		end
		if combi.length == 6
			loaded_words_6chars.each do |word|
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase) && int_mapping_char[combi[5].to_i].include?(word[5].downcase)
					fourth_str_arr[index] = [] if fourth_str_arr[index].nil?
					fourth_str_arr[index] << word
				end
			end
		end
		if combi.length == 10
			loaded_words_10chars.each do |word|
				if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase) && int_mapping_char[combi[5].to_i].include?(word[5].downcase) && int_mapping_char[combi[6].to_i].include?(word[6].downcase) && int_mapping_char[combi[7].to_i].include?(word[7].downcase) && int_mapping_char[combi[8].to_i].include?(word[8].downcase) && int_mapping_char[combi[9].to_i].include?(word[9].downcase)
					words << word
				end
			end
		end
	end
	(0..2).each do |count|
		if !first_str_arr[0].nil? && !first_str_arr.compact[1].nil? && !first_str_arr.compact[2].nil?
			first_str_arr[0].each do |ele1|
				first_str_arr.compact[1].each do |ele2|
					first_str_arr.compact[2].each do |ele3|
						words << [ele1,ele2,ele3].join(",") if ele1.size + ele2.size + ele3.size == 10
					end
				end
			end
			first_str_arr.shift(3)
		end
	end
	words << make_words(third_str_arr.compact)
	words << make_words(fourth_str_arr.compact)
	words << make_words(fifth_str_arr.compact)
	words
end

puts "Please Enter 10 digit number except 0 and 1"
phone_number_string = gets.strip
if phone_number_string.size != 10 || phone_number_string.to_i.to_s != phone_number_string || phone_number_string.include?('0') ||  phone_number_string.include?('1')
	puts "This is not a valid phone number. Please enter a valid phone number"
else
	output_words = []
	int_mapping_char = {2 => ['a', 'b', 'c'], 3 => ['d', 'e', 'f'], 4 => ['g', 'h', 'i'], 5 => ['j', 'k', 'l'], 6 => ['m', 'n', 'o'], 7 => ['p', 'q', 'r', 's'], 8 => ['t', 'u', 'v'], 9 => ['w', 'x', 'y', 'z']}
	combination_of_split = [[3,3,4], [3,4,3],[4,3,3],[3,7],[7,3],[4,6],[6,4],[5,5],[10]]
	
	combination_of_digits, first_characters_of_words = get_combination_of_number(phone_number_string, combination_of_split, int_mapping_char)
	output_words = combination_of_words(combination_of_digits, first_characters_of_words, int_mapping_char)
	print output_words.flatten.uniq
end