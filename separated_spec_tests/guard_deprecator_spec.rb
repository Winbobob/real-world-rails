require "guard/compat/test/helper"
require "guard/rspec/deprecator"

RSpec.describe Guard::RSpec::Deprecator do
  let(:options) { {} }
  let(:deprecator) { Guard::RSpec::Deprecator.new(options) }

  describe "#warns_about_deprecated_options" do
    describe "handling of environment variable SPEC_OPTS" do
      it "shows warning if SPEC_OPTS is set" 

      it "does not show warning if SPEC_OPTS is unset" 

    end

    describe "with version option" do
      let(:options) { { version: 1 } }

      it "shows deprecation warning" 

    end

    describe "with exclude option" do
      let(:options) { { exclude: "**" } }

      it "shows deprecation warning" 

    end

    %w(color drb fail_fast formatter env bundler binstubs rvm cli
       spring turnip zeus foreman).each do |option|
      describe "with #{option} option" do
        let(:options) { { option.to_sym => 1 } }

        it "shows deprecation warning" 

      end
    end

    describe "with keep_failed option" do
      let(:options) { { keep_failed: true } }

      it "shows deprecation warning" 

    end

    describe "with focus_on_failed option" do
      let(:options) { { focus_on_failed: true } }

      it "shows deprecation warning" 

    end
  end
end

