# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "Mail::TestMailer" do
  before(:each) do
    # Reset all defaults back to original state
    Mail.defaults do
      delivery_method :smtp, { :address              => "localhost",
                               :port                 => 25,
                               :domain               => 'localhost.localdomain',
                               :user_name            => nil,
                               :password             => nil,
                               :authentication       => nil,
                               :enable_starttls_auto => true  }
      Mail::TestMailer.deliveries.clear
    end
  end

  it "should have no deliveries when first initiated" 


  it "should deliver an email to the Mail::TestMailer.deliveries array" 


  it "should clear the deliveries when told to" 


  it "should not raise errors if no sender is defined" 


  it "should raise an error if no recipient if defined" 


  it "should save settings passed to initialize" 

end

