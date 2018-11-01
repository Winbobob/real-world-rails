require "spec_helper"

describe Heaven::Provider::DefaultProvider do
  include FixtureHelper

  let(:valid_git_ref) { Heaven::Provider::DefaultProvider::VALID_GIT_REF }

  describe "::VALID_GIT_REF" do
    it "matches master" 

    it "matches dev/feature" 

    it "matches short sha"  do
      expect(SecureRandom.hex(4).first(7)).to match(valid_git_ref)
    end
    it "matches full sha" 

    it "matches branch with dashes and underscore" 

    it "matches name with single dot" 


    it "does not allow dot after slash" 

    it "does not allow space" 

    it "does not allow two consecutive dots" 

    it "does not allow trailing /" 

    it "does not allow trailing ." 

    it "does not allow trailing .lock" 

    it "does not allow @{" 

    it "does not allow \\" 

  end

  context "production environment" do
    let(:data) { decoded_fixture_data("deployment") }
    let!(:deployment) { Heaven::Provider::DefaultProvider.new(SecureRandom.uuid, data) }

    it "returns production" 


    it "returns environment_url" 

  end

  context "staging environment" do
    let(:data) { decoded_fixture_data("deployment_staging") }
    let!(:deployment) { Heaven::Provider::DefaultProvider.new(SecureRandom.uuid, data) }

    it "returns staging" 


    it "returns environment_url" 

  end
end

