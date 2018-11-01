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

describe ResourcesController do
  before(:each) do
    @account = Account.make
    @project = @account.projects.make
    @other_project = Project.make
    sign_in @account
  end

  let!(:resource1) { Resource.make :project => @project, :name => 'foo' }
  let!(:resource2) { Resource.make :project => @project, :name => 'bar' }
  let!(:other_resource) { Resource.make :project => @other_project }

  describe "GET index" do
    it "assigns all project resources as @resources" 


    it "searches project resources" 


  end

  describe "GET show" do
    it "assigns resource as @resource" 


    it "fails if the requested resource is not in current project" 

  end

  describe "GET find" do
    it "finds resources by guid" 

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Resource" 


      it "assigns a newly created resource as @resource" 
      it "renders the newly created resources as json" 


      it "assigns the current project to the resource" 


      it "returns the correct amount of nested localized_resources" 

    end

    describe "with invalid params" do
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested resource" 


      it "assigns the requested resource as @resource" 


      it "renders the requested resources as json" 


      it "returns the correct amount of nested localized_resources" 


    end

    describe "with invalid params" do
    end
  end

end

