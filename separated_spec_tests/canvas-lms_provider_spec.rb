#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path('../../../spec_helper', File.dirname(__FILE__))
require_dependency "canvas/oauth/provider"

module Canvas::Oauth
  describe Provider do
    let(:provider) { Provider.new('123') }

    def stub_dev_key(key)
      allow(DeveloperKey).to receive(:where).and_return(double(first: key))
    end

    describe 'initialization' do
      it 'retains the client_id' 


      it 'defaults the redirect_uri to a blank string' 


      it 'can override the default redirect_uri' 


    end

    describe '#has_valid_key?' do

      it 'is true when there is a key and the key is active' 


      it 'is false when there is a key that is not active' 


      it 'is false when there is no key' 

    end

    describe '#client_id_is_valid?' do
      it 'is false for a nil id' 


      it 'is false for a non-integer' 


      it 'is true for an integer' 

    end

    describe '#has_valid_redirect?' do
      it 'is true when the redirect url is the OOB uri' 


      it 'is true when the redirect url is kosher for the developerKey' 


      it 'is false otherwise' 

    end

    describe '#icon_url' do
      it 'delegates to the key' 

    end

    describe '#key' do
      it 'is nil if there is no client id' 


      it 'delegates to the class level finder on DeveloperKey' 

    end

    describe 'authorized_token?' do
      let(:developer_key) {DeveloperKey.create!}
      let(:user) {User.create!}

      it 'finds a pre existing token with the same scope' 


      it 'ignores tokens unless access is remembered' 


      it 'ignores tokens for out of band requests ' 

    end

    describe '#app_name' do
      let(:key_attrs) { {:name => 'some app', :user_name => 'some user', :email => 'some email'} }
      let(:key) { double(key_attrs) }

      it 'prefers the key name' 


      it 'falls back to the user name' 


      it 'falls back to the email if there is nothing else' 


      it 'goes to the default app name if there are no pieces of data in the key' 

    end

    describe '#session_hash' do

      before { stub_dev_key(double(:id => 123)) }

      it 'uses the key id for a client id' 


      it 'passes the redirect_uri through' 


      it 'passes the scope through' 

    end
  end
end

