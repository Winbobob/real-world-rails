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

describe Api::ContactsController do
  let!(:account) { Account.make }
  let!(:project) { Project.make account: account }
  let!(:contact) { project.contacts.make }

  before(:each) do
    sign_in account

    ContactAddress.make contact_id: contact.id

    @project_var = project.project_variables.make name: "var1"
    @contact_var = PersistedVariable.make project_variable_id: @project_var.id, contact_id: contact.id, value: "foo"

    @project_var2 = project.project_variables.make name: "var2"
  end

  it "gets all contacts" 


  it "gets contacts if user is admin but not owner" 


  it "gets contacts if user is admin but not owner" 


  it "gets contact by address" 


  it "updates a contact's var by address" 


  it "updates a contact's var (that didn't have a previous value) by address" 


  it "updates all contacts vars" 


  it "updates all contacts vars (when a var didn't have a previous value)" 


  it "creates a new contact with a single address" 


  it "creates a new contact with no variables given" 


  it "creates a new contact with a multiple addresses" 

end

