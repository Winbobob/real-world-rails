#
# Copyright (C) 2014 - present Instructure, Inc.
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
require 'db/migrate/20141217222534_cleanup_duplicate_external_feeds'

describe 'CleanupDuplicateExternalFeeds' do
  before do
    @migration = CleanupDuplicateExternalFeeds.new
    @migration.down
  end

  around do |example|
    begin
      ActiveRecord::Base.in_migration = true
      example.run
    ensure
      ActiveRecord::Base.in_migration = false
    end
  end

  it "should find duplicates" 


  it "should cleanup associated entries and announcements of duplicates" 


  it "sets a default for any NULL verbosity field" 

end

