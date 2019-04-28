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

#function joins words to generate the desired output
def make_words(words, str)
	if !str.compact[0].nil? && !str.compact[1].nil?
		str[0].compact.each do |ele1|
			str.compact[1].each do |ele2|
				words << [ele1,ele2].join(",")
			end
		end
	end
	words
end

puts "Please Enter 10 digit number except 0 and 1"
digits = gets.strip

if digits.size != 10 || digits.to_i.to_s != digits || digits.include?('0') ||  digits.include?('1')
	puts "This is not a valid phone number. Please enter a valid phone number"
else
	int_mapping_char = {2 => ['a', 'b', 'c'], 3 => ['d', 'e', 'f'], 4 => ['g', 'h', 'i'], 5 => ['j', 'k', 'l'], 6 => ['m', 'n', 'o'], 7 => ['p', 'q', 'r', 's'], 8 => ['t', 'u', 'v'], 9 => ['w', 'x', 'y', 'z']}
	combination_of_split = [[3,3,4], [3,4,3],[4,3,3],[3,7],[7,3],[4,6],[6,4],[5,5],[10]]
	words = []
	combination_of_digits = []
	first_characters_of_word = []

	combination_of_split.each do |elements|
		index = 0
		elements.each do |ele|
			combination_of_digits << digits[index..(index+ele - 1)]
			first_characters_of_word << int_mapping_char[digits[index].to_i]
			index += ele
		end
	end

	first_str, third_str, fifth_str, sixth_str = [], [], [], []
	loaded_words_3chars, loaded_words_4chars, loaded_words_5chars, loaded_words_6chars, loaded_words_7chars, loaded_words_10chars = load_words_dictionary(first_characters_of_word.uniq)

		combination_of_digits.each_with_index do |combi, index|
			if  combi.length == 3
				loaded_words_3chars.each do |word|
					if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)
						if index == 0 || index == 1 || index == 3 || index == 5 || index == 7 || index == 8
							first_str[index] = [] if first_str[index].nil?
							first_str[index] << word
						end
						 if index == 9 || index == 12
							third_str[index] = [] if third_str[index].nil?
							third_str[index] << word
						end
					end
				end
			end 

			if combi.length == 4
				loaded_words_4chars.each do |word|
					if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase) && int_mapping_char[combi[3].to_i].include?(word[3].downcase)
						if index == 2 || index == 4 || index == 6
							first_str[index] = [] if first_str[index].nil?
							first_str[index] << word
						end
						if index == 13 || index == 16	
							fifth_str[index] = [] if fifth_str[index].nil?
							fifth_str[index] << word
						end
					end
				end
			end

			if combi.length == 7
				loaded_words_7chars.each do |word|
					if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase) && int_mapping_char[combi[5].to_i].include?(word[5].downcase) && int_mapping_char[combi[6].to_i].include?(word[6].downcase)
						third_str[index] = [] if third_str[index].nil?
						third_str[index] << word
					end
				end
			end

			if combi.length == 5
				loaded_words_5chars.each do |word|
					if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase)
						sixth_str[index] = [] if sixth_str[index].nil?
						sixth_str[index] << word
					end
				end
			end
			if combi.length == 6
				loaded_words_6chars.each do |word|
					if int_mapping_char[combi[0].to_i].include?(word[0].downcase) && int_mapping_char[combi[1].to_i].include?(word[1].downcase)  && int_mapping_char[combi[2].to_i].include?(word[2].downcase)  && int_mapping_char[combi[3].to_i].include?(word[3].downcase) && int_mapping_char[combi[4].to_i].include?(word[4].downcase) && int_mapping_char[combi[5].to_i].include?(word[5].downcase)
						fifth_str[index] = [] if fifth_str[index].nil?
						fifth_str[index] << word
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

	if !first_str[0].nil? && !first_str.compact[1].nil? && !first_str.compact[2].nil?
		first_str[0].each do |ele1|
			first_str.compact[1].each do |ele2|
				first_str.compact[2].each do |ele3|
					words << [ele1,ele2,ele3].join(",")
				end
			end
		end
	end

	words = make_words(words, third_str.compact)
	words = make_words(words, fifth_str.compact)
	words = make_words(words, sixth_str.compact)

	print words.uniq
end
