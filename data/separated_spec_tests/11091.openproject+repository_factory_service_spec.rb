#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2015 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
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

require 'spec_helper'

describe Scm::RepositoryFactoryService do
  let(:user) { FactoryBot.build(:user) }
  let(:project) { FactoryBot.build(:project) }

  let(:enabled_scms) { ['subversion', 'git'] }

  let(:params_hash) { {} }
  let(:params) { ActionController::Parameters.new params_hash }

  subject(:service) { Scm::RepositoryFactoryService.new(project, params) }

  before do
    allow(Setting).to receive(:enabled_scm).and_return(enabled_scms)
  end

  context 'with empty hash' do
    it 'should not build a repository' 

  end

  context 'with valid vendor' do
    let(:params_hash) {
      { scm_vendor: 'subversion' }
    }

    it 'should allow temporary build repository' 


    it 'should not allow to persist a repository' 

  end

  context 'with invalid vendor' do
    let(:params_hash) {
      { scm_vendor: 'not_subversion', scm_type: 'foo' }
    }

    it 'should not allow to temporary build repository' 


    it 'should not allow to persist a repository' 

  end

  context 'with vendor and type' do
    let(:params_hash) {
      { scm_vendor: 'subversion', scm_type: 'existing' }
    }

    it 'should not allow to persist a repository without URL' 

  end

  context 'with invalid hash' do
    let(:params_hash) {
      {
        scm_vendor: 'subversion', scm_type: 'existing',
        repository: { url: '/tmp/foo.svn' }
      }
    }

    it 'should not allow to persist a repository URL' 

  end

  context 'with valid hash' do
    let(:params_hash) {
      {
        scm_vendor: 'subversion', scm_type: 'existing',
        repository: { url: 'file:///tmp/foo.svn' }
      }
    }

    it 'should allow to persist a repository without URL' 

  end
end
