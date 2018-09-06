#-- encoding: UTF-8

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
require_relative '../legacy_spec_helper'

describe Project, type: :model do
  fixtures :all

  before do
    FactoryGirl.create(:type_standard)
    @ecookbook = Project.find(1)
    @ecookbook_sub1 = Project.find(3)
    User.current = nil
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :identifier }

  it { is_expected.to validate_uniqueness_of :identifier }

  context 'associations' do
    it { is_expected.to have_many :members                                       }
    it { is_expected.to have_many(:users).through(:members)                      }
    it { is_expected.to have_many :member_principals                             }
    it { is_expected.to have_many(:principals).through(:member_principals)       }
    it { is_expected.to have_many :enabled_modules                               }
    it { is_expected.to have_many :work_packages                                 }
    it { is_expected.to have_many(:work_package_changes).through(:work_packages) }
    it { is_expected.to have_many :versions                                      }
    it { is_expected.to have_many :time_entries                                  }
    it { is_expected.to have_many :queries                                       }
    it { is_expected.to have_many :news                                          }
    it { is_expected.to have_many :categories                                    }
    it { is_expected.to have_many :boards                                        }
    it { is_expected.to have_many(:changesets).through(:repository)              }

    it { is_expected.to have_one :repository                                     }
    it { is_expected.to have_one :wiki                                           }

    it { is_expected.to have_and_belong_to_many :types                           }
    it { is_expected.to have_and_belong_to_many :work_package_custom_fields      }
  end

  it 'should truth' 


  context 'when default public', with_settings: { default_projects_public?: true } do
    it 'should default attributes' 

  end

  context 'when default private', with_settings: { default_projects_public?: false } do
    it 'should default attributes' 

  end

  context 'with sequential identifiers',
          with_settings: { sequential_project_identifiers?: true } do
    it 'should default attributes' 

  end

  context 'with no sequential identifiers',
          with_settings: { sequential_project_identifiers?: false } do
    it 'should default attributes' 

  end

  it 'should update' 


  it 'should validate identifier' 


  it 'should members should be active users' 


  it 'should users should be active users' 


  it 'should archive' 


  it 'should archive should fail if versions are used by non descendant projects' 


  it 'should unarchive' 


  # fails because @ecookbook.issues[5 und 6].destroy fails
  # because ActiveRecord::StaleObjectError
  it 'should destroy' 


  it 'should destroying root projects should clear data' 


  it 'should move an orphan project to a root project' 


  it 'should move an orphan project to a subproject' 


  it 'should move a root project to a project' 


  it 'should not move a project to its children' 


  it 'should set parent should add roots in alphabetical order' 


  it 'should set parent should add children in alphabetical order' 


  it 'should rebuild should sort children alphabetically' 


  it 'should set parent should update issue fixed version associations when a fixed version is moved out of the hierarchy' 


  it 'should parent' 


  it 'should ancestors' 


  it 'should root' 


  it 'should children' 


  it 'should descendants' 


  it 'should allowed parents should be empty for non member user' 


  it 'should allowed parents with add subprojects permission' 


  it 'should allowed parents with add project permission' 


  it 'should allowed parents with add project and subprojects permission' 


  it 'should users by role' 


  it 'should rolled up types' 


  it 'should rolled up types should ignore archived subprojects' 


  context 'description' do
    before do
      # this block unfortunately isn't run
      # move first two lines of next to specs up here
      # when you know that it will work
    end

    it 'should short description returns shortened description' 

  end

  context '#rolled_up_versions' do
    before do
      @project = FactoryGirl.create(:project)
      @parent_version_1 = FactoryGirl.create(:version, project: @project)
      @parent_version_2 = FactoryGirl.create(:version, project: @project)
    end

    it 'should include the versions for the current project' 


    it 'should include versions for a subproject' 


    it 'should include versions for a sub-subproject' 


    it 'should only check active projects' 

  end

  it 'should shared versions none sharing' 


  it 'should shared versions descendants sharing' 


  it 'should shared versions hierarchy sharing' 


  it 'should shared versions tree sharing' 


  it 'should shared versions system sharing' 


  it 'should shared versions' 


  it 'should shared versions should ignore archived subprojects' 


  it 'should shared versions visible to user' 


  it 'should next identifier' 


  it 'should next identifier first project' 


  context 'with modules',
          with_settings: { default_projects_modules: ['work_package_tracking', 'repository'] } do
    it 'should enabled module names' 

  end

  it 'should enabled module names should not recreate enabled modules' 


  it 'should copy from existing project' 


  it 'should activities should use the system activities' 


  it 'should activities should use the project specific activities' 


  it 'should activities should not include the inactive project specific activities' 


  it 'should activities should not include project specific activities from other projects' 


  it 'should activities should handle nils' 


  it 'should activities should override system activities with project activities' 


  it 'should activities should include inactive activities if specified' 


  specify 'activities should not include active System activities if the project has an override that is inactive' do
    project = Project.find(1)
    system_activity = TimeEntryActivity.find_by(name: 'Design')
    assert system_activity.active?
    overridden_activity = FactoryGirl.create(:time_entry_activity, project: project, parent: system_activity, active: false)
    assert overridden_activity.save!

    assert !project.activities.include?(overridden_activity), 'Inactive Project specific Activity not found'
    assert !project.activities.include?(system_activity), 'System activity found when the project has an inactive override'
  end

  it 'should close completed versions' 


  it 'should export work packages is allowed' 


  context 'Project#copy' do
    before do
      ProjectCustomField.destroy_all # Custom values are a mess to isolate in tests
      Project.where(identifier: 'copy-test').destroy_all
      @source_project = Project.find(2)
      @project = Project.new(name: 'Copy Test', identifier: 'copy-test')
      @project.types = @source_project.types
      @project.enabled_module_names = @source_project.enabled_modules.map(&:name)
    end

    it 'should copy work units' 


    it 'should change the new issues to use the copied version' 


    it 'should change the new issues to use the copied closed version' 


    it 'should copy issue relations' 


    it 'should copy memberships' 


    it 'should copy memberships with groups and additional roles' 


    it 'should copy project specific queries' 


    it 'should copy versions' 


    it 'should copy wiki' 


    it 'should copy wiki pages and content with hierarchy' 


    it 'should copy issue categories' 


    it 'should copy boards' 


    it 'should change the new issues to use the copied issue categories' 


    it 'should limit copy with :only option' 

  end

  context '#start_date' do
    before do
      ProjectCustomField.destroy_all # Custom values are a mess to isolate in tests
      @project = FactoryGirl.create(:project, identifier: 'test0')
      @project.types << FactoryGirl.create(:type)
    end

    it 'should be nil if there are no issues on the project' 


    it "should be the earliest start date of it's issues" 

  end

  context '#due_date' do
    before do
      ProjectCustomField.destroy_all # Custom values are a mess to isolate in tests
      @project = FactoryGirl.create(:project, identifier: 'test0')
      @project.types << FactoryGirl.create(:type)
    end

    it 'should be nil if there are no issues on the project' 


    it "should be the latest due date of it's issues" 


    it "should be the latest due date of it's versions" 


    it "should pick the latest date from it's issues and versions" 

  end

  context 'Project#completed_percent' do
    before do
      ProjectCustomField.destroy_all # Custom values are a mess to isolate in tests
      @project = FactoryGirl.create(:project, identifier: 'test0')
      @project.types << FactoryGirl.create(:type)
    end

    context 'no versions' do
      it 'should be 100' 

    end

    context 'with versions' do
      it 'should return 0 if the versions have no issues' 


      it 'should return 100 if the version has only closed issues' 


      it 'should return the averaged completed percent of the versions (not weighted)' 

    end
  end

  context '#notified_users' do
    before do
      @project = FactoryGirl.create(:project)
      @role = FactoryGirl.create(:role)

      @user_with_membership_notification = FactoryGirl.create(:user, mail_notification: 'selected')
      Member.create!(project: @project, principal: @user_with_membership_notification, mail_notification: true) do |member|
        member.role_ids = [@role.id]
      end

      @all_events_user = FactoryGirl.create(:user, mail_notification: 'all')
      Member.create!(project: @project, principal: @all_events_user) do |member|
        member.role_ids = [@role.id]
      end

      @no_events_user = FactoryGirl.create(:user, mail_notification: 'none')
      Member.create!(project: @project, principal: @no_events_user) do |member|
        member.role_ids = [@role.id]
      end

      @only_my_events_user = FactoryGirl.create(:user, mail_notification: 'only_my_events')
      Member.create!(project: @project, principal: @only_my_events_user) do |member|
        member.role_ids = [@role.id]
      end

      @only_assigned_user = FactoryGirl.create(:user, mail_notification: 'only_assigned')
      Member.create!(project: @project, principal: @only_assigned_user) do |member|
        member.role_ids = [@role.id]
      end

      @only_owned_user = FactoryGirl.create(:user, mail_notification: 'only_owner')
      Member.create!(project: @project, principal: @only_owned_user) do |member|
        member.role_ids = [@role.id]
      end
    end

    it 'should include members with a mail notification' 


    it "should include users with the 'all' notification option" 


    it "should not include users with the 'none' notification option" 


    it "should not include users with the 'only_my_events' notification option" 


    it "should not include users with the 'only_assigned' notification option" 


    it "should not include users with the 'only_owner' notification option" 

  end
end

