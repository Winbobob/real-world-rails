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

describe OpenProject::Scm::Adapters::Git do
  shared_examples "git adapter specs" do
    let(:protocol) { "" }
    let(:url) { protocol + Rails.root.join('/tmp/does/not/exist.git').to_s }
    let(:config) { {} }
    let(:encoding) { nil }
    let(:adapter) {
      OpenProject::Scm::Adapters::Git.new(
        url,
        nil,
        nil,
        nil,
        encoding,
        "test-identifier"
      )
    }

    repos_dir = Dir.mktmpdir

    before do
      allow(adapter.class).to receive(:config).and_return(config)

      allow(OpenProject::Configuration)
        .to receive(:scm_local_checkout_path)
        .and_return(repos_dir)
    end

    describe 'client information' do
      it 'sets the Git client command' 


      context 'with client command from config' do
        let(:config) { { client_command: '/usr/local/bin/git' } }
        it 'overrides the Git client command from config' 

      end

      shared_examples 'correct client version' do |git_string, expected_version|
        it 'should set the correct client version' 

      end

      it_behaves_like 'correct client version', "git version 1.7.3.4\n", [1, 7, 3, 4]
      it_behaves_like 'correct client version', "1.6.1\n1.7\n1.8", [1, 6, 1]
      it_behaves_like 'correct client version', "1.6.2\r\n1.8.1\r\n1.9.1", [1, 6, 2]
    end

    describe 'invalid repository' do
      describe '.check_availability!' do
        it 'should not be available' 


        it 'should raise a meaningful error if shell output fails' 

      end
    end

    describe 'empty repository' do
      include_context 'with tmpdir'
      let(:url) { tmpdir }

      before do
        adapter.initialize_bare_git
      end

      describe '.check_availability!' do
        shared_examples 'check_availibility raises empty' do
          it do
            expect { adapter.check_availability! }
              .to raise_error(OpenProject::Scm::Exceptions::ScmEmpty)
          end
        end

        it_behaves_like 'check_availibility raises empty'

        describe 'Git version compatibility' do
          before do
            allow(::Open3).to receive(:capture2e).and_return(output, nil)
          end

          context 'older Git version' do
            let(:output) { "fatal: bad default revision 'HEAD'\n" }
            it_behaves_like 'check_availibility raises empty'
          end

          context 'new Git version' do
            let(:output) { "fatal: your current branch 'master' does not have any commits yet\n" }
            it_behaves_like 'check_availibility raises empty'
          end
        end
      end
    end

    describe 'local repository' do
      with_git_repository do |repo_dir|
        let(:url) { "#{protocol}#{repo_dir}" }

        before do
          # make sure the repository is available before even bothering
          # with the rest of the tests
          expect(adapter).to be_available
          expect { adapter.check_availability! }.to_not raise_error
        end

        it 'reads the git version' 


        it 'is a valid repository' 


        it 'should be using checkout' 


        it 'should be available' 


        it 'should read tags' 


        describe '.branches' do
          it 'should show the default branch' 


          it 'should read branches' 

        end

        describe '.info' do
          it 'builds the info object' 

        end

        describe '.lastrev' do
          let(:felix_hex) { "Felix Sch\xC3\xA4fer" }

          it 'references the last revision for empty path' 


          it 'references the last revision of the given path' 


          it 'references the last revision of the given path and identifier' 


          it 'works with spaces in filename' 


          it 'encodes strings correctly' 

        end

        describe '.revisions' do
          it 'should retrieve all revisions' 


          it 'should retrieve the latest revision' 


          it 'should retrieve a certain revisions' 


          it 'should retrieve revisions in reverse' 


          it 'should retrieve revisions in a specific time frame' 


          it 'should retrieve revisions in a specific time frame in reverse' 


          it 'should retrieve revisions by filename' 


          it 'should retrieve revisions with arbitrary whitespace' 


          it 'should show all paths of a revision' 

        end

        describe '.entries' do
          shared_examples 'retrieve entries' do
            it 'should retrieve entries from an identifier' 


            it 'should have a related revision' 


            it 'can be retrieved by tag' 


            it 'can be retrieved by branch' 

          end

          describe 'encoding' do
            let (:char1_hex) { "\xc3\x9c".force_encoding('UTF-8') }

            context 'with default encoding' do
              it_behaves_like 'retrieve entries'

              it 'can retrieve directories containing entries encoded in latin-1' 


              it 'cannot retrieve files with latin-1 encoding in their path' 

            end

            context 'with latin-1 encoding' do
              let (:encoding) { 'ISO-8859-1' }

              it_behaves_like 'retrieve entries'

              it 'can be retrieved with latin-1 encoding' 


              it 'can be retrieved with latin-1 directories' 

            end
          end
        end

        describe '.annotate' do
          it 'should annotate a regular file' 


          it 'should annotate moved file' 


          it 'should annotate with identifier' 


          it 'should raise for an invalid path' 


          it 'should return nil for binary path' 


          # We should rethink the output of annotated files for these formats.
          it 'also returns nil for UTF-16 encoded file' 

        end

        describe '.cat' do
          it 'outputs the given file' 


          it 'raises an exception for an invalid file' 

        end

        describe '.diff' do
          it 'provides a full diff of the last commit by default' 


          it 'provides a negative diff' 


          it 'provides the complete for the given range' 


          it 'provides the selected diff for the given range' 

        end
      end
    end
  end

  context "with a local repository" do
    it_behaves_like 'git adapter specs'
  end

  context "with a remote repository" do
    it_behaves_like 'git adapter specs' do
      let(:protocol) { "file://" } # make it remote by using a protocol
    end
  end
end

