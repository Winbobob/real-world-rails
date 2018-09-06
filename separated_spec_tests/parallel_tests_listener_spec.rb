require 'parallel_tests/gherkin/listener'

describe ParallelTests::Gherkin::Listener do
  describe :collect do
    before(:each) do
      @listener = ParallelTests::Gherkin::Listener.new
      @listener.uri("feature_file")
    end

    it "returns steps count" 


    it "counts background steps separately" 


    it "counts scenario outlines steps separately" 


    it 'counts scenarios that should not be ignored' 


    it 'does not count scenarios that should be ignored' 


    it 'counts outlines that should not be ignored' 


    it 'does not count outlines that should be ignored' 


  end
end

