# frozen_string_literal: true

RSpec.describe MeetingsController, type: :controller do
  describe 'without being logged in' do
    subject { controller }
    # TODO: implement session controller
    # it_behaves_like 'LoggedOut'
    describe 'GET' do
      %w[join leave].each do |action|
        it "#{action} redirects to login" 

      end
    end

    describe 'GET #show' do
      let!(:meeting) { create(:meeting) }
      let(:user) { create(:user) }
      let!(:meeting_member) do
        create(:meeting_member, user: user, meeting: meeting)
      end

      context 'when user is logged in' do
        before { sign_in user }

        context 'included in the meeting' do
          context 'as member' do
            before { get :show, params: { id: meeting.id } }

            it { expect(response).to have_http_status(:ok) }
            it { expect(response).to render_template(:show) }
          end

          context 'as leader' do
            before do
              meeting_member.update(leader: true)
              get :show, params: { id: meeting.id }
            end

            it { expect(response).to have_http_status(:ok) }
            it { expect(response).to render_template(:show) }
          end
        end

        context 'not included in the meeting' do
          before do
            meeting_member.destroy
            get :show, params: { id: meeting.id }
          end

          it { expect(response).to have_http_status(:redirect) }
          it { expect(response).to redirect_to(groups_path) }
        end

        context 'inexistent meeting id' do
          before { get :show, params: { id: 111 } }

          it { expect(response).to have_http_status(:redirect) }
          it { expect(response).to redirect_to(groups_path) }
        end
      end

      context 'when user is logged out' do
        before { get :show, params: { id: meeting.id } }

        it_behaves_like :with_no_logged_in_user
      end
    end
  end

  describe 'GET #new' do
    let!(:user) { create(:user) }
    let!(:group_member) do
      create(:group_member, id: 1, user: user, leader: true)
    end

    context 'when the user is not logged in' do
      before do
        get :new, params: { group_id: group_member.group_id }
      end

      it { expect(response).to redirect_to new_user_session_path }
    end

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'user is the group leader' do
        before do
          get :new, params: { group_id: group_member.group_id }
        end

        it { expect(response).to have_http_status(:ok) }
      end

      context 'user is not the leader' do
        before do
          group_member.update!(leader: false)
          get :new, params: { group_id: group_member.group_id }
        end

        it { expect(response).to redirect_to group_path(group_member.group_id) }
      end
    end
  end

  describe 'GET #edit' do
    let!(:user) { create(:user, id: 1) }
    let(:meeting) { create(:meeting, id: 1) }
    let!(:group_member) { create(:group_member, group_id: meeting.group_id, id: 1, user: user, leader: true) }
    let(:meeting_member) { create(:meeting_member, user: user, meeting: meeting) }

    context 'when the user is not logged in' do
      before do
        get :edit, params: { id: meeting.id }
      end

      it_behaves_like :with_no_logged_in_user
    end

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'user is the group leader' do
        before do
          get :edit, params: { id: meeting.id }
        end
        it { expect(response).to have_http_status(:ok) }
      end

      context 'user is not the group leader' do
        before do
          group_member.update!(leader: false)
          get :edit, params: { id: meeting.id }
        end

        it { expect(response).to redirect_to group_path(group_member.group_id) }
      end
    end
  end

  describe 'POST #create' do
    context 'when the user is not logged in' do
      before { post(:create) }
      it_behaves_like(:with_no_logged_in_user)
    end

    context 'when the user is logged in' do
      include_context(:logged_in_user)

      let(:user) { create(:user) }
      let(:group) do
        create(:group_with_member, user_id: user.id, leader: is_leader)
      end

      context 'and is not the group leader' do
        let(:is_leader) { false }

        it 'redirects to group page' 

      end

      context 'and is the group leader' do
        let(:is_leader) { true }

        context 'and meeting parameters are valid' do
          let(:params) do
            { meeting: build(:meeting, group: group).attributes }
          end

          it 'creates a meeting' 


          it 'set current user as meeting leader' 


          it 'notifies group members' 


          it 'redirecs to group page' 

        end

        context 'and meeting parameters are invalid' do
          let(:params) { { meeting: { group_id: group.id } } }

          it 'does not save the meeting' 


          it 'renders #new' 

        end
      end
    end
  end

  describe 'PATCH/PUT #update' do
    include_context(:logged_in_user)
    let(:user) { create(:user) }

    context 'when meeting is found' do
      let!(:meeting) { create(:meeting) }

      context 'and parameters are valid' do
        let(:params) do
          { id: meeting.id, meeting: { name: 'new_name' } }
        end

        it 'updates meeting' 


        it 'notifies meeting members' 


        it 'redirects to meeting page' 

      end

      context 'and parameters are invalid' do
        let(:params) do
          { id: meeting.id, meeting: { name: '' } }
        end

        it 'renders #edit' 

      end
    end

    context 'when meeting is not found' do
      it 'redirecs to groups page' 

    end
  end

  describe 'GET #join' do
    include_context(:logged_in_user)
    let(:user) { create(:user) }

    context 'when meeting is found' do
      let!(:meeting) { create(:meeting) }

      it 'adds user to meeting members' 


      it 'notifies meeting members' 


      it 'redirects to meeting page' 


      context 'and user has already joined' do
        it 'redirects to group page' 

      end
    end
  end

  describe 'GET #leave' do
    include_context(:logged_in_user)
    let(:user) { create(:user) }

    context 'when meeting is found' do
      let!(:meeting) { create(:meeting) }
      let!(:meeting_member) do
        create(:meeting_member, meeting: meeting, user: user)
      end

      it 'removes user from meeting' 


      it 'redirects to group page' 


      context 'when user is the only leader' do
        before { meeting_member.update_column(:leader, true) }

        it 'redirects to group page' 


        it 'does not removes user' 

      end
    end
  end

  describe 'DELETE #destroy' do
    include_context(:logged_in_user)
    let(:user) { create(:user) }

    context 'when meeting is found' do
      let!(:meeting) { create(:meeting, group: group) }
      let!(:meeting_member) do
        create(:meeting_member, meeting: meeting, user: user)
      end
      let(:group) do
        create(:group_with_member, user_id: user.id, leader: is_leader)
      end

      context 'and user is not the meeting group leader' do
        let(:is_leader) { false }

        it 'redirects to group page' 

      end

      context 'and user is the meeting group leader' do
        let(:is_leader) { true }

        it 'notifies meeting members' 


        it 'removes meeting members' 


        it 'destroys meeting' 


        it 'redirects to group page' 

      end
    end

    context 'when meeting is not found' do
      it 'redirecs to groups page' 

    end
  end
end

