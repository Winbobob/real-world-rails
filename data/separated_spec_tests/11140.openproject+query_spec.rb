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
require_relative '../legacy_spec_helper'

describe Query, type: :model do
  fixtures :all

  it 'should system shared versions should be available in global queries' 


  it 'should project filter in global queries' 


  def find_issues_with_query(query)
    WorkPackage.includes(:assigned_to, :status, :type, :project, :priority)
               .where(query.statement)
               .references(:projects)
  end

  def assert_find_issues_with_query_is_successful(query)
    expect {
      find_issues_with_query(query)
    }.not_to raise_error
  end

  def assert_query_statement_includes(query, condition)
    assert query.statement.include?(condition),
           "Query statement condition not found in: #{query.statement}"
  end

  it 'should query should allow shared versions for a project query' 


  it 'should query with multiple custom fields' 


  it 'should operator none' 


  it 'should operator none for integer' 


  it 'should operator all' 


  it 'should operator greater than' 


  it 'should operator in more than' 


  it 'should operator in less than' 


  it 'should operator less than ago' 


  it 'should operator more than ago' 


  it 'should operator in' 


  it 'should operator ago' 


  it 'should operator today' 


  it 'should operator this week on date' 


  it 'should operator this week on datetime' 


  it 'should operator contains' 


  it 'should operator does not contains' 


  it 'should filter assigned to me' 


  it 'should filter watched issues' 


  it 'should filter unwatched issues' 


  it 'should default columns' 


  it 'should set column names' 


  it 'should groupable columns should include custom fields' 


  it 'should grouped with valid column' 


  it 'should grouped with invalid column' 


  it 'should default sort' 


  it 'should set sort criteria with hash' 


  it 'should set sort criteria with array' 


  it 'should create query with sort' 


  it 'should sort by string custom field asc' 


  it 'should sort by string custom field desc' 


  it 'should sort by float custom field asc' 


  it 'should invalid query should raise query statement invalid error' 


  it 'should issue count by association group' 


  it 'should issue count by list custom field group' 


  it 'should issue count by date custom field group' 


  context '#filter_for' do
    before do
      @query = Query.new(name: '_')
    end

    it 'should include users of visible projects in cross-project view' 


    it 'should include visible projects in cross-project view' 


    context "'member_of_group' filter" do
      it 'should be present' 


      it 'should be an optional list' 


      it 'should have a list of the groups as values' 

    end

    context "'assigned_to_role' filter" do
      it 'should be present' 


      it 'should be an optional list' 


      it 'should have a list of the Roles as values' 


      it 'should not include the built in Roles as allowed_values' 

    end

    context "'watcher_id' filter" do
      context 'globally' do
        context 'for a logged in user' do
          before do
            User.current = User.find 1
          end

          after do
            User.current = nil
          end

          it 'should be present' 


          it 'should be a list' 


          it 'should have a list of active users as allowed_values' 


          it 'should not include active users not member of any project' 


          it 'should not include locked users as values' 


          it 'should not include the anonymous user as values' 

        end
      end

      context 'in a project' do
        before do
          @query.project = Project.find(1)
        end

        context 'for a logged in user' do
          before do
            allow(User).to receive(:current).and_return(User.find(1))
          end

          it 'should be present' 


          it 'should be a list' 


          it 'should have a list of the project members as allowed_values' 


          it 'should not include non-project members as allowed_values' 


          it 'should not include locked project members as allowed_values' 


          it 'should not include the anonymous user as allowed_values' 

        end
      end
    end
  end

  context '#statement' do
    context "with 'member_of_group' filter" do
      before do
        Group.destroy_all # No fixtures
        @user_in_group = FactoryBot.create(:user)
        @second_user_in_group = FactoryBot.create(:user)
        @user_in_group2 = FactoryBot.create(:user)
        @user_not_in_group = FactoryBot.create(:user)

        @group = FactoryBot.create(:group).reload
        @group.users << @user_in_group
        @group.users << @second_user_in_group

        @group2 = FactoryBot.create(:group).reload
        @group2.users << @user_in_group2

        @empty_group = FactoryBot.create(:group).reload
      end

      it 'should search assigned to for users in the group' 


      it 'should search not assigned to any group member (none)' 


      it 'should search assigned to any group member (all)' 


      it 'should return no results on empty set' 


      it 'should return results on disallowed empty set' 

    end

    context "with 'assigned_to_role' filter" do
      before do
        # No fixtures
        MemberRole.delete_all
        Member.delete_all
        Role.delete_all

        @manager_role = FactoryBot.create(:role, name: 'Manager')
        @developer_role = FactoryBot.create(:role, name: 'Developer')
        @empty_role = FactoryBot.create(:role, name: 'Empty')

        @project = FactoryBot.create(:project)
        @manager = FactoryBot.create(:user)
        @developer = FactoryBot.create(:user)
        @boss = FactoryBot.create(:user)
        FactoryBot.create(:member, user: @manager, project: @project, role_ids: [@manager_role.id])
        FactoryBot.create(:member, user: @developer, project: @project, role_ids: [@developer_role.id])
        FactoryBot.create(:member, user: @boss, project: @project, role_ids: [@manager_role, @developer_role].map(&:id))
      end

      it 'should search assigned to for users with the Role' 


      it 'should search assigned to for users not assigned to any Role (none)' 


      it 'should search assigned to for users assigned to any Role (all)' 


      it 'should return no results on empty set' 


      it 'should return results on disallowed empty set' 

    end
  end
end

