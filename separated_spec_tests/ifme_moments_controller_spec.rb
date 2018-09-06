# frozen_string_literal: true

describe MomentsController do
  context 'when signed in' do
    let(:user) { create(:user) }
    let(:moment) { build(:moment, user: user) }

    before { sign_in user }

    it 'GET index' 


    it 'POST new' 


    it 'GET show' 


    describe 'POST create' do
      let(:valid_moment_params) { attributes_for(:moment) }

      def post_create(moment_params)
        post :create, params: { moment: moment_params }
      end

      context 'when valid params are supplied' do
        it 'creates a moment' 


        it 'has no validation errors' 


        it 'redirects to the moment page' 

      end

      context 'when invalid params are supplied' do
        let(:invalid_moment_params) { valid_moment_params.merge(name: nil, why: nil) }

        before { post_create invalid_moment_params }

        it 're-renders the creation form' 


        it 'adds errors to the moment ivar' 

      end

      context 'when the userid is hacked' do
        it 'creates a new moment, ignoring the userid parameter' 

      end
    end
  end

  describe 'POST comment' do
    let(:user) { create(:user) }
    let(:moment) { create(:moment, user: user) }
    let(:comment) { build(:comment, comment_by: user.id) }
    let(:valid_comment_params) do
      comment.attributes.merge(commentable_id: moment.id, visibility: 'all')
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
    let(:user) { create(:user, id: 1) }

    context 'when the user is logged in' do
      include_context :logged_in_user

      context 'when the comment exists and belongs to the current_user' do
        let!(:new_moment) { create(:moment, id: 1, userid: 1) }
        let!(:comment) do
          create(
            :comment, id: 1, comment_by: 1, commentable_id: 1, visibility: 'all'
          )
        end

        it 'destroys the comment' 


        it 'renders nothing' 

      end

      context 'when the comment exists and the strategy belongs to the current_user' do
        let!(:comment) do
          create(
            :comment, id: 1, comment_by: 1, commentable_id: 1, visibility: 'all'
          )
        end
        let!(:new_moment) { create(:moment, id: 1, userid: 1) }

        it 'destroys the comment' 


        it 'renders nothing' 

      end

      context 'when the comment does not exist' do
        it 'renders nothing' 

      end
    end

    context 'when the user is not logged in' do
      before do
        get :delete_comment
      end

      it_behaves_like :with_no_logged_in_user
    end
  end

  describe 'Moment Analytic Charts' do

    it 'should contain react analytics objects' 

  end
end

