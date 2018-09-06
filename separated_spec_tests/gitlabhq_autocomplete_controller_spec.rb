require 'spec_helper'

describe AutocompleteController do
  let(:project) { create(:project) }
  let(:user) { project.owner }

  context 'GET users' do
    let!(:user2) { create(:user) }
    let!(:non_member) { create(:user) }

    context 'project members' do
      before do
        sign_in(user)
      end

      describe 'GET #users with project ID' do
        before do
          get(:users, project_id: project.id)
        end

        it 'returns the project members' 

      end

      describe 'GET #users with unknown project' do
        before do
          get(:users, project_id: 'unknown')
        end

        it { expect(response).to have_gitlab_http_status(404) }
      end
    end

    context 'group members' do
      let(:group) { create(:group) }

      before do
        group.add_owner(user)
        sign_in(user)
      end

      describe 'GET #users with group ID' do
        before do
          get(:users, group_id: group.id)
        end

        it 'returns the group members' 

      end

      describe 'GET #users with unknown group ID' do
        before do
          get(:users, group_id: 'unknown')
        end

        it { expect(response).to have_gitlab_http_status(404) }
      end
    end

    context 'non-member login for public project' do
      let(:project) { create(:project, :public) }

      before do
        sign_in(non_member)
      end

      describe 'GET #users with project ID' do
        before do
          get(:users, project_id: project.id, current_user: true)
        end

        it 'returns the project members and non-members' 

      end
    end

    context 'all users' do
      before do
        sign_in(user)
        get(:users)
      end

      it { expect(json_response).to be_kind_of(Array) }
      it { expect(json_response.size).to eq User.count }
    end

    context 'user order' do
      it 'shows exact matches first' 

    end

    context 'limited users per page' do
      before do
        25.times do
          create(:user)
        end

        sign_in(user)
        get(:users)
      end

      it { expect(json_response).to be_kind_of(Array) }
      it { expect(json_response.size).to eq(20) }
    end

    context 'unauthenticated user' do
      let(:public_project) { create(:project, :public) }

      describe 'GET #users with public project' do
        before do
          public_project.add_guest(user)
          get(:users, project_id: public_project.id)
        end

        it { expect(json_response).to be_kind_of(Array) }
        it { expect(json_response.size).to eq 2 }
      end

      describe 'GET #users with project' do
        before do
          get(:users, project_id: project.id)
        end

        it { expect(response).to have_gitlab_http_status(404) }
      end

      describe 'GET #users with unknown project' do
        before do
          get(:users, project_id: 'unknown')
        end

        it { expect(response).to have_gitlab_http_status(404) }
      end

      describe 'GET #users with inaccessible group' do
        before do
          project.add_guest(user)
          get(:users, group_id: user.namespace.id)
        end

        it { expect(response).to have_gitlab_http_status(404) }
      end

      describe 'GET #users with no project' do
        before do
          get(:users)
        end

        it { expect(json_response).to be_kind_of(Array) }
        it { expect(json_response).to be_empty }
      end

      describe 'GET #users with todo filter' do
        it 'gives an array of users' 

      end
    end

    context 'author of issuable included' do
      context 'authenticated' do
        before do
          sign_in(user)
        end

        it 'includes the author' 


        it 'rejects non existent user ids' 

      end

      context 'without authenticating' do
        it 'returns empty result' 

      end
    end

    context 'skip_users parameter included' do
      before do
        sign_in(user)
      end

      it 'skips the user IDs passed' 

    end
  end

  context 'GET projects' do
    let(:authorized_project) { create(:project) }
    let(:authorized_search_project) { create(:project, name: 'rugged') }

    before do
      sign_in(user)
      project.add_master(user)
    end

    context 'authorized projects' do
      before do
        authorized_project.add_master(user)
      end

      describe 'GET #projects with project ID' do
        before do
          get(:projects, project_id: project.id)
        end

        it 'returns projects' 

      end
    end

    context 'authorized projects and search' do
      before do
        authorized_project.add_master(user)
        authorized_search_project.add_master(user)
      end

      describe 'GET #projects with project ID and search' do
        before do
          get(:projects, project_id: project.id, search: 'rugged')
        end

        it 'returns projects' 

      end
    end

    context 'authorized projects apply limit' do
      before do
        authorized_project2 = create(:project)
        authorized_project3 = create(:project)

        authorized_project.add_master(user)
        authorized_project2.add_master(user)
        authorized_project3.add_master(user)

        stub_const 'MoveToProjectFinder::PAGE_SIZE', 2
      end

      describe 'GET #projects with project ID' do
        before do
          get(:projects, project_id: project.id)
        end

        it 'returns projects' 

      end
    end

    context 'authorized projects with offset' do
      before do
        authorized_project2 = create(:project)
        authorized_project3 = create(:project)

        authorized_project.add_master(user)
        authorized_project2.add_master(user)
        authorized_project3.add_master(user)
      end

      describe 'GET #projects with project ID and offset_id' do
        before do
          get(:projects, project_id: project.id, offset_id: authorized_project.id)
        end

        it 'returns projects' 

      end
    end

    context 'authorized projects without admin_issue ability' do
      before do
        authorized_project.add_guest(user)

        expect(user.can?(:admin_issue, authorized_project)).to eq(false)
      end

      describe 'GET #projects with project ID' do
        before do
          get(:projects, project_id: project.id)
        end

        it 'returns no projects' 

      end
    end
  end

  context 'GET award_emojis' do
    let(:user2) { create(:user) }
    let!(:award_emoji1) { create_list(:award_emoji, 2, user: user, name: 'thumbsup') }
    let!(:award_emoji2) { create_list(:award_emoji, 1, user: user, name: 'thumbsdown') }
    let!(:award_emoji3) { create_list(:award_emoji, 3, user: user, name: 'star') }
    let!(:award_emoji4) { create_list(:award_emoji, 1, user: user, name: 'tea') }

    context 'unauthorized user' do
      it 'returns empty json' 

    end

    context 'sign in as user without award emoji' do
      it 'returns empty json' 

    end

    context 'sign in as user with award emoji' do
      it 'returns json sorted by name count' 

    end
  end
end

