# Copyright 2014 Square Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe "#update" do
    before :each do
      @user  = FactoryGirl.create(:user)
      @attrs = {password: 'newpass', password_confirmation: 'newpass', first_name: 'NewFN', last_name: 'NewLN'}
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @user }

      it "should update the user and redirect to the account page" 


      it "should render the account page on failure" 


      it "should not update the password if it's not provided" 

    end
  end if Squash::Configuration.authentication.strategy == 'password'
end

