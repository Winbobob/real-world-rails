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

describe WorkPackages::MovesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:role) do
    FactoryBot.create :role,
                      permissions: %i(move_work_packages
                                       view_work_packages
                                       add_work_packages
                                       edit_work_packages
                                       manage_subtasks)
  end
  let(:type) { FactoryBot.create :type }
  let(:type_2) { FactoryBot.create :type }
  let!(:status) { FactoryBot.create :default_status }
  let(:target_status) { FactoryBot.create :status }
  let(:priority) { FactoryBot.create :priority }
  let(:target_priority) { FactoryBot.create :priority }
  let(:project) do
    FactoryBot.create(:project,
                      is_public: false,
                      types: [type, type_2])
  end
  let(:work_package) do
    FactoryBot.create(:work_package,
                      project_id: project.id,
                      type: type,
                      author: user,
                      priority: priority)
  end

  let(:current_user) { FactoryBot.create(:user) }

  before do
    allow(User).to receive(:current).and_return current_user
  end

  describe 'new.html' do
    become_admin

    describe 'w/o a valid planning element id' do
      describe 'w/o being a member or administrator' do
        become_non_member

        it 'renders a 404 page' 

      end

      describe 'w/ the current user being a member' do
        become_member_with_view_planning_element_permissions

        it 'raises ActiveRecord::RecordNotFound errors' 

      end
    end

    describe 'w/ a valid planning element id' do
      become_admin

      describe 'w/o being a member or administrator' do
        become_non_member

        it 'renders a 403 Forbidden page' 

      end

      describe 'w/ the current user being a member' do
        become_member_with_move_work_package_permissions

        before do
          get 'new', params: { work_package_id: work_package.id }
        end

        it 'renders the new builder template' 

      end
    end
  end

  describe '#create' do
    let!(:source_member) { FactoryBot.create(:member, user: current_user, project: project, roles: [role]) }
    let!(:target_member) { FactoryBot.create(:member, user: current_user, project: target_project, roles: [role]) }
    let(:target_project) { FactoryBot.create(:project, is_public: false) }
    let(:work_package_2) {
      FactoryBot.create(:work_package,
                        project_id: project.id,
                        type: type_2,
                        priority: priority)
    }

    describe 'an issue to another project' do
      context 'w/o following' do
        before do
          status
        end

        subject do
          post :create,
               params: {
                 work_package_id: work_package.id,
                 new_project_id: target_project.id,
                 type_id: '',
                 author_id: user.id,
                 assigned_to_id: '',
                 responsible_id: '',
                 status_id: '',
                 start_date: '',
                 due_date: ''
               }
        end

        it "redirects to the project's work packages page" 

      end

      context 'with following' do
        subject do
          post :create,
               params: {
                 work_package_id: work_package.id,
                 new_project_id: target_project.id,
                 new_type_id: target_project.types.first.id,
                 assigned_to_id: '',
                 responsible_id: '',
                 status_id: '',
                 start_date: '',
                 due_date: '',
                 follow: '1'
               }
        end

        it 'redirects to the work package page' 

      end
    end

    describe 'bulk move' do
      context 'with two work packages' do
        before do
          # make sure, that the types of the work-packages are available on the target-project
          # (and handle it/test it, when this is not the case see #1868)
          target_project.types << [work_package.type, work_package_2.type]
          target_project.save

          post :create,
               params: {
                 ids: [work_package.id, work_package_2.id],
                 new_project_id: target_project.id
               }
          work_package.reload
          work_package_2.reload
        end

        it 'project id is changed for both work packages' 


        it 'changed no types' 

      end

      context 'to another type' do
        before do
          post :create,
               params: {
                 ids: [work_package.id, work_package_2.id],
                 new_type_id: type_2.id
               }
          work_package.reload
          work_package_2.reload
        end

        it "changed work packages' types" 

      end

      context 'with another priority' do
        before do
          post :create,
               params: {
                 ids: [work_package.id, work_package_2.id],
                 priority_id: target_priority.id
               }
          work_package.reload
          work_package_2.reload
        end

        it "changed work packages' priority" 

      end

      shared_examples_for 'single note for moved work package' do
        it { expect(moved_work_package.journals.count).to eq(2) }

        it { expect(moved_work_package.journals.sort_by(&:id).last.notes).to eq(note) }
      end

      describe 'move with given note' do
        let(:note) { 'Moving a work package' }

        context 'w/o work package changes' do
          before do
            post :create,
                 params: {
                   ids: [work_package.id],
                   notes: note
                 }
          end

          it_behaves_like 'single note for moved work package' do
            let(:moved_work_package) { work_package.reload }
          end
        end

        context 'w/o work package changes' do
          before do
            post :create,
                 params: {
                   ids: [work_package.id],
                   notes: note,
                   priority_id: target_priority.id
                 }
          end

          it_behaves_like 'single note for moved work package' do
            let(:moved_work_package) { work_package.reload }
          end
        end
      end

      describe '&copy' do
        context 'follows to another project' do
          before do
            post :create,
                 params: {
                   ids: [work_package.id],
                   copy: '',
                   new_project_id: target_project.id,
                   new_type_id: target_project.types.first.id, # FIXME see #1868
                   follow: ''
                 }
          end

          it 'redirects to the work package copy' 

        end

        context "w/o changing the work package's attribute" do
          before do
            post :create,
                 params: {
                   ids: [work_package.id],
                   copy: '',
                   new_project_id: target_project.id
                 }
          end

          subject { WorkPackage.order('id desc').where(project_id: project.id).first }

          it 'did not change the type' 


          it 'did not change the status' 


          it 'did not change the assignee' 


          it 'did not change the responsible' 

        end

        context "with changing the work package's attribute" do
          let(:start_date) { Date.today }
          let(:due_date) { Date.today + 1 }
          let(:target_user) do
            user = FactoryBot.create :user

            FactoryBot.create(:member,
                              user: user,
                              project: target_project,
                              roles: [role])

            user
          end

          before do
            post :create,
                 params: {
                   ids: [work_package.id, work_package_2.id],
                   copy: '',
                   new_project_id: target_project.id,
                   new_type_id: target_project.types.first.id, # FIXME see #1868
                   assigned_to_id: target_user.id,
                   responsible_id: target_user.id,
                   status_id: target_status,
                   start_date: start_date,
                   due_date: due_date
                 }
          end

          subject { WorkPackage.limit(2).order('id desc').where(project_id: target_project.id) }

          it 'copied two work packages' 


          it 'did change the project' 


          it 'did change the assignee' 


          it 'did change the responsible' 


          it 'did change the status' 


          it 'did change the start date' 


          it 'did change the end date' 

        end

        context 'with given note' do
          let(:note) { 'Copying a work package' }

          before do
            post :create,
                 params: {
                   ids: [work_package.id],
                   copy: '',
                   notes: note
                 }
          end

          subject { WorkPackage.limit(1).order('id desc').last.journals }

          it { expect(subject.count).to eq(1) }

          it { expect(subject.last.notes).to eq(note) }
        end

        context 'parent and child work package' do
          let!(:child_wp) do
            FactoryBot.create(:work_package,
                              type: type,
                              project: project,
                              parent: work_package)
          end

          before do
            allow(User).to receive(:current).and_return(current_user)
          end

          context 'on new' do
            before do
              get :new,
                  params: {
                    ids: [work_package.id, child_wp.id],
                    copy: '',
                    new_project_id: to_project.id,
                  }

              it 'reports the one child work package' 

            end
          end

          context 'on create' do
            it 'only copies the parent work package' 

          end
        end

        context 'child work package from one project to other' do
          let(:to_project) do
            FactoryBot.create(:project,
                              types: [type])
          end
          let!(:member) do
            FactoryBot.create(:member,
                              user: current_user,
                              roles: [role],
                              project: to_project)
          end
          let!(:child_wp) do
            FactoryBot.create(:work_package,
                              type: type,
                              project: project,
                              parent: work_package)
          end

          shared_examples_for 'successful move' do
            it { expect(flash[:notice]).to eq(I18n.t(:notice_successful_create)) }
          end

          before do
            allow(User).to receive(:current).and_return(current_user)

            def self.copy_child_work_package
              post :create,
                   params: {
                     ids: [child_wp.id],
                     copy: '',
                     new_project_id: to_project.id,
                     work_package_id: child_wp.id,
                     new_type_id: to_project.types.first.id
                   }
            end
          end

          context 'when cross_project_work_package_relations is disabled' do
            before do
              allow(Setting).to receive(:cross_project_work_package_relations?).and_return(false)

              copy_child_work_package
            end

            it 'is unsuccessful' 

          end

          context 'when cross_project_work_package_relations is enabled' do
            before do
              allow(Setting).to receive(:cross_project_work_package_relations?).and_return(true)

              copy_child_work_package
            end

            it_behaves_like 'successful move'

            it { expect(to_project.work_packages.first.parent).to eq(child_wp.parent) }
          end
        end
      end
    end
  end
end
