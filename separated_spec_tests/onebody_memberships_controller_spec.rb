require 'rails_helper'

describe MembershipsController, type: :controller do
  describe '#show' do
    let(:group) { FactoryGirl.create(:group) }
    let(:person) { FactoryGirl.create(:person) }
    let!(:membership) { group.memberships.create!(person: person) }

    context 'given email param' do
      before do
        get :show,
            params: { group_id: group.id, id: person.id, email: 'off' },
            session: { logged_in_id: person.id }
      end

      it 'renders the email template' 

    end
  end

  describe '#index' do
    let(:user) { FactoryGirl.create(:person) }

    context 'user is a group member' do
      let(:group) { FactoryGirl.create(:group) }
      let!(:membership) { group.memberships.create!(person: user) }

      before do
        get :index,
            params: { group_id: group.id },
            session: { logged_in_id: user.id }
      end

      it 'assigns memberships' 


      it 'assigns membership requests' 

    end

    context 'user is not a group member and group is private' do
      let(:group) { FactoryGirl.create(:group, private: true) }

      before do
        get :index,
            params: { group_id: group.id },
            session: { logged_in_id: user.id }
      end

      it 'renders unauthorized' 

    end
  end

  describe '#create' do
    context 'group requires approval' do
      let(:group) { FactoryGirl.create(:group, approval_required_to_join: true) }

      context 'user is an admin' do
        let(:user) { FactoryGirl.create(:person, :admin_manage_groups) }

        before do
          request.env['HTTP_REFERER'] = group_memberships_path(group)
          post :create,
               params: {
                 group_id: group.id,
                 id: user.id
               },
               session: { logged_in_id: user.id }
        end

        it 'creates the membership' 


        it 'redirects back' 

      end

      context 'user is not an admin' do
        let(:user) { FactoryGirl.create(:person) }

        before do
          request.env['HTTP_REFERER'] = group_memberships_path(group)
          post :create,
               params: {
                 group_id: group.id,
                 id: user.id
               },
               session: { logged_in_id: user.id }
        end

        it 'creates a membership request' 


        it 'redirects back' 

      end
    end

    context 'group does not require approval' do
      let(:group) { FactoryGirl.create(:group, approval_required_to_join: false) }
      let(:user) { FactoryGirl.create(:person) }

      before do
        request.env['HTTP_REFERER'] = group_memberships_path(group)
        post :create,
             params: {
               group_id: group.id,
               id: user.id
             },
             session: { logged_in_id: user.id }
      end

      it 'creates the membership' 


      it 'redirects back' 

    end
  end

  describe '#update' do
    let(:group)       { FactoryGirl.create(:group) }
    let(:person)      { FactoryGirl.create(:person) }
    let!(:membership) { group.memberships.create!(person: person) }

    context 'PUT with param email=on' do
      context do
        before do
          put :update,
              params: {
                group_id: group.id,
                id: person.id,
                email: 'on',
                format: :js
              },
              session: {
                logged_in_id: person.id
              },
              xhr: true
        end

        it 'enables email for the person' 


        it 'renders the update template' 

      end

      context 'user is a different user' do
        let(:user) { FactoryGirl.create(:person) }

        before do
          put :update,
              params: {
                group_id: group.id,
                id: person.id,
                email: 'on',
                format: :js
              },
              session: {
                logged_in_id: user.id
              },
              xhr: true
        end

        it 'renders unauthorized' 

      end

      context 'user is a group admin' do
        let(:user) { FactoryGirl.create(:person, :admin_manage_groups) }

        before do
          put :update,
              params: {
                group_id: group.id,
                id: person.id,
                email: 'on',
                format: :js
              },
              session: {
                logged_in_id: user.id
              },
              xhr: true
        end

        it 'returns success' 

      end
    end

    context 'PUT with param email=off' do
      before do
        put :update,
            params: {
              group_id: group.id,
              id: person.id,
              email: 'off',
              format: :js
            },
            session: {
              logged_in_id: person.id
            },
            xhr: true
      end

      it 'disables email for the person' 


      it 'renders the update template' 

    end

    context 'PUT with param promote=true' do
      context 'user is an admin' do
        let(:user) { FactoryGirl.create(:person, :admin_manage_groups) }

        before do
          request.env['HTTP_REFERER'] = group_memberships_path(group)
          put :update,
              params: {
                group_id: group.id,
                id: membership.id,
                promote: 'true',
                format: :js
              },
              session: {
                logged_in_id: user.id
              },
              xhr: true
        end

        it 'makes the person a group admin' 


        it 'renders the js template' 

      end

      context 'user is not an admin' do
        before do
          request.env['HTTP_REFERER'] = group_memberships_path(group)
          put :update,
              params: {
                group_id: group.id,
                id: membership.id,
                promote: 'true',
                format: :js
              },
              session: {
                logged_in_id: person.id
              },
              xhr: true
        end

        it 'renders unauthorized' 

      end
    end

    context 'PUT with param promote=false' do
      context 'user is an admin' do
        let(:user) { FactoryGirl.create(:person, :admin_manage_groups) }

        before do
          request.env['HTTP_REFERER'] = group_memberships_path(group)
          put :update,
              params: {
                group_id: group.id,
                id: membership.id,
                promote: 'false',
                format: :js
              },
              session: {
                logged_in_id: user.id
              },
              xhr: true
        end

        it 'makes the person a regular group member' 


        it 'renders the js template' 

      end
    end
  end

  describe '#destroy' do
    let(:group)       { FactoryGirl.create(:group) }
    let(:person)      { FactoryGirl.create(:person) }
    let!(:membership) { group.memberships.create!(person: person) }

    context do
      before do
        delete :destroy,
               params: {
                 group_id: group.id,
                 id: person.id,
                 format: :js
               },
               session: {
                 logged_in_id: person.id
               },
               xhr: true
      end

      it 'destroys the membership' 


      it 'renders the destroy template' 

    end

    context 'person is last admin' do
      let!(:membership) { group.memberships.create!(person: person, admin: true) }

      before do
        delete :destroy,
               params: {
                 group_id: group.id,
                 id: person.id,
                 format: :js
               },
               session: {
                 logged_in_id: person.id
               },
               xhr: true
      end

      it 'does not destroy the membership' 


      it 'sets a flash message' 

    end
  end

  describe '#batch' do
    let(:group)  { FactoryGirl.create(:group) }
    let(:user)   { FactoryGirl.create(:person, :admin_manage_groups) }
    let(:person) { FactoryGirl.create(:person) }

    context 'given an existing membership request' do
      let!(:membership_request) { person.membership_requests.create!(group: group) }

      context 'POST' do
        before do
          post :batch,
               params: { group_id: group.id, ids: [person.id], format: :js },
               session: { logged_in_id: user.id },
               xhr: true
        end

        it 'creates membership records for each id given' 


        it 'destroys existing membership requests' 


        it 'renders the batch template with added memberships' 

      end

      context 'POST commit=ignore' do
        before do
          post :batch,
               params: {
                 group_id: group.id,
                 ids: [person.id],
                 commit: 'ignore',
                 format: :js
               },
               session: {
                 logged_in_id: user.id
               },
               xhr: true
        end

        it 'does not create new membership records' 


        it 'destroys existing membership requests' 


        it 'renders the batch template with no added memberships' 

      end

      context 'DELETE' do
        let!(:membership) { group.memberships.create!(person: person) }

        before do
          delete :batch,
                 params: {
                   group_id: group.id,
                   ids: [person.id],
                   format: :js
                 },
                 session: {
                   logged_in_id: user.id
                 },
                 xhr: true
        end

        it 'destroys memberships' 


        it 'renders the batch template with no added memberships' 

      end

      context 'DELETE when person is last admin' do
        let!(:membership) { group.memberships.create!(person: person, admin: true) }

        before do
          delete :batch,
                 params: {
                   group_id: group.id,
                   ids: [person.id],
                   format: :js
                 },
                 session: {
                   logged_in_id: user.id
                 },
                 xhr: true
        end

        it 'does not destroy the membership of the last admin' 


        it 'renders the batch template with no added memberships' 

      end

      context 'POST when user is not a group admin' do
        let(:user) { FactoryGirl.create(:person) }

        before do
          post :batch,
               params: { group_id: group.id, ids: [person.id], format: :js },
               session: { logged_in_id: user.id },
               xhr: true
        end

        render_views

        it 'renders unauthorized' 

      end
    end
  end
end

