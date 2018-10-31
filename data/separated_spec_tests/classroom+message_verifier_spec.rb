# frozen_string_literal: true

require "rails_helper"

RSpec.describe MessageVerifier do
  context "#api_secret" do
    context "secret present in env" do
      it "returns the api secret" 

    end

    context "secret missing in env" do
      before do
        Rails.application.secrets.stub(:api_secret) { nil }
        MessageVerifier.instance_variable_set(:@api_secret, nil)
      end

      it "raises error about env file" 

    end
  end

  context "#encode" do
    before do
      Timecop.freeze
    end

    it "generates valid token with payload" 


    it "generates valid token which expires in 5 minutes" 


    it "generates valid token with passed in expiration" 


    after do
      Timecop.return
    end
  end

  context "#decode" do
    before do
      Timecop.freeze
    end

    it "extracts parameters from valid token" 


    it "returns nil for expired token" 


    it "returns nil for malformed token" 


    after do
      Timecop.return
    end
  end
end

