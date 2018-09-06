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

describe Scm::CheckoutInstructionsService do
  let(:user) { FactoryGirl.build(:user) }
  let(:project) { FactoryGirl.build(:project) }

  let(:url) { 'file:///tmp/some/svn/repo' }
  let(:repository) {
    FactoryGirl.build(:repository_subversion,
                      url: url,
                      project: project)
  }

  let(:base_url) { 'http://example.org/svn/' }
  let(:path) { nil }
  let(:text) { 'foo' }
  let(:checkout_hash) {
    {
      'git' => { 'enabled' => '0' },
      'subversion' => { 'enabled' => '1',
                        'text' => text,
                        'base_url' => base_url
                      }
    }
  }

  subject(:service) { Scm::CheckoutInstructionsService.new(repository, user: user, path: path) }

  before do
    allow(Setting).to receive(:repository_checkout_data).and_return(checkout_hash)
  end

  describe '#checkout_url' do
    shared_examples 'builds the correct URL' do
      it 'builds the correct URL' 


      shared_examples 'valid checkout URL' do
        it do
          expect(service.checkout_url(path))
            .to eq(URI("http://example.org/svn/#{project.identifier}/#{expected_path}"))
        end
      end

      it_behaves_like 'valid checkout URL' do
        let(:path) { 'foo/bar' }
        let(:expected_path) { path }
      end

      it_behaves_like 'valid checkout URL' do
        let(:path) { 'foo/bar with spaces' }
        let(:expected_path) { 'foo/bar%20with%20spaces' }
      end

      it_behaves_like 'valid checkout URL' do
        let(:path) { 'foo/bar with §\"!??```' }
        let(:expected_path) { 'foo/%C2%A7%22!??%60%60%60' }
      end
    end
  end

  describe '#checkout_command' do
    it 'returns the SCM vendor command' 

  end

  describe '#instructions' do
    it 'returns the setting when defined' 


    context 'no setting defined' do
      let(:text) { nil }

      it 'returns the default translated instructions' 

    end
  end

  describe '#settings' do
    it 'svn is available for checkout' 


    it 'has the correct settings' 


    context 'missing checkout base URL' do
      let(:base_url) { '' }

      it 'is not available for checkout even when enabled' 

    end

    context 'disabled repository' do
      let(:repository) { FactoryGirl.build(:repository_git) }

      it 'git is not available for checkout' 

    end
  end

  describe '#permission' do
    context 'with no managed repository' do
      it 'is not applicable' 

    end

    context 'with managed repository' do
      before do
        allow(repository).to receive(:managed?).and_return(true)
      end

      it 'is applicable' 


      it 'returns the correct permissions' 


      it 'returns the correct permissions for commit access' 


      it 'returns the correct permissions for read access' 


      it 'returns the correct permissions for no access' 

    end
  end
end

