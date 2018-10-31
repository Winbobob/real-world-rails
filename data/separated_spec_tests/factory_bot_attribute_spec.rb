require 'spec_helper'

describe FactoryBot::Attribute do
  let(:name)  { "user" }
  subject     { FactoryBot::Attribute.new(name, false) }

  its(:name) { should eq name.to_sym }
  it { should_not be_association }

  it "raises an error when defining an attribute writer" 

end

