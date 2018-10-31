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

describe TimelinesController, type: :controller do
  # ===========================================================
  # Helpers
  def self.become_admin
    let(:current_user) { FactoryGirl.create(:admin) }
  end

  def self.become_non_member
    let(:current_user) { FactoryGirl.create(:user) }

    before do
      current_user.memberships.select { |m| m.project_id == project.id }.each(&:destroy)
    end
  end

  def self.become_member_with_all_permissions
    let(:current_user) { FactoryGirl.create(:user) }

    before do
      role   = FactoryGirl.create(:role, permissions: [:view_timelines, :edit_timelines, :delete_timelines])
      member = FactoryGirl.build(:member, user: current_user, project: project)
      member.roles = [role]
      member.save!
    end
  end

  def self.become_member_with_view_permissions
    let(:current_user) { FactoryGirl.create(:user) }

    before do
      role   = FactoryGirl.create(:role, permissions: [:view_timelines])
      member = FactoryGirl.build(:member, user: current_user, project: project)
      member.roles = [role]
      member.save!
    end
  end

  def self.become_member_with_edit_permissions
    let(:current_user) { FactoryGirl.create(:user) }

    before do
      role   = FactoryGirl.create(:role, permissions: [:edit_timelines])
      member = FactoryGirl.build(:member, user: current_user, project: project)
      member.roles = [role]
      member.save!
    end
  end

  def self.become_member_with_delete_permissions
    let(:current_user) { FactoryGirl.create(:user) }

    before do
      role   = FactoryGirl.create(:role, permissions: [:delete_timelines])
      member = FactoryGirl.build(:member, user: current_user, project: project)
      member.roles = [role]
      member.save!
    end
  end

  before do
    allow(User).to receive(:current).and_return current_user
  end

  shared_examples_for 'all actions related to all timelines within a project' do
    describe 'w/o a given project' do
      become_admin

      it 'renders a 404 Not Found page' 

    end

    describe 'w/ an unknown project' do
      become_admin

      it 'renders a 404 Not Found page' 

    end

    describe 'w/ a known project' do
      let(:project) { FactoryGirl.create(:project, identifier: 'test_project') }

      describe 'w/o being a member or administrator' do
        become_non_member

        it 'renders a 403 Forbidden page' 

      end
    end
  end

  shared_examples_for 'all actions related to an existing timeline' do
    become_admin

    describe 'w/o a valid timelines id' do
      describe 'w/o a given project' do
        it 'renders a 404 Not Found page' 

      end

      describe 'w/ an unknown project' do
        it 'renders a 404 Not Found page' 

      end

      describe 'w/ a known project' do
        let(:project) { FactoryGirl.create(:project, identifier: 'test_project') }

        describe 'w/o being a member or administrator' do
          become_non_member

          it 'renders a 403 Forbidden page' 

        end

        describe 'w/ the current user being a member' do
          become_member_with_all_permissions

          it 'raises ActiveRecord::RecordNotFound errors' 

        end
      end
    end

    describe 'w/ a valid timelines id' do
      let(:project)  { FactoryGirl.create(:project, identifier: 'test_project') }
      let(:timeline) { FactoryGirl.create(:timelines, project_id: project.id, name: 'b') }

      describe 'w/o a given project' do
        it 'renders a 404 Not Found page' 

      end

      describe 'w/ a different project' do
        let(:other_project)  { FactoryGirl.create(:project, identifier: 'other') }

        it 'raises ActiveRecord::RecordNotFound errors' 

      end

      describe 'w/ a proper project' do
        describe 'w/o being a member or administrator' do
          become_non_member

          it 'renders a 403 Forbidden page' 

        end

        describe 'w/ the current user being a member' do
          become_member_with_all_permissions

          it 'assigns the timeline' 

        end
      end
    end
  end

  describe 'index.html' do
    def fetch(options = {})
      get 'index', params: options
    end
    it_should_behave_like 'all actions related to all timelines within a project'

    describe 'w/ a known project' do
      let(:project) { FactoryGirl.create(:project, identifier: 'test_project') }

      describe 'w/ the current user having view_timelines permissions' do
        become_member_with_all_permissions

        describe 'w/o any timelines within the project' do
          it 'redirects to /new' 

        end

        describe 'w/ 3 timelines within the project' do
          before do
            @created_timelines = [
              FactoryGirl.create(:timelines, project_id: project.id, name: 'b'),
              FactoryGirl.create(:timelines, project_id: project.id, name: 'c'),
              FactoryGirl.create(:timelines, project_id: project.id, name: 'a')
            ]
          end

          it 'redirects to first (in alphabetical order) timeline' 

        end
      end
    end
  end

  describe 'new.html' do
    def fetch(options = {})
      get 'new', params: options
    end

    it_should_behave_like 'all actions related to all timelines within a project'

    describe 'w/ a known project' do
      become_member_with_edit_permissions

      let(:project) { FactoryGirl.create(:project, identifier: 'test_project') }

      it 'renders the new template' 


      it 'assigns a new timeline instance for the current project' 

    end
  end

  describe 'create.html' do
    def fetch(options = {})
      post 'create', params: options
    end

    it_should_behave_like 'all actions related to all timelines within a project'

    describe 'w/ a known project' do
      become_member_with_edit_permissions

      let(:project) { FactoryGirl.create(:project, identifier: 'test_project') }

      describe 'w/ proper parameters' do
        it 'create a new timelines instance' 


        it 'redirects to show' 


        it 'notifies the user about the successful creation' 

      end

      describe 'w/o proper parameters' do
        it 'does not save the new timelines instance' 


        it 'renders the create action' 


        it 'assigns the unsaved timeline instance for the view to access it' 

      end
    end
  end

  describe 'show.html' do
    def fetch(options = {})
      get 'show', params: options
    end

    it_should_behave_like 'all actions related to an existing timeline'

    describe 'w/ everything set up' do
      let(:project)  { FactoryGirl.create(:project, identifier: 'test_project') }
      let(:timeline) { FactoryGirl.create(:timelines, project_id: project.id, name: 'b') }
      let(:other_timelines) {
        [FactoryGirl.create(:timelines, project_id: project.id, name: 'c'),
         FactoryGirl.create(:timelines, project_id: project.id, name: 'a')]
      }

      become_member_with_view_permissions

      it 'assigns the visible_timelines array' 


      describe 'visible_timelines array' do
        it 'is sorted alphabetically by name' 

      end

      it 'renders the show template' 

    end
  end

  describe 'edit.html' do
    def fetch(options = {})
      get 'edit', params: options
    end

    it_should_behave_like 'all actions related to an existing timeline'

    describe 'w/ everything set up' do
      become_member_with_edit_permissions

      let(:project)  { FactoryGirl.create(:project, identifier: 'test_project') }
      let(:timeline) { FactoryGirl.create(:timelines, project_id: project.id, name: 'b') }

      it 'renders the edit template' 

    end
  end

  describe 'update.html' do
    def fetch(options = {})
      post 'update', params: options
    end

    it_should_behave_like 'all actions related to an existing timeline'

    describe 'w/ everything set up' do
      become_member_with_edit_permissions

      let(:project)  { FactoryGirl.create(:project, identifier: 'test_project') }
      let(:timeline) { FactoryGirl.create(:timelines, project_id: project.id, name: 'b') }

      describe 'w/ proper parameters' do
        it 'updates the existing timelines instance' 


        it 'redirects to show' 


        it 'notifies the user about the successful update' 

      end

      describe 'w/o proper parameters' do
        it 'does not save the edited timelines instance' 


        it 'renders the edit action' 


        it 'assigns the unsaved timeline instance for the view to access it' 

      end
    end
  end

  describe 'confirm_destroy.html' do
    def fetch(options = {})
      get 'confirm_destroy', params: options
    end

    it_should_behave_like 'all actions related to an existing timeline'

    describe 'w/ everything set up' do
      become_member_with_delete_permissions

      let(:project)  { FactoryGirl.create(:project, identifier: 'test_project') }
      let(:timeline) { FactoryGirl.create(:timelines, project_id: project.id, name: 'b') }

      it 'renders the confirm_destroy action' 

    end
  end

  describe 'destroy.html' do
    def fetch(options = {})
      post 'destroy', params: options
    end

    it_should_behave_like 'all actions related to an existing timeline'

    describe 'w/ everything set up' do
      become_member_with_delete_permissions

      let(:project)  { FactoryGirl.create(:project, identifier: 'test_project') }
      let(:timeline) { FactoryGirl.create(:timelines, project_id: project.id, name: 'b') }

      it 'deletes the existing timelines instance' 


      it 'redirects to index' 


      it 'notifies the user about the successful deletion' 

    end
  end
end

