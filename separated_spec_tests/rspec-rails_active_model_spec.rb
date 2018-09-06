RSpec.describe "ActiveModel support" do
  around do |ex|
    old_value = RSpec::Mocks.configuration.verify_partial_doubles?
    ex.run
    RSpec::Mocks.configuration.verify_partial_doubles = old_value
  end

  RSpec.shared_examples_for "stubbing ActiveModel" do
    before do
      stub_const 'ActiveRecord' unless defined?(ActiveRecord)
    end

    it "allows you to stub `ActiveModel`" 


    it 'allows you to stub instances of `ActiveModel`' 

  end

  context "with partial double verification enabled" do
    before do
      RSpec::Mocks.configuration.verify_partial_doubles = true
    end

    include_examples "stubbing ActiveModel"
  end

  context "with partial double verification disabled" do
    before do
      RSpec::Mocks.configuration.verify_partial_doubles = false
    end

    include_examples "stubbing ActiveModel"
  end
end

