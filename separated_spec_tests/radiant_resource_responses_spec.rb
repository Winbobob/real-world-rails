describe "Radiant::ResourceResponses" do
  before :each do
    @klass = Class.new(ApplicationController)
    @klass.extend Radiant::ResourceResponses
  end
  
  describe "extending the controller" do
    it "should add the responses method" 

    
    it "should return a response collector" 

    
    it "should yield the collector to the passed block" 

    
    it "should add a response_for instance method" 

    
    it "should add a wrap instance method" 

    
    it "should duplicate on inheritance" 

  end
  
  describe "responding to configured formats" do
    before :each do
      @default = lambda { render text: "Hello, world!" }
      @klass.responses do |r|
        r.plural.default(&@default)
      end
      @responder = double('responder')
      @instance = @klass.new
      allow(@instance).to receive(:respond_to).and_yield(@responder)
    end

    describe "when wrapping a block" do
      it "should evaluate the block in the context of the controller" 

    end
    
    it "should apply the default block to the :any format" 

    
    it "should apply the publish block to the published formats before the default format" 

    
    it "should apply custom formats before the published and default formats" 

    
    it "should apply the :any format when the default block is blank" 

    
    it "should apply a custom format when no block is given" 

  end
end

describe Radiant::ResourceResponses::Collector do
  before :each do
    @collector = Radiant::ResourceResponses::Collector.new
  end
  
  it "should provide a Response object as the default property" 

  
  it "should be duplicable" 

  
  it "should duplicate its elements when duplicating" 

end

describe Radiant::ResourceResponses::Response do
  before :each do
    @response = Radiant::ResourceResponses::Response.new
  end
  
  it "should duplicate its elements when duplicating" 


  it "should accept a default response block" 


  it "should accept a format symbol and block to publish" 

  
  it "should require a publish block if one is not already assigned" 

  
  it "should accept multiple formats to publish" 

  
  it "should add a new format to publish" 

  
  it "should accept an arbitrary format block" 


  it "should accept an arbitrary format without a block" 

  
  describe "prepared with some formats" do
    before :each do
      @responder = double("responder")
      @pblock = lambda { 'foo' }
      @response.publish(:xml, :json, &@pblock)
      @iblock = lambda { 'iphone' }
      @popblock = lambda { 'popup' }
      @response.iphone(&@iblock)
      @response.popup(&@popblock)
    end
    
    it "should iterate over the publish formats" 


    it "should iterate over the regular formats" 

  end
end

