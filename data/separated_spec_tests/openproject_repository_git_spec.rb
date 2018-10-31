#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.rdoc for more details.
#++
require 'legacy_spec_helper'

describe Repository::Git, type: :model do
  fixtures :all

  # No '..' in the repository path
  let(:git_repository_path) {
    path = Rails.root.to_s.gsub(%r{config\/\.\.}, '') + '/tmp/test/git_repository'
    path.gsub!(/\//, '\\') if Redmine::Platform.mswin?
    path
  }

  FELIX_HEX2  = "Felix Sch\xC3\xA4fer"
  CHAR_1_HEX2 = "\xc3\x9c"

  ## Ruby uses ANSI api to fork a process on Windows.
  ## Japanese Shift_JIS and Traditional Chinese Big5 have 0x5c(backslash) problem
  ## and these are incompatible with ASCII.
  # WINDOWS_PASS = Redmine::Platform.mswin?
  WINDOWS_PASS = false

  before do
    skip 'Git test repository NOT FOUND. Skipping unit tests !!!' unless File.directory?(git_repository_path)

    @project = Project.find(3)
    @repository = Repository::Git.create(
      project:       @project,
      scm_type:      'local',
      url:           git_repository_path,
      path_encoding: 'ISO-8859-1'
    )
    assert @repository
    @char_1        = CHAR_1_HEX2.dup
    if @char_1.respond_to?(:force_encoding)
      @char_1.force_encoding('UTF-8')
    end
  end

  it 'should fetch changesets from scratch' 


  it 'should fetch changesets incremental' 


  it 'should latest changesets' 


  it 'should latest changesets latin 1 dir' 


  it 'should find changeset by name' 


  it 'should find changeset by empty name' 


  it 'should identifier' 


  it 'should format identifier' 


  it 'should activities' 


  it 'should log utf8' 


  it 'should previous' 


  it 'should previous nil' 


  it 'should next' 


  it 'should next nil' 


  private

  def find_events(user, options = {})
    fetcher = Redmine::Activity::Fetcher.new(user, options)
    fetcher.scope = ['changesets']
    fetcher.events(Date.today - 30, Date.today + 1)
  end
end

