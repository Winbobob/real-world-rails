# frozen_string_literal: true

describe StrategiesController do
  let(:user) { create(:user) }
  let(:strategy) { create(:strategy, user: user) }

  describe 'GET index' do
    let(:strategy) { create(:strategy, name: 'test', user: user) }

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when search params are provided' do
        before { get :index, params: { search: 'test' } }

        it 'assigns @strategies' 


        it 'renders the index template' 

      end

      context 'when no search params are provided' do
        it 'renders the index template' 

      end
    end

    context 'when the user is not logged in' do
      before { get :index }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'GET show' do
    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when the strategy exists' do
        before { get :show, params: { id: strategy.id } }

        it 'sets the strategy' 


        it 'renders the show template' 

      end

      context 'when the strategy does not exist' do
        let(:id) { strategy.id + 1 }

        it 'redirects an html request' 


        it 'renders no content for a json request' 

      end
    end

    context 'when the user is not logged in' do
      before { get :show, params: { id: strategy.id } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST comment' do
    let(:comment) do
      build(:comment, comment_by: user.id, commentable_type: 'strategy')
    end
    let(:valid_comment_params) do
      comment.attributes.merge(
        'commentable_id' => strategy.id, 'visibility' => 'all'
      )
    end
    let(:invalid_comment_params) { comment.attributes }

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when the comment is saved' do
        it 'responds with an OK status' 

      end

      context 'when the comment is not saved' do
        it 'responds with json no_save: true' 

      end
    end

    context 'when the user is not logged in' do
      before { post :comment }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'GET delete_comment' do
    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when the comment exists' do
        let!(:comment) do
          create(
            :comment,
            comment_by: user.id,
            commentable_id: strategy.id,
            visibility: 'all'
          )
        end

        context 'when the comment belongs to the current_user' do
          it 'destroys the comment' 


          it 'renders nothing' 

        end

        context 'when the strategy belongs to the current_user' do
          it 'destroys the comment' 


          it 'renders nothing' 

        end
      end

      context 'when the comment does not exist' do
        it 'renders nothing' 

      end
    end

    context 'when the user is not logged in' do
      before { get :delete_comment }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST premade' do
    let(:user) { create(:user, id: 1) }

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when the request format is html' do
        it 'redirects to the strategies_path' 

      end
    end

    context 'when the user is not logged in' do
      before { post :premade }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST quick_create' do
    context 'when the user is not logged in' do
      before { post :quick_create }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'GET new' do
    let(:user) { create(:user, id: 1) }

    context 'when the user is logged in' do
      include_context :logged_in_user

      it 'renders the new template' 

    end

    context 'when the user is not logged in' do
      before { get :new }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'GET edit' do
    let(:user)        { create(:user, id: 1) }
    let!(:strategy1)  { create(:strategy, userid: 1, id: 1) }
    let!(:strategy2)  { create(:strategy, userid: 2, id: 2) }

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when the strategy belongs to the current user' do
        it 'renders the edit template' 

      end

      context 'when the strategy does not belong to the current user' do
        it 'redirects html requests to the strategy_path' 


        it 'renders nothing for json requests' 

      end
    end

    context 'when the user is not logged in' do
      before { get :edit, params: { id: 2 } }
      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'POST create' do
    let(:user) { create(:user, id: 1) }
    let(:valid_strategy_params) { FactoryBot.attributes_for(:strategy) }
    let(:invalid_strategy_params) { valid_strategy_params.merge(name: nil) }

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when the params are valid' do
        let(:strategy_params) { { strategy: valid_strategy_params } }

        it 'creates a new strategy' 


        it 'redirects to the strategy show page for html requests' 


        it 'redirects to the strategy show' 

      end

      context 'when the params are invalid' do
        let(:strategy_params) { { strategy: invalid_strategy_params } }

        it 'does not create a new strategy' 


        it 'renders the new template for html requests' 


        it 'responds with a 422 status' 

      end

      context 'when the userid is hacked' do
        it 'creates a new strategy, ignoring the userid parameter' 

      end
    end

    context 'when the user is not logged in' do
      before { post :create }

      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'PATCH update' do
    let(:user)      { create(:user, id: 1) }
    let!(:strategy) { create(:strategy, userid: 1, id: 1) }
    let(:valid_strategy_params)   { {description: 'updated description'} }
    let(:invalid_strategy_params) { {description: nil} }

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when the params are valid' do
        it 'updates the strategy record' 


        it 'redirects to the show page' 

      end

      context 'when the params are invalid' do
        it 'does not update the record' 


        it 'renders the edit view' 

      end
    end

    context 'when the user is not logged in' do
      before do
        patch :update, params: { id: 1 }
      end

      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'DELETE destroy' do
    let(:user)      { create(:user, id: 1) }
    let!(:strategy) { create(:strategy, userid: 1, id: 1) }

    context 'when the user is logged in' do
      include_context :logged_in_user

      it 'destroys the strategy' 


      it 'redirects to the strategies path for html requests' 


      it 'responds with no content to json requests' 

    end

    context 'when the user is not logged in' do
      before { delete :destroy, params: { id: 1 } }

      it_behaves_like :with_no_logged_in_user
    end
  end

  describe '#print_reminders' do
    let(:user) { FactoryBot.create(:user1) }
    let(:strategy)     { create(:strategy, name: 'test', userid: user.id) }

    subject { controller.print_reminders(strategy) }

    describe 'when strategy has no reminders' do
      let(:strategy) { FactoryBot.create(:strategy, userid: user.id) }

      it { is_expected.to eq('') }
    end

    describe 'when strategy has daily reminder' do
      let(:strategy) do
        FactoryBot.create(:strategy, :with_daily_reminder, userid: user.id)
      end

      it 'prints the reminders' 

    end
  end
end

