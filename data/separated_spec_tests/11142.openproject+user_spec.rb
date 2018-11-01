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
require 'legacy_spec_helper'

describe User, type: :model do
  include MiniTest::Assertions # refute

  fixtures :all

  before do
    @admin = User.find(1)
    @jsmith = User.find(2)
    @dlopper = User.find(3)
  end

  specify 'object_daddy creation' do
    FactoryBot.create(:user, firstname: 'Testing connection')
    FactoryBot.create(:user, firstname: 'Testing connection')
    assert_equal 2, User.where(firstname: 'Testing connection').count
  end

  it 'should truth' 


  it 'should mail should be stripped' 


  it 'should create' 


  context 'User#before_create' do
    it 'should set the mail_notification to the default Setting' 

  end

  context 'User.login' do
    it 'should be case-insensitive.' 

  end

  it 'should mail uniqueness should not be case sensitive' 


  it 'should update' 


  it 'should destroy' 


  it 'should validate login presence' 


  it 'should validate mail notification inclusion' 


  context 'User#try_to_login' do
    it 'should fall-back to case-insensitive if user login is not found as-typed.' 


    it 'should select the exact matching user first' 

  end

  it 'should password' 


  it 'should name format' 


  it 'should lock' 


  context '.try_to_login' do
    context 'with good credentials' do
      it 'should return the user' 

    end

    context 'with wrong credentials' do
      it 'should return nil' 

    end
  end

  if ldap_configured?
    context '#try_to_login using LDAP' do
      context 'with failed connection to the LDAP server' do
        it 'should return nil' 

      end

      context 'with an unsuccessful authentication' do
        it 'should return nil' 

      end

      context 'on the fly registration' do
        before do
          @auth_source = LdapAuthSource.find(1)
        end

        context 'with a successful authentication' do
          it "should create a new user account if it doesn't exist" 


          it 'should retrieve existing user' 

        end
      end
    end

  else
    puts 'Skipping LDAP tests.'
  end

  it 'should create anonymous' 


  it { is_expected.to have_one :rss_token }

  it 'should rss key' 


  it { is_expected.to have_one :api_token }

  context 'User#find_by_api_key' do
    it 'should return nil if no matching key is found' 


    it 'should return nil if the key is found for an inactive user' 


    it 'should return the user if the key is found for an active user' 

  end

  it 'should roles for project' 


  it 'should projects by role for user with role' 


  it 'should projects by role for user with no role' 


  it 'should projects by role for anonymous' 


  it 'should valid notification options' 


  it 'should valid notification options class method' 


  it 'should mail notification all' 


  it 'should mail notification selected' 


  it 'should mail notification only my events' 


  it 'should comments sorting preference' 


  it 'should find by mail should be case insensitive' 


  context '#allowed_to?' do
    context 'with a unique project' do
      it 'should return false if project is archived' 


      it 'should return false if related module is disabled' 


      it 'should authorize nearly everything for admin users' 


      it 'should authorize normal users depending on their roles' 


      it 'should only managers are allowed to export tickets' 

    end

    context 'with multiple projects' do
      it 'should return false if array is empty' 


      it 'should return true only if user has permission on all these projects' 


      it 'should behave correctly with arrays of 1 project' 

    end

    context 'with options[:global]' do
      it 'should authorize if user has at least one role that has this permission' 

    end
  end
end

