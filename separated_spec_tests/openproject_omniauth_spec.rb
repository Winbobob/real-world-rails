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

describe 'Omniauth authentication', type: :feature do
  let(:user) do
    FactoryGirl.create(:user,
                       force_password_change: false,
                       identity_url: 'developer:omnibob@example.com',
                       login: 'omnibob',
                       mail: 'omnibob@example.com',
                       firstname: 'omni',
                       lastname: 'bob'
                      )
  end

  before do
    @omniauth_test_mode = OmniAuth.config.test_mode
    @capybara_ignore_elements = Capybara.ignore_hidden_elements
    @omniauth_logger = OmniAuth.config.logger
    OmniAuth.config.logger = Rails.logger
    Capybara.ignore_hidden_elements = false
  end

  after do
    User.delete_all
    User.current = nil
    OmniAuth.config.test_mode = @omniauth_test_mode
    Capybara.ignore_hidden_elements = @capybara_ignore_elements
    OmniAuth.config.logger = @omniauth_logger
  end

  ##
  # Returns a given translation up until the first occurrence of a parameter (exclusive).
  def translation_substring(translation)
    translation.scan(/(^.*) %\{/).first.first
  end

  context 'sign in existing user' do
    it 'should redirect to back url' 


    it 'should sign in user' 


    context 'with direct login',
            with_config: { omniauth_direct_login_provider: 'developer' } do

      it 'should go directly to the developer sign in and then redirect to the back url' 

    end
  end

  describe 'sign out a user with direct login and login required',
           with_config: { omniauth_direct_login_provider: 'developer' },
           with_settings: { login_required?: true } do

    it 'shows a notice that the user has been logged out' 


    it 'sign-in after previous sign-out shows my page' 

  end

  shared_examples 'omniauth user registration' do
    it 'should register new user' 

  end

  context 'register on the fly',
           with_settings: {
            self_registration?: true,
            self_registration: '3',
            available_languages: [:en]
           } do

    let(:user) do
      User.new(force_password_change: false,
               identity_url: 'developer:omnibob@example.com',
               login: 'omnibob',
               mail: 'omnibob@example.com',
               firstname: 'omni',
               lastname: 'bob')
    end

    it_behaves_like 'omniauth user registration'

    it 'should redirect to homesceen' 


    context 'with password login disabled',
            with_config: { disabled_password_login: 'true' } do

      it_behaves_like 'omniauth user registration'
    end
  end

  context 'registration by email',
          with_settings: {
            self_registration?: true,
            self_registration: '1'
          } do

    shared_examples 'registration with registration by email' do
      it 'shows a note explaining that the account has to be activated' 

    end

    it_behaves_like 'registration with registration by email' do
      let(:login_path) { '/auth/developer' }
    end

    context 'with direct login enabled and login required',
            with_config: { omniauth_direct_login_provider: 'developer' } do

      before do
        allow(Setting).to receive(:login_required?).and_return(true)
      end

      it_behaves_like 'registration with registration by email' do
        # i.e. it still shows a notice
        # instead of redirecting straight back to the omniauth login provider
        let(:login_path) { signin_path }
        let(:instructions) { translation_substring I18n.t(:instructions_after_registration) }
      end
    end
  end

  context 'error occurs' do
    shared_examples 'omniauth signin error' do
      it 'should fail with generic error message' 

    end

    it_behaves_like 'omniauth signin error' do
      let(:login_path) { '/auth/developer' }
    end

    context 'with direct login and login required',
            with_config: { omniauth_direct_login_provider: 'developer' } do

      before do
        allow(Setting).to receive(:login_required?).and_return(true)
      end

      it_behaves_like 'omniauth signin error' do
        let(:login_path) { signin_path }
        let(:instructions) { translation_substring I18n.t(:instructions_after_error) }
      end
    end
  end
end

