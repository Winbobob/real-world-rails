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

describe LocalizedResourcesController do
  before(:each) do
    @account = Account.make
    @project = @account.projects.make
    @resource = @project.resources.make

    sign_in @account
  end

  describe "recording" do

    before(:each) do
      @localized_resource = RecordLocalizedResource.make :resource => @resource
    end

    describe "POST save_recording" do

      it "should save recording" 


      it "should succeed" 


    end

    describe "GET play_recording" do

      it "should return audio" 


    end

  end

  describe "file" do

    before(:each) do
      @localized_resource = UploadLocalizedResource.make :resource => @resource
    end

    describe "POST save_file" do

      it "should save file" 


      it "should save filename" 


      it "should succeed" 


    end

    describe "GET play_file" do

      it "should return file" 


    end
  end

end

