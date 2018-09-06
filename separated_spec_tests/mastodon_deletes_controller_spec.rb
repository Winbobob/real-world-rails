require 'rails_helper'

describe Settings::DeletesController do
  render_views

  describe 'GET #show' do
    context 'when signed in' do
      let(:user) { Fabricate(:user) }

      before do
        sign_in user, scope: :user
      end

      it 'renders confirmation page' 

    end

    context 'when not signed in' do
      it 'redirects' 

    end
  end

  describe 'DELETE #destroy' do
    context 'when signed in' do
      let(:user) { Fabricate(:user, password: 'petsmoldoggos') }

      before do
        sign_in user, scope: :user
      end

      context 'with correct password' do
        before do
          delete :destroy, params: { form_delete_confirmation: { password: 'petsmoldoggos' } }
        end

        it 'redirects to sign in page' 


        it 'removes user record' 


        it 'marks account as suspended' 

      end

      context 'with incorrect password' do
        before do
          delete :destroy, params: { form_delete_confirmation: { password: 'blaze420' } }
        end

        it 'redirects back to confirmation page' 

      end
    end

    context 'when not signed in' do
      it 'redirects' 

    end

    context do
      around do |example|
        open_deletion = Setting.open_deletion
        example.run
        Setting.open_deletion = open_deletion
      end

      it 'redirects' 

    end
  end
end

