#
# Copyright (C) 2013 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/swagger_helper')
require 'argument_view'

describe ArgumentView do
  context "type splitter" do
    let(:view) { ArgumentView.new "arg [String]" }

    it "accepts no type" 


    it "parses type with no desc" 


    it "parses type and desc" 


    it "parses complex types" 

  end

  context "line parser" do
    let(:view) { ArgumentView.new "arg [String]" }

    it "raises on missing param name" 


    it "parses without desc" 


    it "parses without type or desc" 

  end

  context "with types, enums, description" do
    let(:view) { ArgumentView.new %{arg [Optional, String, "val1"|"val2"] argument} }

    it "has enums" 


    it "has types" 


    it "has a description" 

  end

  context "with optional arg" do
    let(:view) { ArgumentView.new %{arg [String]} }

    it "is optional" 

  end

  context "with required arg" do
    let(:view) { ArgumentView.new %{arg [Required, String]} }

    it "is required" 

  end
end

