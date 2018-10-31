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

describe Scm::DeleteManagedRepositoryService do
  let(:user) { FactoryBot.build(:user) }
  let(:project) { FactoryBot.build(:project) }

  let(:repository) { FactoryBot.build(:repository_subversion) }
  subject(:service) { Scm::DeleteManagedRepositoryService.new(repository) }

  let(:config) { {} }

  before do
    allow(OpenProject::Configuration).to receive(:[]).and_call_original
    allow(OpenProject::Configuration).to receive(:[]).with('scm').and_return(config)
    allow(Setting).to receive(:enabled_scm).and_return(['subversion', 'git'])
  end

  shared_examples 'does not delete the repository' do
    it 'does not delete the repository' 

  end

  context 'with no managed configuration' do
    it_behaves_like 'does not delete the repository'
  end

  context 'with managed repository, but no config' do
    let(:repository) { FactoryBot.build(:repository_subversion, scm_type: :managed) }

    it 'does allow to delete the repository' 

  end

  context 'with managed repository and managed config' do
    include_context 'with tmpdir'
    let(:config) {
      {
        subversion: { manages: File.join(tmpdir, 'svn') },
        git: { manages: File.join(tmpdir, 'git') }
      }
    }

    let(:repository) {
      repo = Repository::Subversion.new(scm_type: :managed)
      repo.project = project
      repo.configure(:managed, nil)

      repo.save!
      repo
    }

    it 'deletes the repository' 


    it 'does not raise an exception upon permission errors' 


    context 'and parent project' do
      let(:parent) { FactoryBot.create(:project) }
      let(:project) { FactoryBot.create(:project, parent: parent) }
      let(:repo_path) {
        Pathname.new(File.join(tmpdir, 'svn', project.identifier))
      }

      it 'does not delete anything but the repository itself' 

    end
  end

  context 'with managed remote config', webmock: true do
    let(:url) { 'http://myreposerver.example.com/api/' }
    let(:config) {
      {
        subversion: { manages: url }
      }
    }

    let(:repository) {
      repo = Repository::Subversion.new(scm_type: :managed)
      repo.project = project
      repo.configure(:managed, nil)

      repo
    }

    context 'with a valid remote' do
      before do
        stub_request(:post, url).to_return(status: 200, body: {}.to_json )
      end

      it 'calls the callback' 

    end

    context 'with a remote callback returning an error' do
      before do
        stub_request(:post, url)
          .to_return(status: 400, body: { success: false, message: 'An error occurred' }.to_json)
      end

      it 'calls the callback' 

    end
  end
end

