# frozen_string_literal: true
require 'spec_helper'

class MyTestDeliveryMethod
  attr_accessor :settings

  def initialize(values)
    self.settings = {}.merge!(values)
  end
end

describe Mail::Configuration do

  describe "network configurations" do

    it "defaults delivery_method to smtp" 


    it "should be available from the Mail.defaults method" 


    it "should configure sendmail" 


    it "should configure sendmail using a string" 


    it "should configure exim" 


    it "should configure an open SMTP connection" 


    it "should accept a plug-in delivery method" 


  end
end

