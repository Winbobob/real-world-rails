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

describe ProjectsController, type: :controller do
  before do
    Role.delete_all
    User.delete_all
  end

  before do
    allow(@controller).to receive(:set_localization)

    @role = FactoryBot.create(:non_member)
    @user = FactoryBot.create(:admin)
    allow(User).to receive(:current).and_return @user

    @params = {}
  end

  describe 'show' do
    render_views

    describe 'without wiki' do
      before do
        @project = FactoryBot.create(:project)
        @project.reload # project contains wiki by default
        @project.wiki.destroy
        @project.reload
        @params[:id] = @project.id
      end

      it 'renders show' 


      it 'renders main menu without wiki menu item' 

    end

    describe 'with wiki' do
      before do
        @project = FactoryBot.create(:project)
        @project.reload # project contains wiki by default
        @params[:id] = @project.id
      end

      describe 'without custom wiki menu items' do
        it 'renders show' 


        it 'renders main menu with wiki menu item' 

      end

      describe 'with custom wiki menu item' do
        before do
          main_item = FactoryBot.create(:wiki_menu_item, navigatable_id: @project.wiki.id, name: 'example', title: 'Example Title')
          sub_item = FactoryBot.create(:wiki_menu_item, navigatable_id: @project.wiki.id, name: 'sub', title: 'Sub Title', parent_id: main_item.id)
        end

        it 'renders show' 


        it 'renders main menu with wiki menu item' 


        it 'renders main menu with sub wiki menu item' 

      end
    end

    describe 'with activated activity module' do
      before do
        @project = FactoryBot.create(:project, enabled_module_names: %w[activity])
        @params[:id] = @project.id
      end

      it 'renders show' 


      it 'renders main menu with activity tab' 

    end

    describe 'without activated activity module' do
      before do
        @project = FactoryBot.create(:project, enabled_module_names: %w[wiki])
        @params[:id] = @project.id
      end

      it 'renders show' 


      it 'renders main menu without activity tab' 

    end
  end

  describe 'new' do
    it "renders 'new'" 

  end

  describe 'index.html' do
    let(:project_a) { FactoryBot.create(:project, name: 'Project A', is_public: false, status: true) }
    let(:project_b) { FactoryBot.create(:project, name: 'Project B', is_public: false, status: true) }
    let(:project_c) { FactoryBot.create(:project, name: 'Project C', is_public: true, status: true)  }
    let(:project_d) { FactoryBot.create(:project, name: 'Project D', is_public: true, status: false) }

    let(:projects) { [project_a, project_b, project_c, project_d] }

    before do
      Role.anonymous
      projects
      login_as(user)
      get 'index'
    end

    shared_examples_for 'successful index' do
      it 'is success' 


      it 'renders the index template' 

    end

    context 'as admin' do
      let(:user) { FactoryBot.build(:admin) }

      it_behaves_like 'successful index'

      it "shows all active projects" 

    end

    context 'as anonymous user' do
      let(:user) { User.anonymous }

      it_behaves_like 'successful index'

      it "shows only (active) public projects" 

    end

    context 'as user' do
      let(:user) { FactoryBot.build(:user, member_in_project: project_b) }

      it_behaves_like 'successful index'

      it "shows (active) public projects and those in which the user is member of" 

    end
  end

  describe 'index.html' do
    let(:user) { FactoryBot.build(:admin) }

    before do
      login_as(user)
      get 'index', format: 'atom'
    end

    it 'is 410 GONE' 

  end

  describe 'settings' do
    render_views

    describe '#type' do
      let(:update_service) do
        service = double('update service')

        allow(UpdateProjectsTypesService).to receive(:new).with(project).and_return(service)

        service
      end
      let(:user) { FactoryBot.create(:admin) }
      let(:project) do
        project = FactoryBot.build_stubbed(:project)

        allow(Project).to receive(:find).and_return(project)

        project
      end

      before do
        allow(User).to receive(:current).and_return user
      end

      context 'on success' do
        before do
          expect(update_service).to receive(:call).with([1, 2, 3]).and_return true

          patch :types, params: { id: project.id, project: { 'type_ids' => ['1', '2', '3'] } }
        end

        it 'sets a flash message' 


        it 'redirects to settings#types' 

      end

      context 'on failure' do
        let(:error_message) { 'error message' }

        before do
          expect(update_service).to receive(:call).with([1, 2, 3]).and_return false

          allow(project).to receive_message_chain(:errors, :full_messages).and_return(error_message)

          patch :types, params: { id: project.id, project: { 'type_ids' => ['1', '2', '3'] } }
        end

        it 'sets a flash message' 


        it 'redirects to settings#types' 

      end
    end

    describe '#custom_fields' do
      let(:project) { FactoryBot.create(:project) }
      let(:custom_field_1) { FactoryBot.create(:work_package_custom_field) }
      let(:custom_field_2) { FactoryBot.create(:work_package_custom_field) }

      let(:params) do
        {
          id: project.id,
          project: {
            work_package_custom_field_ids: [custom_field_1.id, custom_field_2.id]
          }
        }
      end

      let(:request) { put :custom_fields, params: params }

      context 'with valid project' do
        before do
          request
        end

        it { expect(response).to redirect_to(settings_project_path(project, 'custom_fields')) }

        it 'sets flash[:notice]' 

      end

      context 'with invalid project' do
        before do
          allow_any_instance_of(Project).to receive(:save).and_return(false)
          request
        end

        it { expect(response).to redirect_to(settings_project_path(project, 'custom_fields')) }

        it 'sets flash[:error]' 

      end
    end
  end
end

