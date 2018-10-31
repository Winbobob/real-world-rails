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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'lib/package_root'

describe PackageRoot do
  let(:root_path) { File.expand_path(File.join(File.dirname(__FILE__), '../fixtures/importer/unzipped')) }
  let(:subject) { PackageRoot.new(root_path) }

  it "returns the root_path" 


  it "returns the name of an item inside" 


  it "follows .. paths" 


  it "refuses to follow .. paths above the package root" 


  it "makes relative paths" 


  it "enumerates contents" 

end

