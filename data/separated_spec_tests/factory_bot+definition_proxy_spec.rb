describe FactoryBot::DefinitionProxy, "#add_attribute" do
  subject     { FactoryBot::Definition.new(:name) }
  let(:proxy) { FactoryBot::DefinitionProxy.new(subject) }

  it "declares a dynamic attribute on the factory" 

end

describe FactoryBot::DefinitionProxy, "#add_attribute when the proxy ignores attributes" do
  subject     { FactoryBot::Definition.new(:name) }
  let(:proxy) { FactoryBot::DefinitionProxy.new(subject, true) }

  it "declares a dynamic attribute on the factory" 

end

describe FactoryBot::DefinitionProxy, "#transient" do
  subject     { FactoryBot::Definition.new(:name) }
  let(:proxy) { FactoryBot::DefinitionProxy.new(subject) }

  it "makes all attributes added ignored" 

end

describe FactoryBot::DefinitionProxy, "#method_missing" do
  subject     { FactoryBot::Definition.new(:name) }
  let(:proxy) { FactoryBot::DefinitionProxy.new(subject) }

  context "when called without args or a block" do
    it "declares an implicit declaration" 

  end

  context "when called with a ':factory' key" do
    it "declares an association" 

  end

  context "when called with a block" do
    it "declares a dynamic attribute" 

  end

  context "when called with a static-attribute-like argument" do
    it "raises a NoMethodError" 

  end

  context "when called with a setter method" do
    it "raises a NoMethodError" 

  end
end

describe FactoryBot::DefinitionProxy, "#sequence" do
  before do
    allow(FactoryBot::Sequence).to receive(:new).and_call_original
  end

  def build_proxy(factory_name)
    definition = FactoryBot::Definition.new(factory_name)
    FactoryBot::DefinitionProxy.new(definition)
  end

  it "creates a new sequence starting at 1" 


  it "creates a new sequence with an overridden starting vaue" 


  it "creates a new sequence with a block" 

end

describe FactoryBot::DefinitionProxy, "#association" do
  it "declares an association" 


  it "declares an association with options" 


  context "when passing a block" do
    it "raises an error" 

  end
end

describe FactoryBot::DefinitionProxy, "adding callbacks" do
  subject        { FactoryBot::Definition.new(:name) }
  let(:proxy)    { FactoryBot::DefinitionProxy.new(subject) }
  let(:callback) { -> { "my awesome callback!" } }

  context "#after(:build)" do
    before { proxy.after(:build, &callback) }
    it     { should have_callback(:after_build).with_block(callback) }
  end

  context "#after(:create)" do
    before { proxy.after(:create, &callback) }
    it     { should have_callback(:after_create).with_block(callback) }
  end

  context "#after(:stub)" do
    before { proxy.after(:stub, &callback) }
    it     { should have_callback(:after_stub).with_block(callback) }
  end

  context "#after(:stub, :create)" do
    before { proxy.after(:stub, :create, &callback) }
    it     { should have_callback(:after_stub).with_block(callback) }
    it     { should have_callback(:after_create).with_block(callback) }
  end

  context "#before(:stub, :create)" do
    before { proxy.before(:stub, :create, &callback) }
    it     { should have_callback(:before_stub).with_block(callback) }
    it     { should have_callback(:before_create).with_block(callback) }
  end

  context "#callback(:after_stub, :before_create)" do
    before { proxy.callback(:after_stub, :before_create, &callback) }
    it     { should have_callback(:after_stub).with_block(callback) }
    it     { should have_callback(:before_create).with_block(callback) }
  end
end

describe FactoryBot::DefinitionProxy, "#to_create" do
  subject     { FactoryBot::Definition.new(:name) }
  let(:proxy) { FactoryBot::DefinitionProxy.new(subject) }

  it "accepts a block to run in place of #save!" 

end

describe FactoryBot::DefinitionProxy, "#factory" do
  subject     { FactoryBot::Definition.new(:name) }
  let(:proxy) { FactoryBot::DefinitionProxy.new(subject) }

  it "without options" 


  it "with options" 


  it "with a block" 

end

describe FactoryBot::DefinitionProxy, "#trait" do
  subject     { FactoryBot::Definition.new(:name) }
  let(:proxy) { FactoryBot::DefinitionProxy.new(subject) }

  it "declares a trait" 

end

describe FactoryBot::DefinitionProxy, "#initialize_with" do
  subject     { FactoryBot::Definition.new(:name) }
  let(:proxy) { FactoryBot::DefinitionProxy.new(subject) }

  it "defines the constructor on the definition" 

end

