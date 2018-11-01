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

describe SettingsController, type: :controller do
  before :each do
    allow(@controller).to receive(:set_localization)
    @params = {}

    @user = FactoryBot.create(:admin)
    allow(User).to receive(:current).and_return @user
  end

  describe 'edit' do
    render_views

    before do
      @previous_projects_modules = Setting.default_projects_modules
    end

    after do
      Setting.default_projects_modules = @previous_projects_modules
    end

    it 'contains a check box for the activity module on the projects tab' 


    it 'does not store the activity in the default_projects_modules if unchecked' 


    it 'stores the activity in the default_projects_modules if checked' 


    describe 'with activity in Setting.default_projects_modules' do
      before do
        Setting.default_projects_modules = %w[activity wiki]
      end

      it 'contains a checked checkbox for activity' 

    end

    describe 'without activated activity module' do
      before do
        Setting.default_projects_modules = %w[wiki]
      end

      it 'contains an unchecked checkbox for activity' 

    end

    describe 'password settings' do
      let(:old_settings) do
        {
          password_min_length: 10,
          password_active_rules: [],
          password_min_adhered_rules: 0,
          password_days_valid: 365,
          password_count_former_banned: 2,
          lost_password: 1
        }
      end

      let(:new_settings) do
        {
          password_min_length: 42,
          password_active_rules: %w(uppercase lowercase),
          password_min_adhered_rules: 7,
          password_days_valid: 13,
          password_count_former_banned: 80,
          lost_password: 3
        }
      end

      let(:original_settings) { Hash.new }

      before do
        old_settings.keys.each do |key|
          original_settings[key] = Setting[key]
        end

        old_settings.keys.each do |key|
          Setting[key] = old_settings[key]
        end
      end

      after do
        # restore settings
        old_settings.keys.each do |key|
          Setting[key] = original_settings[key]
        end
      end

      describe 'POST #edit with password login enabled' do
        before do
          allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(false)

          post 'edit', params: { tab: 'authentication', settings: new_settings }
        end

        it 'is successful' 


        it 'sets the minimum password length to 42' 


        it 'sets the active character classes to lowercase and uppercase' 


        it 'sets the required number of classes to 7' 


        it 'sets passwords to expire after 13 days' 


        it 'bans the last 80 passwords' 


        it 'sets the lost password option to the nonsensical 3' 

      end

      describe 'POST #edit with password login disabled' do
        before do
          allow(OpenProject::Configuration).to receive(:disable_password_login?).and_return(true)

          post 'edit', params: { tab: 'authentication', settings: new_settings }
        end

        it 'is successful' 


        it 'does not set the minimum password length to 42' 


        it 'does not set the active character classes to lowercase and uppercase' 


        it 'does not set the required number of classes to 7' 


        it 'does not set passwords to expire after 13 days' 


        it 'does not ban the last 80 passwords' 


        it 'does not set the lost password option to the nonsensical 3' 

      end
    end
  end
end

