describe FactoryBot::Registry do
  let(:registered_object)        { double("registered object") }
  let(:second_registered_object) { double("second registered object") }

  subject { FactoryBot::Registry.new("Great thing") }

  it { should be_kind_of(Enumerable) }

  it "finds a registered object" 


  it "finds a registered object with square brackets" 


  it "raises when an object cannot be found" 


  it "adds and returns the object registered" 


  it "knows that an object is registered by symbol" 


  it "knows that an object is registered by string" 


  it "knows when an object is not registered" 


  it "iterates registered objects" 


  it "does not include duplicate objects with registered under different names" 


  it "clears registered factories" 

end

