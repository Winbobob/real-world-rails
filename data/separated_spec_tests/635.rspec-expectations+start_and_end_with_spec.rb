RSpec.describe "expect(...).to start_with" do
  it_behaves_like "an RSpec matcher", :valid_value => "ab", :invalid_value => "bc" do
    let(:matcher) { start_with("a") }
  end

  context "with a string" do
    it "passes if it matches the start of the actual string" 


    it "fails if it does not match the start of the actual string" 

  end

  context "with an array" do
    it "passes if it is the first element of the array" 


    it "passes if the first elements of the array match" 


    it "fails if it does not match the first element of the array" 


    it "fails if it the first elements of the array do not match" 

  end

  context "with an array of strings" do
    it "passes if given the first element of the array" 


    it "passes if given the first n of the array" 


    it 'fails if given the wrong first element of the array' 

  end

  context "with an array of uncustomized structs" do
    struct = Struct.new(:foo)

    it 'passes if the array ends with a struct equal to the provided struct' 


    it 'fails if the array ends with a struct not equal to the provided struct' 

  end

  context "with an array of structs that have a custom `==` definition" do
    my_struct = Struct.new(:id, :fluff) do
      def ==(other)
        other.is_a?(self.class) && other.id == id
      end
    end

    it 'passes if the array ends with a struct equal to the provided struct' 


    it 'fails if the array ends with a struct not equal to the provided struct' 

  end

  context "with an object that does not respond to :[]" do
    it "fails with a useful message" 

  end

  context "with a hash" do
    it "fails with a useful error if trying to match more than one element" 

  end

  describe "composing with other matchers" do
    it 'passes if the start of an array matches two given matchers' 


    it 'passes if the start of an array matches one given matcher' 


    it 'provides a description' 


    it 'fails with a clear error message when the matchers do not match' 

  end
end

RSpec.describe "expect(...).not_to start_with" do
  context "with a string" do
    it "passes if it does not match the start of the actual string" 


    it "fails if it does match the start of the actual string" 

  end

  context "with an array" do
    it "passes if it is not the first element of the array" 


    it "passes if the first elements of the array do not match" 


    it "fails if it matches the first element of the array" 


    it "fails if it the first elements of the array match" 

  end

  context "with an array of strings" do
    it "fails if given the first element of the array" 


    it "fails if given the first n of the array" 


    it 'passes if given the wrong first element of the array' 

  end

  it 'can pass when composed with another matcher' 


  it 'can fail when composed with another matcher' 

end

RSpec.describe "expect(...).to end_with" do
  it_behaves_like "an RSpec matcher", :valid_value => "ab", :invalid_value => "bc" do
    let(:matcher) { end_with("b") }
  end

  context "with a string" do
    it "passes if it matches the end of the actual string" 


    it "fails if it does not match the end of the actual string" 

  end

  context "with an array" do
    it "passes if it is the last element of the array" 


    it "passes if the last elements of the array match" 


    it "fails if it does not match the last element of the array" 


    it "fails if it the last elements of the array do not match" 

  end

  context "with an array of strings" do
    it "passes if given the last element of the array" 


    it "passes if given the last n of the array" 


    it 'fails if given the wrong last element of the array' 

  end

  context "with an array of uncustomized structs" do
    struct = Struct.new(:foo)

    it 'passes if the array ends with a struct equal to the provided struct' 


    it 'fails if the array ends with a struct not equal to the provided struct' 

  end

  context "with an array of structs that have a custom `==` definition" do
    my_struct = Struct.new(:id, :fluff) do
      def ==(other)
        other.is_a?(self.class) && other.id == id
      end
    end

    it 'passes if the array ends with a struct equal to the provided struct' 


    it 'fails if the array ends with a struct not equal to the provided struct' 

  end

  context "with an object that does not respond to :[]" do
    it "fails with a useful message" 

  end

  context "with a hash" do
    it "raises an ArgumentError if trying to match more than one element" 

  end

  describe "composing with other matchers" do
    it 'passes if the end of an array matches two given matchers' 


    it 'passes if the end of an array matches one given matcher' 


    it 'provides a description' 


    it 'fails with a clear error message when the matchers do not match' 

  end
end

RSpec.describe "expect(...).not_to end_with" do
  context "with a sting" do
    it "passes if it does not match the end of the actual string" 


    it "fails if it matches the end of the actual string" 

  end

  context "an array" do
    it "passes if it is not the last element of the array" 


    it "passes if the last elements of the array do not match" 


    it "fails if it matches the last element of the array" 


    it "fails if it the last elements of the array match" 

  end

  context "with an array of strings" do
    it "fails if given the last element of the array" 


    it "fails if given the last n of the array" 


    it 'passes if given the wrong last element of the array' 

  end

  it 'can pass when composed with another matcher' 


  it 'can fail when composed with another matcher' 

end

