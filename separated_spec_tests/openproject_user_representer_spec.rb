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

require 'spec_helper'

describe ::API::V3::Users::UserRepresenter do
  let(:user) { FactoryGirl.build_stubbed(:user, status: 1) }
  let(:current_user) { FactoryGirl.build_stubbed(:user) }
  let(:representer) { described_class.new(user, current_user: current_user) }

  context 'generation' do
    subject(:generated) { representer.to_json }

    it do is_expected.to include_json('User'.to_json).at_path('_type') end


    context 'as regular user' do
      it 'hides as much information as possible' 

    end

    context 'as the represented user' do
      let(:current_user) { user }

      it 'shows the information of the user' 

    end

    context 'as admin' do
      let(:current_user) { FactoryGirl.build_stubbed(:admin) }

      it 'shows everything' 


      it_behaves_like 'has UTC ISO 8601 date and time' do
        let(:date) { user.created_on }
        let(:json_path) { 'createdAt' }
      end

      it_behaves_like 'has UTC ISO 8601 date and time' do
        let(:date) { user.updated_on }
        let(:json_path) { 'updatedAt' }
      end
    end

    describe 'email' do
      context 'user shows his E-Mail address' do
        let(:preference) { FactoryGirl.build(:user_preference, hide_mail: false) }
        let(:user) { FactoryGirl.build_stubbed(:user, status: 1, preference: preference) }

        it 'shows the users E-Mail address' 

      end

      context 'user hides his E-Mail address' do
        let(:preference) { FactoryGirl.build(:user_preference, hide_mail: true) }
        let(:user) { FactoryGirl.build_stubbed(:user, status: 1, preference: preference) }

        it 'does not render the users E-Mail address' 

      end
    end

    describe 'status' do
      it 'contains the name of the account status' 

    end

    describe '_links' do
      it 'should link to self' 


      it_behaves_like 'has an untitled link' do
        let(:link) { 'showUser' }
        let(:href) { "/users/#{user.id}" }
      end

      context 'when regular current_user' do
        it 'should have no lock-related links' 

      end

      context 'when current_user is admin' do
        let(:current_user) { FactoryGirl.build_stubbed(:admin) }

        it 'should link to lock and update' 


        context 'when account is locked' do
          it 'should link to unlock' 

        end
      end

      context 'when deletion is allowed' do
        before do
          allow(DeleteUserService).to receive(:deletion_allowed?)
            .with(user, current_user)
            .and_return(true)
        end

        it 'should link to delete' 

      end

      context 'when deletion is not allowed' do
        before do
          allow(DeleteUserService).to receive(:deletion_allowed?)
            .with(user, current_user)
            .and_return(false)
        end

        it 'should not link to delete' 

      end
    end

    describe 'avatar', with_settings: { gravatar_enabled?: true, protocol: 'http' } do
      before do
        user.mail = 'foo@bar.com'
      end

      it 'should have an url to gravatar if settings permit and mail is set' 


      it 'should be blank if gravatar is disabled' 


      it 'should be blank if email is missing (e.g. anonymous)' 

    end
  end
end

