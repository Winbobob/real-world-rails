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

require 'spec_helper'

describe OpenProject::Scm::Adapters::Subversion do
  let(:root_url) { '/tmp/bar.svn' }
  let(:url) { "file://#{root_url}" }
  let(:config) { {} }
  let(:adapter) { OpenProject::Scm::Adapters::Subversion.new url, root_url }

  before do
    allow(adapter.class).to receive(:config).and_return(config)
  end

  describe 'client information' do
    it 'sets the Subversion client command' 


    context 'with client command from config' do
      let(:config) { { client_command: '/usr/local/bin/svn' } }
      it 'overrides the Subversion client command from config' 

    end

    shared_examples 'correct client version' do |svn_string, expected_version|
      it 'should set the correct client version' 

    end

    it_behaves_like 'correct client version', "svn, version 1.6.13 (r1002816)\n", [1, 6, 13]
    it_behaves_like 'correct client version', "svn, versione 1.6.13 (r1002816)\n", [1, 6, 13]
    it_behaves_like 'correct client version', "1.6.1\n1.7\n1.8", [1, 6, 1]
    it_behaves_like 'correct client version', "1.6.2\r\n1.8.1\r\n1.9.1", [1, 6, 2]
  end

  describe 'invalid repository' do
    describe '.check_availability!' do
      it 'should not be available' 


      it 'should raise a meaningful error if shell output fails' 

    end
  end

  describe 'repository with authorization' do
    let(:adapter) { OpenProject::Scm::Adapters::Subversion.new url, root_url, login, password }
    let(:login) { 'whatever@example.org' }
    let(:svn_cmd) { adapter.send :build_svn_cmd, ['info'] }

    context 'without password' do
      let(:password) { nil }

      it 'creates the subversion command' 

    end

    context 'with password' do
      let(:password) { 'VG%\';rm -rf /;},Y<lo>^m\+DuE,vJP/9' }

      it 'creates the subversion command' 

    end
  end

  describe 'empty repository' do
    include_context 'with tmpdir'
    let(:root_url) { tmpdir }

    describe '.create_empty_svn' do
      context 'with valid root_url' do
        it 'should create the repository' 

      end
      context 'with non-existing root_url' do
        let(:root_url) { File.join(tmpdir, 'foo', 'bar') }

        it 'should fail' 

      end
    end

    describe '.check_availability!' do
      it 'should be marked empty' 

    end
  end

  describe 'local repository' do
    with_subversion_repository do |repo_dir|
      let(:root_url) { repo_dir }

      it 'reads the Subversion version' 


      it 'is a valid repository' 


      it 'should be available' 


      describe '.info' do
        it 'builds the info object' 

      end

      describe '.entries' do
        it 'reads all entries from the current revision' 


        it 'contains a reference to the last revision' 


        it 'reads all entries from the given revision' 


        it 'reads all entries from the given path' 


        it 'reads all entries from the given path and revision' 

      end

      describe '.properties' do
        it 'returns an empty hash for no properties' 


        it 'returns the properties when available' 


        it 'does not return the properties from an older revision on the same path' 

      end

      describe '.revisions' do
        it 'returns all revisions by default' 


        it 'returns revisions for a specific path' 


        it 'returns revision for a specific path and revision' 


        it 'returns revision for a specific range' 

      end

      describe '.blame' do
        it 'blames an existing file at the given path' 


        it 'outputs nothing for an invalid blame target' 

      end

      describe '.cat' do
        it 'outputs the given file' 


        it 'raises an exception for an invalid file' 

      end

      describe '.diff' do
        it 'provides a full diff against the last revision' 


        it 'provides a negative diff' 


        it 'provides the complete for the given range' 


        it 'provides the selected diff for the given range' 

      end
    end
  end
end

