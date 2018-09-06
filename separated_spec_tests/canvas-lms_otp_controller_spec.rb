#
# Copyright (C) 2015 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require_relative '../../spec_helper'
require 'rotp'

describe Login::OtpController do
  describe '#new' do
    before :once do
      user_with_pseudonym(:active_all => 1, :password => 'qwertyuiop')
    end

    before do
      user_session(@user, @pseudonym)
    end

    context "verification" do
      before do
        session[:pending_otp] = true
      end

      it "should show enrollment for unenrolled, required user" 


      it "should ask for verification of enrolled, optional user" 


      it "should send otp to sms channel" 

    end

    context "enrollment" do
      it "should generate a secret key" 


      it "should generate a new secret key for re-enrollment" 

    end
  end

  describe "#create" do
    context "enrollment" do
      before :once do
        user_with_pseudonym
      end

      before do
        user_session(@user, @pseudonym)
        @secret_key = session[:pending_otp_secret_key] = ROTP::Base32.random_base32
      end

      it "should save the pending key" 


      it "should continue to the dashboard if part of the login flow" 


      it "should save a pending sms" 


      it "shouldn't fail if the sms is already active" 

    end

    context "verification" do
      before :once do
        Account.default.settings[:mfa_settings] = :required
        Account.default.save!

        user_with_pseudonym(:active_all => 1, :password => 'qwertyuiop')
      end

      before do
        @user.otp_secret_key = ROTP::Base32.random_base32
        @user.save!
        expect_any_instance_of(CommunicationChannel).to receive(:send_otp!).never
        user_session(@user, @pseudonym)
        session[:pending_otp] = true
      end

      it "should verify a code" 


      it "should verify a backup code" 


      it "should set a cookie" 


      it "should add the current ip to existing ips" 


      it "should fail for an incorrect token" 


      it "should allow 30 seconds of drift by default" 


      it "should allow 5 minutes of drift for SMS" 


      it "should not allow the same code to be used multiple times" 

    end
  end

  describe '#destroy' do
    before :once do
      Account.default.settings[:mfa_settings] = :optional
      Account.default.save!

      user_with_pseudonym(:active_all => 1, :password => 'qwertyuiop')
      @user.otp_secret_key = ROTP::Base32.random_base32
      @user.otp_communication_channel = @user.communication_channels.sms.create!(:path => 'bob')
      @user.generate_one_time_passwords
      @user.save!
    end

    before :each do
      user_session(@user)
    end

    it "should delete self" 


    it "should delete self as id" 


    it "should not be able to delete self if required" 


    it "should not be able to delete self as id if required" 


    it "should not be able to delete another user" 


    it "should be able to delete another user with permission" 


    it "should be able to delete another user with site_admin" 


    it "should not be able to delete another user from different account" 


    it "should be able to delete another user as admin" 

  end
end

