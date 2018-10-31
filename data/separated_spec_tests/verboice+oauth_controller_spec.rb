# Copyright (C) 2010-2012, InSTEDD
#
# This file is part of Verboice.
#
# Verboice is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Verboice is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Verboice.  If not, see <http://www.gnu.org/licenses/>.

require 'spec_helper'

describe OauthController do
  before(:each) do
    @account = Account.make
    sign_in @account
  end

  describe "on google callback" do

    let!(:mock_auth_strategy) do
      double('auth_strategy')
    end

    let!(:mock_client) do
      double('oauth2_google_client').tap do |mock_client|
        expect(OAuth2::Client).to receive(:google).and_return(mock_client)
        allow(mock_client).to receive(:auth_code).and_return(mock_auth_strategy)
      end
    end

    describe "successful" do

      let(:mock_token) do
        double('token', :token => "ACCESS", :refresh_token => "REFRESH", :expires_in => '3600')
      end

      before(:each) do
        Timecop.freeze(DateTime.new(2011,1,1,8,0,0))
        expect(mock_auth_strategy).to receive(:get_token).with("SAMPLECODE", anything).and_return(mock_token)
      end

      after(:each) do
        Timecop.return
      end

      it "should create oauth token" 


      it "should update existing oauth token" 



    end

  end


end

