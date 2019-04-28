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

	# context "should provide desired output" do
	# 	it "should contain 10 digits" do
	#     expect(capture_phonenumber('6686787825')).to be 
	#   end
	# end



end