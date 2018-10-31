require 'rails_helper'

RSpec.describe "Fixture warnings" do
  def generate_fixture_example_group(hook_type)
    RSpec.describe do
      include RSpec::Rails::RailsExampleGroup
      fixtures :things

      before(hook_type) do
        things :a
      end

      it "" 

    end
  end

  it "Warns when a fixture call is made in a before :context call" 


  it "Does not warn when a fixture call is made in a before :each call" 


end

RSpec.describe "Global fixture warnings" do
  def generate_fixture_example_group(hook_type)
    RSpec.describe do
      include RSpec::Rails::RailsExampleGroup

      before(hook_type) do
        things :a
      end

      it "" 

    end
  end
  around do |ex|
    RSpec.configuration.global_fixtures = [:things]
    ex.call
    RSpec.configuration.global_fixtures = []
  end

  it "warns when a global fixture call is made in a before :context call" 


  it "does not warn when a global fixture call is made in a before :each call" 

end

