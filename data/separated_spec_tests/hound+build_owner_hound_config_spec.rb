require "rails_helper"

describe BuildOwnerHoundConfig do
  describe "#call" do
    context "when the owner has a configuration set" do
      it "returns the owner's config merged with the default HoundConfig" 

    end

    context "when the owner does not have a configuration set" do
      it "returns the default HoundConfig" 

    end

    context "when the owner's configuration is unreachable" do
      it "returns the default HoundConfig" 

    end

    context "when the owner's configuration is improperly formatted" do
      it "returns the default HoundConfig" 

    end
  end

  def default_hound_config
    HoundConfig.new(commit: EmptyCommit.new, owner: MissingOwner.new).content
  end
end

