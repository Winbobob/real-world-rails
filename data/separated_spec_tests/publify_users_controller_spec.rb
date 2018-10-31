require 'rails_helper'

describe Admin::UsersController, type: :controller do
  let!(:blog) { create :blog }
  let(:admin) { create(:user, :as_admin) }
  let(:publisher) { create(:user, :as_publisher) }
  let(:contributor) { create(:user, :as_contributor) }

  render_views

  describe '#index' do
    let(:user) { admin }

    before do
      sign_in user
    end

    it 'renders a list of users' 


    describe 'when you are not admin' do
      let(:user) { publisher }

      it "don't see the list of user" 

    end
  end

  describe '#new' do
    before do
      sign_in admin
    end

    it 'renders the new template' 

  end

  describe '#create' do
    before do
      sign_in admin
      post :create, params: { user: { login: 'errand', email: 'corey@test.com',
                                      password: 'testpass',
                                      password_confirmation: 'testpass',
                                      profile: User::CONTRIBUTOR,
                                      nickname: 'fooo', firstname: 'bar' } }
    end

    it 'redirects to the index' 

  end

  describe '#update' do
    let(:user) { admin }

    before(:each) do
      sign_in user
    end

    it 'should redirect to index' 


    it 'skips blank passwords' 


    describe 'when you are not admin' do
      let(:user) { publisher }

      before do
        post :update, params: { id: contributor.id, user: { profile: User::PUBLISHER } }
      end

      it 'should redirect to login' 


      it 'should not change user profile' 

    end
  end
end

