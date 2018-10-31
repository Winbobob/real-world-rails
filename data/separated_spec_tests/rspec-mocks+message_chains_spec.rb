RSpec.describe RSpec::Mocks::AnyInstance::MessageChains do
  let(:recorder) { double }
  let(:chains) { RSpec::Mocks::AnyInstance::MessageChains.new }
  let(:stub_chain) { RSpec::Mocks::AnyInstance::StubChain.new recorder }
  let(:expectation_chain) { RSpec::Mocks::AnyInstance::PositiveExpectationChain.new recorder }

  it "knows if a method does not have an expectation set on it" 


  it "knows if a method has an expectation set on it" 


  it "can remove all stub chains" 


  context "creating stub chains" do
    it "understands how to add a stub chain for a method" 


    it "allows multiple stub chains for a method" 

  end
end

