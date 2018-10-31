require "app/services/resolve_config_conflicts"
require "app/models/config_content"

describe ResolveConfigConflicts do
  describe "#call" do
    context "given a config with conflicting linters" do
      it "disables the first conflicted linter found" 

    end

    context "given a config with sass_lint enabled" do
      it "disables default sass linter" 

    end

    context "given nil config options" do
      it "raises Config::ParserError" 

    end
  end
end

