#
# Copyright (C) 2017 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe Canvas::Migration::MigratorHelper do
  subject do
    Class.new do
      include Canvas::Migration::MigratorHelper
      attr_accessor :course
    end
  end

  describe "#overview" do
    context "tool profiles" do
      let(:course) do
        {
          tool_profiles: [
            {
              'tool_profile' => {
                'product_instance' => {
                  'product_info' => {
                    'product_name' => {
                      'default_value' => 'Test Tool'
                    }
                  }
                }
              },
              'migration_id' => 'm_id'
            }
          ]
        }
      end

      it 'returns nothing if there are no tool_profiles' 


      it 'returns a tool profile overview if there is a tool_profile' 


      it 'returns nothing if the tool_profile data is misconfigured' 

    end
  end
end

