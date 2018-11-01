describe FactoryBot::Attribute::Association do
  let(:name)        { :author }
  let(:factory)     { :user }
  let(:overrides)   { { first_name: "John" } }
  let(:association) { double("association") }

  subject { FactoryBot::Attribute::Association.new(name, factory, overrides) }

  module MissingMethods
    def association(*args); end
  end

  before do
    # Define an '#association' instance method allowing it to be mocked.
    # Ususually this is determined via '#method_missing'
    subject.extend(MissingMethods)

    allow(subject).
      to receive(:association).with(any_args).and_return association
  end

  it         { should be_association }
  its(:name) { should eq name }

  it "builds the association when calling the proc" 


  it "builds the association when calling the proc" 

end

describe FactoryBot::Attribute::Association, "with a string name" do
  subject    { FactoryBot::Attribute::Association.new("name", :user, {}) }
  its(:name) { should eq :name }
end

