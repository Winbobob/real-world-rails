# frozen_string_literal: true

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user1) }
  let(:category) { create(:category, user_id: user.id) }
  let(:other_category) { create(:category, user_id: user.id + 1) }
  let(:valid_category_params) { attributes_for(:category).merge(user_id: user.id) }
  let(:invalid_category_params) { { name: nil, description: nil } }

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
      context 'when the user created the category' do
        before { get :show, params: { id: category.id } }
        it 'renders the page' 

      end
      context "when the user didn't create the category" do
        before { get :show, params: { id: other_category.id } }
        it 'redirects to the categories index page' 

      end
    end
    context 'when the user is not logged in' do
      before { get :show, params: { id: category.id } }
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
      context 'user is trying to edit a category they created' do
        it 'renders the edit form' 

      end
      context 'user is trying to edit a category another user created' do
        it 'redirects to the category path' 

      end
    end
    context 'when the user is not logged in' do
      before { get :edit, params: { id: category.id } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST #create' do
    context 'when the user is logged in' do
      include_context :logged_in_user
      context 'when valid params are supplied' do
        it 'creates a new category' 

        it 'redirects to the category page' 

      end
      context 'when invalid params are supplied' do
        before { post :create, params: { category: invalid_category_params } }
        it 're-renders the creation form' 

        it 'adds errors to the category ivar' 

      end

      context 'when the user_id is hacked' do
        it 'creates a new category, ignoring the user_id parameter' 

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
      it 'creates 4 premade categories' 

      it 'redirects to the category index page' 

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
        before { patch :update, params: { id: category.id, category: valid_update_params } }
        it 'updates the category' 

        it 'redirects to the category page' 

      end
      context 'when invalid params are supplied' do
        before { patch :update, params: { id: category.id, category: invalid_update_params } }
        it 're-renders the edit form' 

        it 'adds errors to the category ivar' 

      end
    end
    context 'when the user is not logged in' do
      before { patch :update, params: { id: category.id } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'DELETE #destroy' do
    let!(:moment) { create(:moment, user_id: user.id, category: [category.id]) }
    let!(:strategy) { create(:strategy, comment: false, name: 'a', description: 'b', user_id: user.id, category: [category.id]) }

    context 'when the user is logged in' do
      include_context :logged_in_user
      it 'deletes the category' 

      it 'removes categories from existing moments' 

      it 'removes categories from existing strategies' 

      it 'redirects to the category index page' 

    end
    context 'when the user is not logged in' do
      before { delete :destroy, params: { id: category.id } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST #quick_create' do
    context 'when the user is logged in' do
      include_context :logged_in_user
      context 'when valid params are supplied' do
        it 'creates the category' 

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

