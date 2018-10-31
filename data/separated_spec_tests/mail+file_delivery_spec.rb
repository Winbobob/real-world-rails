# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "SMTP Delivery Method" do

  before(:each) do
    # Reset all defaults back to an original state
    Mail.defaults do
      delivery_method :smtp, { :address              => "localhost",
                               :port                 => 25,
                               :domain               => 'localhost.localdomain',
                               :user_name            => nil,
                               :password             => nil,
                               :authentication       => nil,
                               :enable_starttls_auto => true  }
    end
  end

  after(:each) do
    files = Dir.glob(File.join(Mail.delivery_method.settings[:location], '*'))
    files.each do |file|
      File.delete(file)
    end
  end

  describe "general usage" do
    tmpdir = File.expand_path('../../../../tmp/mail', __FILE__)

    it "should send an email to a file" 


    it "should send multiple emails to multiple files" 


    it "should only create files based on the addr_spec of the destination" 


    it "should use the base name of the file name to prevent file system traversal" 


    it "should not raise errors if no sender is defined" 


    it "should raise an error if no recipient if defined" 

  end
end

