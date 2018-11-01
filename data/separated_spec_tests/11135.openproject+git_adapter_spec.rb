#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
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
# See docs/COPYRIGHT.rdoc for more details.
#++

# This file includes UTF-8 "Felix Schäfer".
# We need to consider Ruby 1.9 compatibility.

require 'legacy_spec_helper'

describe OpenProject::Scm::Adapters::Git, type: :model do
  let(:git_repository_path) {  Rails.root.to_s.gsub(%r{config\/\.\.}, '') + '/tmp/test/git_repository' }

  FELIX_UTF8 = 'Felix Schäfer'
  FELIX_HEX  = "Felix Sch\xC3\xA4fer"
  CHAR_1_HEX = "\xc3\x9c"

  ## Ruby uses ANSI api to fork a process on Windows.
  ## Japanese Shift_JIS and Traditional Chinese Big5 have 0x5c(backslash) problem
  ## and these are incompatible with ASCII.
  # WINDOWS_PASS1 = Redmine::Platform.mswin?
  WINDOWS_PASS1 = false

  before do
    skip 'Git test repository NOT FOUND. Skipping unit tests !!!' unless File.directory?(git_repository_path)

    @adapter = OpenProject::Scm::Adapters::Git.new(
      git_repository_path,
      nil,
      nil,
      nil,
      'ISO-8859-1'
    )
    assert @adapter
    @char_1        = CHAR_1_HEX.dup
    if @char_1.respond_to?(:force_encoding)
      @char_1.force_encoding('UTF-8')
    end
  end

  it 'should scm version' 


  it 'should branches' 


  it 'should tags' 


  it 'should getting all revisions' 


  it 'should getting certain revisions' 


  it 'should revisions reverse' 


  it 'should getting revisions with spaces in filename' 


  it 'should getting revisions with leading and trailing spaces in filename' 


  it 'should getting entries with leading and trailing spaces in filename' 


  it 'should annotate' 


  it 'should annotate moved file' 


  it 'should last rev' 


  it 'should last rev with spaces in filename' 


  it 'test latin 1 path' 


  it 'should entries tag' 


  it 'should entries branch' 


  it 'should entries latin 1 files' 


  it 'should entries latin 1 dir' 


  private

  def test_scm_version_for(scm_command_version, version)
    expect(@adapter).to receive(:scm_version_from_command_line).and_return(scm_command_version)
    assert_equal version, @adapter.git_binary_version
  end
end

