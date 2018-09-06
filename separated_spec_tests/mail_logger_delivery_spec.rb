# encoding: utf-8
require 'spec_helper'
require 'logger'
require 'stringio'

describe "Logger Delivery Method" do
  before(:each) do
    # Reset all defaults back to original state
    Mail.defaults do
      delivery_method :smtp,
        :address              => "localhost",
        :port                 => 25,
        :domain               => 'localhost.localdomain',
        :user_name            => nil,
        :password             => nil,
        :authentication       => nil,
        :enable_starttls_auto => true
    end
  end

  let(:mail) do
    Mail.new do
      from    'dschrute@dm.com'
      to      'mscarn@dm.com'
      subject 'Beet Bandit'
    end
  end

  it "sends an email to $stdout with 'info' severity by default" 


  it "can be configured with a custom logger and severity" 


  describe "sender and recipient validation" do
    it "should not raise errors if no sender is defined" 


    it "should raise an error if no recipient if defined" 

  end
end

