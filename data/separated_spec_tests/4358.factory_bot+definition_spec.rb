describe FactoryBot::Definition do
  subject { described_class.new(:name) }

  it { should delegate(:declare_attribute).to(:declarations) }

  describe "with a name" do
    it "creates a new attribute list with the name passed" 

  end

  describe "#name" do
    it "returns the name" 

  end

  describe "#overridable" do
    let(:list) { double("declaration list", overridable: true) }
    before do
      allow(FactoryBot::DeclarationList).to receive(:new).and_return list
    end

    it "sets the declaration list as overridable" 

  end

  describe "defining traits" do
    let(:trait_1) { double("trait") }
    let(:trait_2) { double("trait") }

    it "maintains a list of traits" 


    it "adds only unique traits" 

  end

  describe "adding callbacks" do
    let(:callback_1) { "callback1" }
    let(:callback_2) { "callback2" }

    it "maintains a list of callbacks" 

  end

  describe "#to_create" do
    its(:to_create) { should be_nil }

    it "returns the assigned value when given a block" 

  end
end

