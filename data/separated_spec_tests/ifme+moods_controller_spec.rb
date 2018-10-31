# frozen_string_literal: true

RSpec.describe MoodsController, type: :controller do
  let(:user) { create(:user1) }
  let(:user_mood) { create(:mood, user_id: user.id) }
  let(:other_mood) { create(:mood, user_id: user.id + 1) }
  let(:valid_mood_params) { attributes_for(:mood) }
  let(:invalid_mood_params) { { name: nil, description: nil } }

  describe 'GET #index' do
    context 'when the user is logged in' do
      include_context :logged_in_user
      before { get :index }
      it 'sets the categories and page tooltip ivar' 

      it 'renders the page' 

    end
    context 'when the user is not logged in' do
      before { get :index }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'GET #show' do
    context 'when the user is logged in' do
      include_context :logged_in_user
      context 'when the user created the mood' do
        before { get :show, params: { id: user_mood.id } }
        it 'renders the page' 

      end
      context "when the user didn't create the mood" do
        before { get :show, params: { id: other_mood.id } }
        it 'redirects to the mood index page' 

      end
    end
    context 'when the user is not logged in' do
      before { get :show, params: { id: user_mood.id } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'GET #new' do
    context 'when the user is logged in' do
      include_context :logged_in_user
      it 'renders the page' 

    end
    context 'when the user is not logged in' do
      before { get :new }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'GET #edit' do
    context 'when the user is logged in' do
      include_context :logged_in_user
      context 'user is trying to edit a mood they created' do
        it 'renders the edit form' 

      end
      context 'user is trying to edit a mood another user created' do
        it 'redirects to the mood path' 

      end
    end
    context 'when the user is not logged in' do
      before { get :edit, params: { id: user_mood.id } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST #create' do
    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when valid params are supplied' do
        it 'creates a mood' 

        it 'redirects to the mood page' 

      end

      context 'when invalid params are supplied' do
        before { post :create, params: { mood: invalid_mood_params } }
        it 're-renders the creation form' 

        it 'adds errors to the mood ivar' 

      end

      context 'when the user_id is hacked' do
        it 'creates a new mood, ignoring the user_id parameter' 

      end
    end

    context 'when the user is not logged in' do
      before { post :create }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST #premade' do
    context 'when the user is logged in' do
      include_context :logged_in_user
      it 'creates 5 premade moods' 

      it 'redirects to the mood index page' 

    end
    context 'when the user is not logged in' do
      before { post :premade }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'PATCH/PUT #update' do
    let(:valid_update_params) { { name: 'updated name' } }
    let(:invalid_update_params) { { name: nil } }

    context 'when the user is logged in' do
      include_context :logged_in_user
      context 'when valid params are supplied' do
        before { patch :update, params: { id: user_mood.id, mood: valid_update_params } }
        it 'updates the mood' 

        it 'redirects to the mood page' 

      end
      context 'when invalid params are supplied' do
        before { patch :update, params: { id: user_mood.id, mood: invalid_update_params } }
        it 're-renders the edit form' 

        it 'adds errors to the mood ivar' 

      end
    end
    context 'when the user is not logged in' do
      before { patch :update, params: { id: user_mood.id } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'DELETE #destroy' do
    let!(:moment) { create(:moment, user_id: user.id, mood: [user_mood.id]) }

    context 'when the user is logged in' do
      include_context :logged_in_user
      it 'deletes the mood' 

      it 'removes moods from existing moments' 

      it 'redirects to the mood index page' 

    end
    context 'when the user is not logged in' do
      before { delete :destroy, params: { id: user_mood.id } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST #quick_create' do
    context 'when the user is logged in' do
      include_context :logged_in_user
      context 'when valid params are supplied' do
        it 'creates the mood' 

        it 'responds with a checkbox in json format' 

      end
      context 'when invalid params are supplied' do
        it 'responds with an error in json format' 

      end
    end
    context 'when the user is not logged in' do
      before { post :quick_create }
      it_behaves_like :with_no_logged_in_user
    end
  end
end

