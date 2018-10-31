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
require_relative '../legacy_spec_helper'
require 'repositories_controller'

describe RepositoriesController, 'Subversion', type: :controller do
  render_views

  fixtures :all

  PRJ_ID = 3

  before do
    skip 'Subversion test repository NOT FOUND. Skipping functional tests !!!' unless repository_configured?('subversion')

    Setting.default_language = 'en'
    User.current = nil

    @project = Project.find(PRJ_ID)
    @repository = Repository::Subversion.create(project: @project,
                                                scm_type: 'local',
                                                url: self.class.subversion_repository_url)

    # #reload is broken for repositories because it defines
    # `has_many :changes` which conflicts with AR's #changes method
    # here we implement #reload differently for that single repository instance
    def @repository.reload
      ActiveRecord::Base.connection.clear_query_cache
      self.class.find(id)
    end

    assert @repository
  end

  it 'should show' 


  it 'should browse root' 


  it 'should browse directory' 


  it 'should browse at given revision' 


  it 'should file changes' 


  it 'should directory changes' 


  it 'should entry' 


  context 'small file upload size',
          with_settings: { file_max_size_displayed: 0 } do

    it 'should entry should send if too big' 

  end

  it 'should entry at given revision' 


  it 'should entry not found' 


  it 'should entry download' 


  it 'should directory entry' 


  # TODO: this test needs fixtures.
  it 'should revision' 


  it 'should invalid revision' 


  it 'should invalid revision diff' 


  it 'should empty revision' 


  # TODO: this test needs fixtures.
  it 'should revision with repository pointing to a subdirectory' 


  it 'should revision diff' 


  it 'should directory diff' 


  it 'should annotate' 


  it 'should annotate at given revision' 

end

