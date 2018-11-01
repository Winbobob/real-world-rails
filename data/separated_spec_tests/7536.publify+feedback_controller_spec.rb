# frozen_string_literal: true

require 'rails_helper'

describe Admin::FeedbackController, type: :controller do
  render_views

  let(:feedback_from_own_article) { create(:comment, article: article) }
  let(:feedback_from_not_own_article) { create(:spam_comment) }

  shared_examples_for 'destroy feedback with feedback from own article' do
    it 'destroys feedback' 


    it 'redirects to feedback from article' 

  end

  describe 'logged in admin user' do
    let(:admin) { create(:user, :as_admin) }
    let(:article) { create(:article, user: admin) }

    before do
      create(:blog)
      sign_in admin
    end

    describe 'destroy action' do
      it_behaves_like 'destroy feedback with feedback from own article'

      it "destroys feedback from article doesn't own" 

    end

    describe 'index security' do
      it 'checks domain of the only param' 

    end

    describe 'index' do
      let!(:spam) { create(:spam_comment) }
      let!(:unapproved) { create(:unconfirmed_comment) }
      let!(:presumed_ham) { create(:presumed_ham_comment) }
      let!(:presumed_spam) { create(:presumed_spam_comment) }
      let(:params) { {} }

      before { get :index, params: params }

      it { expect(response).to be_successful }
      it { expect(response).to render_template('index') }

      context 'simple' do
        it { expect(assigns(:feedback).size).to eq(4) }
      end

      context 'unapproved' do
        let(:params) { { only: 'unapproved' } }

        it { expect(assigns(:feedback)).to match_array([unapproved, presumed_ham, presumed_spam]) }
      end

      context 'spam' do
        let(:params) { { only: 'spam' } }

        it { expect(assigns(:feedback)).to eq([spam]) }
      end

      context 'presumed_spam' do
        let(:params) { { only: 'presumed_spam' } }

        it { expect(assigns(:feedback)).to eq([presumed_spam]) }
      end

      context 'presumed_ham' do
        let(:params) { { only: 'presumed_ham' } }

        it { expect(assigns(:feedback)).to match_array([unapproved, presumed_ham]) }
      end

      context 'with an empty page params' do
        let(:params) { { page: '' } }

        it { expect(assigns(:feedback).size).to eq(4) }
      end
    end

    describe 'article action' do
      let(:article) { create(:article) }
      let!(:ham) { create(:comment, article: article) }
      let!(:spam) { create(:comment, article: article, state: 'spam') }

      def should_success_with_article_view(response)
        expect(response).to be_successful
        expect(response).to render_template('article')
      end

      it 'sees all feedback on one article' 


      it 'sees only spam feedback on one article' 


      it 'sees only ham feedback on one article' 


      it 'redirect_toes index if bad article id' 

    end

    describe 'create action' do
      def base_comment(options = {})
        { 'body' => 'a new comment', 'author' => 'Me', 'url' => 'https://bar.com/', 'email' => 'foo@bar.com' }.merge(options)
      end

      describe 'by get access' do
        it "raises ActiveRecordNotFound if article doesn't exist" 


        it 'does not create comment' 

      end

      describe 'by post access' do
        it "raises ActiveRecord::RecordNotFound if article doesn't exist" 


        it 'creates comment' 


        it 'creates comment mark as ham' 

      end
    end

    describe 'edit action' do
      it 'renders edit form' 

    end

    describe 'update action' do
      it 'updates comment if post request' 


      it 'does not  update comment if get request' 

    end
  end

  describe 'publisher access' do
    let(:publisher) { create(:user, :as_publisher) }
    let(:article) { create(:article, user: publisher) }

    before do
      create(:blog)
      sign_in publisher
    end

    describe 'destroy action' do
      it_behaves_like 'destroy feedback with feedback from own article'

      it "does not destroy feedback doesn't own" 

    end

    describe 'edit action' do
      it 'does not edit comment no own article' 


      it 'edits comment if own article' 

    end

    describe 'update action' do
      it 'updates comment if own article' 


      it 'does not update comment if not own article' 

    end

    describe '#bulkops action' do
      it 'redirect to index' 


      it 'delete all spam' 


      it 'delete all spam and only confirmed spam' 


      it 'mark presumed spam comments as spam' 


      it 'mark confirmed spam comments as spam' 


      it 'mark presumed ham comments as spam' 


      it 'mark ham comments as spam' 


      it 'mark presumed spam comments as ham' 


      it 'mark confirmed spam comments as ham' 


      it 'mark presumed ham comments as ham' 


      it 'mark ham comments as ham' 


      it 'confirms presumed spam comments as spam' 


      it 'confirms confirmed spam comments as spam' 


      it 'confirms presumed ham comments as ham' 


      it 'confirms ham comments as ham' 

    end
  end
end

