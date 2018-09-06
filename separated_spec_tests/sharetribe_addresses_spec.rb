require "spec_helper"

require_relative "api.rb"

describe EmailService::API::Addresses do

  AddressStore = EmailService::Store::Address

  let(:addresses_wo_ses) do
    EmailService::API::Addresses.new(
      default_sender: "Default Sender Name <default_sender@example.com.invalid>",
      ses_client: nil)
  end

  let(:ses_client) do
    EmailService::SES::Client.new(
      config: {
        region: "fake-region",
        access_key_id: "access_key",
        secret_access_key: "secret_access_key",
        sns_topic: "fake-sns-topic-arn"},
      stubs: true)
  end

  let(:addresses_with_ses) do
    EmailService::API::Addresses.new(
      default_sender: "Default Sender Name <default_sender@example.com.invalid>",
      ses_client: ses_client)
  end

  let(:now) { Time.zone.local(2015, 8, 7) }

  before(:each) do
    SyncDelayedJobObserver.reset!
  end

  after(:each) do
    SyncDelayedJobObserver.reset!
  end

  describe "#get_sender" do
    context "user defined sender address" do

      it "gets sender address by community id" 


      it "gets the last verified sender address" 


      it "allows nil name" 


      it "returns SMTP formatted address, with quotes and special characters properly escaped" 


    end

    context "default sender address" do

      it "returns default address user defined address is not set" 


      it "returns default address if community id is nil" 


      it "returns default address when user defined not yet verified" 

    end
  end

  describe "#get_user_defined" do

    context "success" do
      it "returns unique user defined address by community id and email" 


      it "returns always the latest email" 

    end

    context "error" do
      it "returns error if none found" 

    end
  end

  describe "#create" do
    context "no ses client configured" do
      it "Creates addresses in :verified status" 


      it "Lower-cases the email address" 

    end

    context "ses client configured" do

      it "Creates addresses in :none status" 


      it "enqueues a verification request" 


      it "fails for disallowed email providers" 


    end

    it "returns error result if email is malformatted" 

  end

  describe "#enqueue_status_sync" do
    it "enqueues a status sync for the given address" 


    it "does nothing if no ses client defined" 

  end

  describe "#enqueue verification request" do
    it "enqueues a fresh verification request for the given address" 


    it "does nothing when no ses client defined" 

  end

  describe "#enqueue_batch_sync" do
    it "enqueues a batch sync" 


    it "does nothing when no ses client defined" 

  end
end

