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

RSpec.describe SessionsController, type: :controller do
  before(:all) do
    attrs = Squash::Configuration.authentication.strategy == 'password' ? {password: 'password123'} : {}
    @user = FactoryGirl.create(:user, attrs)
  end

  describe "#create" do
    before :each do
      if defined?(Net::LDAP)
        @ldap = double('Net::LDAP', :host= => nil, :port= => nil, :auth => nil)
        allow(Net::LDAP).to receive(:new).and_return(@ldap)
      end
    end

    context '[valid credentials]' do
      before :each do
        allow(@ldap).to receive(:bind).and_return(true)
        allow(@ldap).to receive :encryption

        entry = OpenStruct.new(:givenname => %w(Sancho), :sn => %w(Sample), :dn => 'some dn')
        allow(@ldap).to receive(:search).and_yield(entry)
      end if defined?(Net::LDAP)

      it "should log in a valid username and password" 


      it "should create users that don't exist" 


      it "should redirect a user to :next if in the params" 


      it "should use LDAP when creating a user" 

    end

    it "should not log in an invalid username and password" 


    # these two are really applicable to LDAP moreso than password auth
    it "should not allow a blank password" 


    it "should not allow a blank username" 

  end

  describe "#destroy" do
    before(:each) { login_as FactoryGirl.create(:user) }
    it "should log out a user" 

  end
end

