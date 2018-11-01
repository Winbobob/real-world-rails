require 'rspec/support/spec/in_sub_process'
main = self

RSpec.describe "Loading rspec/mocks/standalone" do
  include RSpec::Support::InSubProcess

  it "exposes the RSpec::Mocks API on `main`" 


  it "does not infect other objects with the RSpec::Mocks API" 

end

