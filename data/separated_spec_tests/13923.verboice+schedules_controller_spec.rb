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

describe SchedulesController do
  before(:each) do
    sign_in account
  end

  let!(:account) { Account.make }
  let!(:project) { Project.make account: account }
  let!(:schedule) { Schedule.make project: project }

  describe "GET index" do
    it "assigns all schedules as @schedules" 

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Schedule" 


      it "assigns a newly created schedule as @schedule" 


      it "renders 'box_content' template" 

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved schedule as @schedule" 


      it "re-renders the 'box_content' template" 

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested schedule" 


      it "assigns the requested schedule as @schedule" 


      it "renders 'box_content' template" 

    end

    describe "with invalid params" do
      it "assigns the schedule as @schedule" 


      it "re-renders the 'box_content' template" 

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested schedule" 


    it "redirects to the schedules list" 

  end
end
