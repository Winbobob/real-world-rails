require "rails_helper"

describe WebhooksController do
  before { $redis.flushall }

  let(:email) { "em@il.com" }
  let(:message_id) { "12345@il.com" }

  context "mailgun" do

    it "works" 


  end

  context "sendgrid" do

    it "works" 


  end

  context "mailjet" do

    it "works" 


  end

  context "mandrill" do

    it "works" 


  end

  context "sparkpost" do

    it "works" 


  end

end

