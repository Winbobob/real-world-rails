require 'spec_helper'

describe ContactCongressMailer do
  before(:each) do
    @emails = ActionMailer::Base.deliveries
    @emails.clear
  end

  describe 'reply_received_email' do
    it "sends an email" 

  end
end

