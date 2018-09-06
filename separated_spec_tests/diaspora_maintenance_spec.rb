# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe Maintenance, :type => :mailer do
  describe 'create warning' do
    before do
      @removal_timestamp = Time.now + 3.days
      @user = FactoryGirl.create(:user_with_aspect, :username => "local", :remove_after => @removal_timestamp)
    end

    it "#should deliver successfully" 


    it "#should be added to the delivery queue" 


    it "#should include correct recipient" 


    it "#should include after inactivity days from settings" 


    it "#should include timestamp for account removal" 

  end
end

