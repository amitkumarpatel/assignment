require './assignment'

def capture_phonenumber(phone_number)
  allow($stdin).to receive(:gets).and_return(phone_number)
  $stdin.gets
end

describe 'assignment' do
	context "should be a mobile number" do
		it "should contain 10 digits" do
	    expect(capture_phonenumber('2342342344').length).to be == 10
	  end

	  it "should not contain 0 and 1" do
			expect(capture_phonenumber('2342342344')).not_to include( '0' )
			expect(capture_phonenumber('2342342344')).not_to include( '1' )
	  end

	  it "should contain only integers" do
			expect(capture_phonenumber('2342342344').to_i.to_s).to eq(capture_phonenumber('2342342344'))
	  end
	end

	context "should provide combination of digits with splits" do
    int_mapping_char = {2 => ['a', 'b', 'c'], 3 => ['d', 'e', 'f'], 4 => ['g', 'h', 'i'], 5 => ['j', 'k', 'l'], 6 => ['m', 'n', 'o'], 7 => ['p', 'q', 'r', 's'], 8 => ['t', 'u', 'v'], 9 => ['w', 'x', 'y', 'z']}
		combination_of_split = [[3,3,4], [3,4,3],[4,3,3],[3,7],[7,3],[4,6],[6,4],[5,5],[10]] 

		it "should return integer combination and letter array" do
	    phone_number_string = capture_phonenumber('6686787825')
	    combination_of_digits, first_characters_of_words = get_combination_of_number(phone_number_string, combination_of_split, int_mapping_char)
      expect(combination_of_digits).to eq(["668", "678", "7825", "668", "6787", "825", "6686", "787", "825", "668", "6787825", "6686787", "825", "6686", "787825", "668678", "7825", "66867", "87825", "6686787825"])
			expect(first_characters_of_words).to eq([["m", "n", "o"], ["m", "n", "o"], ["p", "q", "r", "s"], ["m", "n", "o"], ["m", "n", "o"], ["t", "u", "v"], ["m", "n", "o"], ["p", "q", "r", "s"], ["t", "u", "v"], ["m", "n", "o"], ["m", "n", "o"], ["m", "n", "o"], ["t", "u", "v"], ["m", "n", "o"], ["p", "q", "r", "s"], ["m", "n", "o"], ["p", "q", "r", "s"], ["m", "n", "o"], ["t", "u", "v"], ["m", "n", "o"]])
	  end

		it "should print output string combination" do
	    phone_number_string = capture_phonenumber('2282668687')
	    combination_of_digits, first_characters_of_words = get_combination_of_number(phone_number_string, combination_of_split, int_mapping_char)
      expect(combination_of_digits).to eq(["228", "266", "8687", "228", "2668", "687", "2282", "668", "687", "228", "2668687", "2282668", "687", "2282", "668687", "228266", "8687", "22826", "68687", "2282668687"])
			expect(first_characters_of_words).to eq([["a", "b", "c"], ["a", "b", "c"], ["t", "u", "v"], ["a", "b", "c"], ["a", "b", "c"], ["m", "n", "o"], ["a", "b", "c"], ["m", "n", "o"], ["m", "n", "o"], ["a", "b", "c"], ["a", "b", "c"], ["a", "b", "c"], ["m", "n", "o"], ["a", "b", "c"], ["m", "n", "o"], ["a", "b", "c"], ["t", "u", "v"], ["a", "b", "c"], ["m", "n", "o"], ["a", "b", "c"]])
	  end
	end

	context "should provide desired output for phone numbers" do
    int_mapping_char = {2 => ['a', 'b', 'c'], 3 => ['d', 'e', 'f'], 4 => ['g', 'h', 'i'], 5 => ['j', 'k', 'l'], 6 => ['m', 'n', 'o'], 7 => ['p', 'q', 'r', 's'], 8 => ['t', 'u', 'v'], 9 => ['w', 'x', 'y', 'z']}
		combination_of_split = [[3,3,4], [3,4,3],[4,3,3],[3,7],[7,3],[4,6],[6,4],[5,5],[10]] 

		it "should print string combination" do
	    phone_number_string = capture_phonenumber('6686787825')
	    combination_of_digits, first_characters_of_words = get_combination_of_number(phone_number_string, combination_of_split, int_mapping_char)
      result = combination_of_words(combination_of_digits, first_characters_of_words, int_mapping_char)
      expect(result.flatten).to eq(["MOTORTRUCK", "MOT,OPT,PUCK", "MOT,OPT,RUCK", "MOT,OPT,SUCK", "MOT,ORT,PUCK", "MOT,ORT,RUCK", "MOT,ORT,SUCK", "NOT,OPT,PUCK", "NOT,OPT,RUCK", "NOT,OPT,SUCK", "NOT,ORT,PUCK", "NOT,ORT,RUCK", "NOT,ORT,SUCK", "OOT,OPT,PUCK", "OOT,OPT,RUCK", "OOT,OPT,SUCK", "OOT,ORT,PUCK", "OOT,ORT,RUCK", "OOT,ORT,SUCK", "MOT,TAJ", "NOT,TAJ", "OOT,TAJ", "NOUN,STRUCK", "ONTO,STRUCK", "MOTOR,TRUCK", "MOTOR,USUAL", "NOUNS,TRUCK", "NOUNS,USUAL"])
	  end

		it "should print output string combination" do
	    phone_number_string = capture_phonenumber('2282668687')
	    combination_of_digits, first_characters_of_words = get_combination_of_number(phone_number_string, combination_of_split, int_mapping_char)
      result = combination_of_words(combination_of_digits, first_characters_of_words, int_mapping_char)
      expect(result.flatten).to eq(["CATAMOUNTS", "ACT,BOO,TOTS", "ACT,BOO,TOUR", "ACT,CON,TOTS", "ACT,CON,TOUR", "ACT,COO,TOTS", "ACT,COO,TOUR", "BAT,BOO,TOTS", "BAT,BOO,TOUR", "BAT,CON,TOTS", "BAT,CON,TOUR", "BAT,COO,TOTS", "BAT,COO,TOUR", "CAT,BOO,TOTS", "CAT,BOO,TOUR", "CAT,CON,TOTS", "CAT,CON,TOUR", "CAT,COO,TOTS", "CAT,COO,TOUR", "ACT,AMOUNTS", "ACT,CONTOUR", "BAT,AMOUNTS", "BAT,CONTOUR", "CAT,AMOUNTS", "CAT,CONTOUR", "ACTA,MOUNTS"])
	  end
	end
end