require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  let(:manager)           { create :manager }
  let(:user_on_my_team)   { create :user, office: manager.office }
  let(:user_not_my_team)  { create :user }

  context 'manager' do

    before do
      User.delete_all
      Office.delete_all
      Jurisdiction.delete_all
      create_list :user, 2, office: manager.office
      create_list :user, 2, office: create(:office)
      sign_in manager
    end

    it_behaves_like 'a user regardless of role'

    describe 'GET #index' do
      describe 'only shows users from the current_users office' do
        before { get :index }

        it { expect(assigns(:users).count).to eq 3 }
        it { expect(User.count).to eq 5 }
      end

      describe 'does not show admins assigned to their office' do
        before do
          create :admin_user, office: manager.office
          get :index
        end

        it { expect(User.count).to eq 6 }
        it { expect(assigns(:users).count).to eq 3 }
      end
    end

    describe 'GET #show' do
      context 'for a user in their office' do

        before { get :show, id: user_on_my_team.to_param }

        it 'renders the view' 


        it 'returns a success code' 

      end

      context 'for a user not in their office' do
        it 'returns a pundit error' 

      end
    end

    describe 'GET #edit' do
      context 'role' do
        before do
          sign_in manager
          get :edit, id: manager.to_param
        end

        it 'shows them their role' 

      end

      context 'for a user not in their office' do
        it 'returns a pundit error' 

      end

      context 'for a user in their office' do
        it 'shows edit page' 

      end
    end

    describe 'GET #deleted' do
      it 'raises a CanCan error' 


    end
    describe 'PUT #update' do

      context 'role escalation' do
        context 'when trying to escalate their own role' do
          it 'raises Pundit error' 

        end

        context "when trying to escalate their office's user role" do
          context 'to manager' do
            before do
              post :update, id: user_on_my_team.id, user: { role: 'manager' }
              user_on_my_team.reload
            end

            it 'does escalate their role' 

          end

          context 'to admin' do
            it 'raises Pundit error' 

          end
        end

        context 'when trying to escalates a role of a user that is not their own' do
          it 'raises Pundit error' 

        end
      end

      context 'with valid params and a new email' do
        let(:new_attributes) {
          {
            email: 'new_attributes@hmcts.gsi.gov.uk',
            role: 'user',
            office_id: manager.office_id
          }
        }

        before { put :update, id: user_on_my_team.to_param, user: new_attributes }

        it "doesn't update the user's email" 


        it 'assigns the requested user as @user' 


        it 'redirects to the user' 


        context 'and changing office and role' do
          let(:new_office) { create(:office) }
          let(:role) { 'user' }

          before do
            put :update, id: user_on_my_team.to_param, user: { office_id: new_office.id, role: role }
          end

          describe 'updates the user' do
            before { user_on_my_team.reload }

            it { expect(user_on_my_team.office_id).to eq new_office.id }
            it { expect(user_on_my_team.role).to eq role }
          end

          it 'returns a redirect status' 


          it 'redirects to the user list' 


          it 'displays an alert containing contact details for the new manager' 

        end
      end

      context 'with invalid params' do

        before { put :update, id: user_on_my_team.to_param, user: attributes_for(:invalid_user) }

        it 'assigns the user as @user' 


        it 're-renders the "edit" template' 

      end
    end
  end
end

