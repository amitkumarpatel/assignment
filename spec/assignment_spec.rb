require './assignment'

def capture_phonenumber
  $stdin.gets.chomp
end

describe 'assignment' do
  before do
    $stdin = "2345678989"
  end

  after do
    $stdin = STDIN
  end
	
	context "should be a mobile number" do
		it "should contain 10 digits" do
	    expect(capture_phonenumber.length).to be == 10
	  end

	  	it "should contain 10 digits" do
			expect(capture_phonenumber).not_to include( '0' )
			expect(capture_phonenumber).not_to include( '1' )
	  end
	end

end