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
require 'json-schema'

describe Api::FlowResults::PackagesController do
  include Devise::TestHelpers

  let!(:account) { Account.make }
  let!(:project) { Project.make account: account }

  before(:each) do
    sign_in account
  end

  def assert_json_api_compliance(json)
    schema = File.join(Rails.root, 'spec/fixtures/json_api_schema.json')
    JSON::Validator.validate!(schema, json)
  end

  def assert_json_api_not_found_error(response)
    expect(response).to be_not_found
    json = JSON.parse response.body
    assert_json_api_compliance(json)
  end

  describe("list data packages for a call flow") do
    describe("happy path") do
      let!(:call_flow) { project.call_flows.make :name => "Flow", :mode => :flow }

      it "gets data packages for a call flow" 

    end

    describe("error modes") do
      it "returns 404 when callflow does not belong to project" 


      it "returns 404 when callflow works in callback mode" 


      it "returns 404 when project does not exist" 


      it "returns 404 when call flow does not exist" 


      it "returns 404 when user cannot read project" 

    end
  end

  describe("descriptor") do
    it "returns a valid descriptor wrapped in a valid jsonapi envelope" 


    it "returns 404 when requested package is not current call flow package" 


    it "returns 404 when user cannot read project" 

  end

  describe("responses") do
    it "has a happy path" 

  end
end

