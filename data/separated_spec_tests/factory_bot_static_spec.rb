require 'spec_helper'

describe FactoryBot::Attribute::Static do
  let(:name)  { :first_name }
  let(:value) { "John" }

  subject { FactoryBot::Attribute::Static.new(name, value, false) }

  its(:name) { should eq name }

  it "returns the value when executing the proc" 

end

describe FactoryBot::Attribute::Static, "with a string name" do
  subject    { FactoryBot::Attribute::Static.new("name", nil, false) }
  its(:name) { should eq :name }
end

