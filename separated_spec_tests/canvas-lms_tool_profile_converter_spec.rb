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

require File.expand_path(File.dirname(__FILE__) + '/../../../../import_helper')

describe CC::Importer::Canvas::ToolProfileConverter do
  let(:manifest) { ImportHelper.get_import_data_xml('unzipped', 'imsmanifest') }
  let(:path) { File.expand_path(File.dirname(__FILE__) + '/../../../../fixtures/importer/unzipped') }
  let(:converter) do
    Class.new do
      include CC::Importer::Canvas::ToolProfileConverter

      def initialize(manifest, path)
        @manifest = manifest
        @package_root = PackageRoot.new(path)
      end
    end.new(manifest, path)
  end

  describe '#convert_tool_profiles' do
    it 'unpacks tool profiles in the common cartridge' 

  end
end

