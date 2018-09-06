require "spec_helper"

describe "Backend environments", reset: false do

  context "Setting cmr_env to 'prod'" do
    before :all do
      load_page :search, env: :prod, q: 'C179003030-ORNL_DAAC'
      wait_for_xhr
    end

    it "displays collections from PROD" 

  end

  context "Setting cmr_env to 'uat'" do
    before :all do
      load_page :search, env: :uat, q: 'C1000000141-ORNL_DAAC'
      wait_for_xhr
    end

    it "displays collections from UAT" 

  end

  context "Setting cmr_env to 'sit'" do
    before :all do
      load_page :search, env: :sit, q: 'C1000000257-DEV07'
      wait_for_xhr
    end

    it "displays collections from SIT" 

  end

  context "Without specifying cmr_env query param" do
    before :all do
      load_page :search, q: 'C179003030-ORNL_DAAC'
      wait_for_xhr
    end

    it "displays collections from the default environment" 

  end

  context "Setting cmr_env value to an invalid value" do
    before :all do
      load_page :search, env: 'invalid', q: 'C179003030-ORNL_DAAC'
      wait_for_xhr
    end

    it "displays collections from the default environment" 

  end
end

