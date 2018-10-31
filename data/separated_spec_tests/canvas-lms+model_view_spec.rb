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
require 'model_view'

describe ModelView do
  let(:text) do
    "Example\n{\n \"properties\": [],\n \"deprecated\": true,\n \"deprecation_description\": \"A description.\" }"
  end

  let(:model) { double('Model', :text => text) }

  describe '.new_from_model' do
    it "is created from model" 


    it 'parses the deprecated attribute' 


    it 'parses the deprecation description' 

  end

  it "generates a schema" 


  describe '#deprecated?' do
    let(:properties) do
      {
        "foo" => {
          "description" => "A description of the property.",
          "example" => "bar",
          "type" => "string"
        }
      }
    end

    it 'returns true if the model is deprecated' 


    it 'returns false if the model is not deprecated' 

  end
end

