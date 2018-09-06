require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  context "always" do
    controller do
      def index
        render text: 'OK'
      end
    end

    it "sets additional metadata for sentry" 


    it "sets additional metadata for logstasher" 

  end

  context "when IP & key restriction is enabled" do
    controller do
      def index
        render text: 'OK'
      end
    end

    before :each do
      allow(Rails.configuration).to receive(:trusted_users_access_key).and_return('lulz')
      controller.class.permit_only_trusted_users
    end

    it "rejects untrusted IPs" 


    it "accepts trusted IPs" 


    it "accepts clients with a key" 

  end

  context "when IP restriction hook is enabled" do
    controller do
      def index
        render text: 'OK'
      end
    end

    before :each do
      controller.class.permit_only_trusted_users
    end

    it "rejects untrusted IPs" 


    it "accepts trusted IPs" 

  end

  context "when key restriction is enabled" do
    controller do
      def index
        render text: 'OK'
      end
    end

    before :each do
      controller.class.permit_only_trusted_users
      Rails.configuration.trusted_users_access_key = "VALID"
    end

    it "accepts clients with key" 


    it "rejects clients without key" 

  end

  context "when IP restriction hook is disabled" do
    controller do
      def index
        render text: 'OK'
      end
    end

    it "accepts all IPs" 

  end
end

