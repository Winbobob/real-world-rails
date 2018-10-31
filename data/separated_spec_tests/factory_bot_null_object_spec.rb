require "spec_helper"

describe FactoryBot::NullObject do
  let(:methods_to_respond_to)     { %w[id age name admin?] }
  let(:methods_to_not_respond_to) { %w[email date_of_birth title] }

  subject { FactoryBot::NullObject.new(methods_to_respond_to) }

  it "responds to the given methods" 


  it "does not respond to other methods" 

end

