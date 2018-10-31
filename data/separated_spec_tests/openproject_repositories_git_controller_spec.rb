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
require_relative '../legacy_spec_helper'
require 'repositories_controller'

describe RepositoriesController, 'Git', type: :controller do
  render_views

  fixtures :all

  # No '..' in the repository path
  let(:git_repository_path) {
    path = Rails.root.to_s.gsub(%r{config\/\.\.}, '') + '/tmp/test/git_repository'
    path.gsub!(/\//, '\\') if Redmine::Platform.mswin?
    path
  }

  before do
    skip 'Git test repository NOT FOUND. Skipping functional tests !!!' unless File.directory?(git_repository_path)

    User.current = nil
    @repository = Repository::Git.create(
      project: Project.find(3),
      scm_type: 'local',
      url:     git_repository_path,
      path_encoding: 'ISO-8859-1'
    )

    # see repositories_subversion_controller_test.rb
    def @repository.reload
      ActiveRecord::Base.connection.clear_query_cache
      self.class.find(id)
    end

    assert @repository
  end

  it 'should browse root' 


  it 'should browse branch' 


  it 'should browse tag' 


  it 'should browse directory' 


  it 'should browse at given revision' 


  it 'should changes' 


  it 'should entry show' 


  it 'should entry download' 


  it 'should directory entry' 


  it 'should diff' 


  it 'should diff two revs' 


  it 'should annotate' 


  it 'should annotate at given revision' 


  it 'should annotate binary file' 


  it 'should revision' 


  it 'should empty revision' 

end

