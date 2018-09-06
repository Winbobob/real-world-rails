require "spec_helper"

describe Heaven::Provider::Dpl do
  include FixtureHelper

  context "production environment" do
    let(:data) { decoded_fixture_data("deployment") }
    let!(:deployment) { Heaven::Provider::Dpl.new(SecureRandom.uuid, data) }

    it "returns production" 


    it "returns heroku_name" 

  end

  context "staging environment" do
    let(:data) { decoded_fixture_data("deployment_staging") }
    let!(:deployment) { Heaven::Provider::Dpl.new(SecureRandom.uuid, data) }

    it "returns staging" 


    it "returns heroku_staging_name" 

  end
end

