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

describe ContactsController do
  before(:each) do
    @account = Account.make
    @project = @account.projects.make
    @other_project = Project.make
    sign_in @account
  end

  let!(:contact) { Contact.make :project => @project }
  let!(:other_contact) { Contact.make :project => @other_project }

  describe "GET index" do
    it "assigns all project contacts as @contacts" 

  end

  describe "GET index CSV" do
    let!(:project_csv) { @account.projects.make }

    let!(:project_variable) { project_csv.project_variables.make name: 'ProjectVar' }

    let!(:call_flow) { project_csv.call_flows.make name: "Callflow 1" }

    let!(:channel) { Channels::Custom.make call_flow: call_flow, name: "Channel 1" }

    let!(:contact1) { Contact.make :project => project_csv, addresses_attributes: [{address: '1234'}, {address: '5678'}] }

    let!(:contact2) { Contact.make :project => project_csv, addresses_attributes: [{address: '0123'}] }

    let!(:contact1_lang) { contact1.persisted_variables.make implicit_key: 'language', value: 'es' }

    let!(:contact2_var) { contact2.persisted_variables.make project_variable: project_variable, value: 'vartest' }

    def called(address, date, options)
      Timecop.freeze date
      call_flow.call_logs.make account_id: project_csv.account_id, project_id: project_csv.id, address: address, state: options[:state] ? options[:state] : :failed, channel: channel
      Timecop.return
    end

    it "renders as CSV" 

  end

  describe "GET new" do
    it "assigns a new contact as @contact" 

  end

  describe "GET edit" do
    it "assigns the requested contact as @contact" 


    it "fails if the requested contact is not in current project" 

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Contact" 


      it "assigns a newly created contact as @contact" 


      it "redirects to index" 


      it "assigns the current project to the contact" 

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contact as @contact" 


      it "re-renders the 'new' template" 

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested contact" 


      it "assigns the requested contact as @contact" 


      it "redirects to index" 

    end

    describe "with invalid params" do
      it "assigns the contact as @contact" 


      it "re-renders the 'edit' template" 

    end

    it "fails if the requested contact is not in current project" 

  end

  describe "DELETE destroy" do
    it "destroys the requested contact" 


    it "redirects to the contacts list" 


    it "fails if the requested contact is not in current project" 

  end

  describe "with shared project" do
    before(:each) do
      Permission.create!(account_id: @account.id, type: "Project", model_id: @other_project.id, role: :admin)
    end

    it "can view contacts" 


    it "edit contact" 


    it "destroy the requested contact from shared project" 

  end

end

