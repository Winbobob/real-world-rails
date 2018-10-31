require "rails_helper"

describe ActivationsController, "#create" do
  context "when activation succeeds" do
    it "returns successful response" 

  end

  context "when activation fails" do
    context "due to 403 Forbidden from GitHub" do
      it "returns error response" 

    end

    it "tracks failed activation" 

  end

  context "when repo is not public" do
    it "does not activate" 

  end
end

