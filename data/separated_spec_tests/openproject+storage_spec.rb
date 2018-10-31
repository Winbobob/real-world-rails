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

require 'spec_helper'

describe OpenProject::Storage do
  before do
    allow(Setting).to receive(:enabled_scm).and_return(enabled_scms)
    allow(OpenProject::Configuration).to receive(:[]).and_call_original
    allow(OpenProject::Configuration).to receive(:[]).with('scm').and_return(config)
  end

  context 'with no SCM configuration' do
    let(:config) { {} }
    let(:enabled_scms) { [] }

    describe '#known_storage_paths' do
      subject { OpenProject::Storage.known_storage_paths }
      it 'should contain attachments path' 

    end

    describe '#mount_information' do
      subject { OpenProject::Storage.mount_information }
      include_context 'with tmpdir'

      before do
        allow(OpenProject::Storage).to receive(:known_storage_paths)
          .and_return(foobar: { path: tmpdir, label: 'this is foobar' })
      end

      it 'should contain one fs entry' 

    end
  end

  context 'with SCM configuration' do
    include_context 'with tmpdir'

    let(:config) {
      {
        git: { manages: File.join(tmpdir, 'git') }
      }
    }
    let(:enabled_scms) { %w[git] }
    let(:returned_fs_info) { [{ id: 1, free: 1234 }] }

    before do
      # Mock filesystem info as we do not know there /tmp is mounted here.
      allow(OpenProject::Storage).to receive(:read_fs_info).and_return(*returned_fs_info)
    end

    describe '#known_storage_paths' do
      subject { OpenProject::Storage.known_storage_paths }

      it 'contains both paths' 

    end

    describe '#mount_information' do
      subject { OpenProject::Storage.mount_information }
      it 'contains one entry' 


      context 'with multiple filesystem ids' do
        let(:returned_fs_info) { [{ id: 1, free: 1234 }, { id: 2, free: 15 }] }
        it 'contains two entries' 

      end
    end
  end
end

