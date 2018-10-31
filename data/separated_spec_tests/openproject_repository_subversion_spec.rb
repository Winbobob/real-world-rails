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

describe Repository::Subversion, type: :model do
  fixtures :all

  before do
    skip 'Subversion test repository NOT FOUND. Skipping unit tests !!!' unless repository_configured?('subversion')

    @project = Project.find(3)
    @repository = Repository::Subversion.create(project: @project,
                                                scm_type: 'existing',
                                                url: self.class.subversion_repository_url)
    assert @repository
  end

  it 'should fetch changesets from scratch' 


  it 'should fetch changesets incremental' 


  it 'should latest changesets' 


  it 'should directory listing with square brackets in path' 


  it 'should directory listing with square brackets in base' 


  it 'should identifier' 


  it 'should find changeset by empty name' 


  it 'should identifier nine digit' 


  it 'should format identifier' 


  it 'should format identifier nine digit' 


  it 'should activities' 


  it 'should activities nine digit' 


  it 'should log encoding ignore setting' 


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

