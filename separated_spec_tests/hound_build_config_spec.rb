require "spec_helper"
require "app/models/config/base"
require "app/models/config/rubocop"
require "app/models/config/unsupported"
require "app/models/missing_owner"
require "app/services/build_config"

describe BuildConfig do
  describe ".call" do
    context "when there is matching config class for the given name" do
      it "returns the matching config" 

    end

    context "when there is not matching config class for the given name" do
      it "returns the unsupported config" 

    end
  end
end

