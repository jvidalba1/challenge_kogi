require "repeated_string"

describe RepeatedString do
  describe "#solution" do
    context "given an list without strings repated oddly" do
      
      before(:each) do
        @list = ["abc", "abc", "cde", "cde"]  
        @repeated_string = RepeatedString.new(@list)
      end

      it "returns nil" do
        expect(@repeated_string.solution).to eq nil
      end
    end

    context "given an list with one string" do
      
      before(:each) do
        @list = ["abc"]  
        @repeated_string = RepeatedString.new(@list)
      end

      it "returns the unique string" do
        expect(@repeated_string.solution).to eq @list.first
      end
    end

    context "given an list with one string and other one twice" do
      
      before(:each) do
        @list = ["abc", "cde", "abc"]  
        @repeated_string = RepeatedString.new(@list)
      end

      it "returns the string repeated once" do
        expect(@repeated_string.solution).to eq "cde"
      end
    end

    context "given an list with one string repeated three times" do
      
      before(:each) do
        @list = ["abc", "cde", "abc", "abc", "cde"]  
        @repeated_string = RepeatedString.new(@list)
      end

      it "returns the string repeated once" do
        expect(@repeated_string.solution).to eq "abc"
      end
    end

    context "given an list with one string repeated five times" do
      
      before(:each) do
        @list = ["abc", "cde", "abc", "abc", "cde", "abc", "abc"]  
        @repeated_string = RepeatedString.new(@list)
      end

      it "returns the string repeated once" do
        expect(@repeated_string.solution).to eq "abc"
      end
    end
  end
end
