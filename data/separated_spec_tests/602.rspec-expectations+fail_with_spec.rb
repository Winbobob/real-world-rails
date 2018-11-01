# encoding: utf-8

RSpec.describe RSpec::Expectations, "#fail_with" do
  let(:differ) { double("differ") }

  before(:example) do
    allow(RSpec::Matchers.configuration).to receive_messages(:color? => false)
    allow(RSpec::Expectations).to receive(:differ) { differ }
  end

  it "includes a diff if expected and actual are diffable" 


  it "does not include the diff if expected and actual are not diffable" 


  it "raises an error if message is not present" 

end

RSpec.describe RSpec::Expectations, "#fail_with with matchers" do
  before do
    allow(RSpec::Matchers.configuration).to receive_messages(:color? => false)
  end

  it "uses matcher descriptions in place of matchers in diffs" 

end

RSpec.describe RSpec::Expectations, "#fail_with with --color" do
  before do
    allow(RSpec::Matchers.configuration).to receive_messages(:color? => true)
  end

  it "tells the differ to use color" 

end

