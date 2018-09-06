RSpec.describe "a double declaration with a block handed to:" do
  describe "expect(...).to receive" do
    it "returns the value of executing the block" 


    it "works when a multi-return stub has already been set" 

  end

  describe "allow(...).to receive" do
    it "returns the value of executing the block" 


    # The "receives a block" part is important: 1.8.7 has a bug that reports the
    # wrong arity when a block receives a block.
    it 'forwards all given args to the block, even when it receives a block' 

  end

  describe "with" do
    it "returns the value of executing the block" 


    it "returns the value of executing the block with given argument" 

  end

  %w[once twice].each do |method|
    describe method do
      it "returns the value of executing the block" 

    end
  end

  describe 'ordered' do
    it "returns the value of executing the block" 

  end

  describe "times" do
    it "returns the value of executing the block" 

  end
end

