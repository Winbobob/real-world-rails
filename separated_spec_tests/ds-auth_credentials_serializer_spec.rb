require "rails_helper"

RSpec.describe CredentialsSerializer do
  describe "#as_json" do
    subject { CredentialsSerializer.new user: double("User"), application: double("Application") }

    it "calls serialize" 

  end

  describe "#serialize" do
    let!(:application) { create :doorkeeper_application, name: "test app", available_roles: %w(beastmaster) }

    it "serializes the credentials for the passed in user" 

  end
end

