#
# Copyright (C) 2012 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe 'CommunicationChannels API', type: :request do
  describe 'index' do
    before :once do
      @someone = user_with_pseudonym
      @admin   = user_with_pseudonym

      Account.site_admin.account_users.create!(user: @admin)

      @path = "/api/v1/users/#{@someone.id}/communication_channels"
      @path_options = { :controller => 'communication_channels',
        :action => 'index', :format => 'json', :user_id => @someone.id.to_param }
    end

    context 'an authorized user' do
      it 'should list all channels without bounce information for a user that is not a site admin' 


      it 'should list all channels with bounce information for a user that is a site admin' 

    end

    context 'an unauthorized user' do
      it 'should return 401' 


      it "should not list channels for a teacher's students" 

    end
  end

  describe 'create' do
    before :once do
      @someone    = user_with_pseudonym
      @admin      = user_with_pseudonym
      @site_admin = user_with_pseudonym

      Account.site_admin.account_users.create!(user: @site_admin)
      Account.default.account_users.create!(user: @admin)

      @path = "/api/v1/users/#{@someone.id}/communication_channels"
      @path_options = { :controller => 'communication_channels',
        :action => 'create', :format => 'json',
        :user_id => @someone.id.to_param, }
      @post_params = { :communication_channel => {
        :address => 'new+api@example.com', :type => 'email' }}
    end

    it 'should be able to create new channels' 


    it "doesn't error if the user already has a login with the same e-mail address" 


    context 'a site admin' do
      before { @user = @site_admin }

      it 'should be able to auto-validate new channels' 

    end

    context 'an account admin' do
      before { @user = @admin }

      it 'should be able to create new channels for other users' 


      it 'should be able to create new channels for other users and auto confirm' 


    end

    context 'a user' do
      before { @user = @someone }

      it 'should be able to create its own channels' 


      it 'should not be able to create channels for others' 


      context 'push' do
        before { @post_params.merge!(communication_channel: {token: 'registration_token', type: 'push'}) }

        it 'should complain about sns not being configured' 


        it "should work" 


        it "shouldn't create two push channels regardless of case" 

      end
    end
  end

  describe 'destroy' do
    let_once(:someone) { user_with_pseudonym }
    let_once(:admin) do
      user = user_with_pseudonym
      Account.default.account_users.create!(user: user)
      user
    end
    let_once(:channel) { someone.communication_channel }
    let(:path) {"/api/v1/users/#{someone.id}/communication_channels/#{channel.id}"}
    let(:path_options) do
      { :controller => 'communication_channels',
        :action => 'destroy', :user_id => someone.to_param, :format => 'json',
        :id => channel.to_param }
    end

    context 'an admin' do
      before(:each) { @user = admin }

      it "should be able to delete others' channels" 

    end

    context 'a user' do
      before(:each) { @user = someone }

      it 'should be able to delete its own channels' 


      it "should 404 if already deleted" 


      it "should not be able to delete others' channels" 


      it "should be able to delete by path, instead of id" 


      it "should 404 if already deleted by path" 

    end
  end
end

