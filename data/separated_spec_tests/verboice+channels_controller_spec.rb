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

describe Api::ChannelsController do
  before(:each) do
    @account = Account.make
    sign_in @account
  end

  let(:project) { @account.projects.make }
  let(:call_flow) { CallFlow.make project: project }

  describe "get" do
    it "should return not found for non existing channel" 


    it "should return channel" 


    it "should return not found for non existing channel by id" 


    it "should return from id" 


    it "should return shared channel from id" 

  end

  describe "list" do
    it "should return all channels" 

  end

  describe "all" do
    it "should return all channels" 


    it "should include shared channels" 

  end

  describe "create" do
    it "create custom channel" 


    it "create a custom sip channel" 


    it "create custom channel errors" 

  end

  describe "update" do
    it "should return not found for non existing channel" 


    it "should update channel" 


    it "should tell erros" 

  end

  describe "delete" do
    it "should return not found for non existing channel" 


    it "delete channel" 

  end

  describe "enable" do
    it "should return not found for non existing channel" 


    it "enables a channel" 

  end

  describe "disable" do
    it "should return not found for non existing channel" 


    it "disables a channel" 

  end
end

