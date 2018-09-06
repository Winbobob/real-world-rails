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

describe ExternalServicesController do
  before(:each) do
    sign_in account
  end

  let!(:account) { Account.make }
  let!(:project) { Project.make account: account }
  let!(:external_service) { ExternalService.make project: project }
  let!(:other_external_service) { ExternalService.make }
  let(:errors) { double('errors', :full_messages => [], :empty? => false, :any? => false, :[] => {}) }

  describe "GET index" do
    it "assigns all project external_services as external_services" 

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ExternalService" 


      it "assigns a newly created external_service as external_service" 


      it "assigns the project to the created external_service" 

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved external_service as @external_service" 


      it "re-renders the 'index' template" 

    end

    it "fails if the requested external_service is not in current account projects" 

  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested external_service" 


      it "assigns the requested external_service as @external_service" 

    end

    describe "with invalid params" do
      it "assigns the external_service as @external_service" 


      it "re-renders the 'index' template" 

    end

    it "fails if the requested external_service is not in current account projects" 

  end

  describe "DELETE destroy" do
    it "destroys the requested external_service" 


    it "fails if the requested external_service is not in current account projects" 


    it "cleans external_service call flows before destroy" 

  end

  describe "PUT update_manifest" do
    before(:each) do
      allow_any_instance_of(ExternalService).to receive(:update_manifest!)
    end

    it "updates the manifest of the requested external_service" 



     it "fails if the requested external_service is not in current account projects" 
      it "should create oauth token" 


      it "should update existing oauth token" 



    end

  end


end

