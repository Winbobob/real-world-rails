describe FactoryBot::Strategy::AttributesFor do
  let(:result)     { { name: "John Doe", gender: "Male", admin: false } }
  let(:evaluation) { double("evaluation", hash: result) }

  it_should_behave_like "strategy without association support"

  it "returns the hash from the evaluation" 


  it "does not run the to_create block" 

end

