require "rails_helper"

RSpec.describe RegexPresenceValidator do
  subject { described_class.new(regex: 'latest', regex_error: 'site_settings.errors.must_include_latest') }

  describe "#valid_value?" do
    describe "when value is present" do
      it "without regex match" 


      it "with regex match" 

    end

    describe "when value is empty" do
      it "should not be valid" 

    end
  end
end

