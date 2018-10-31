# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminCommentController do

  describe 'GET index' do
    let(:admin_user){ FactoryGirl.create(:admin_user) }
    let(:pro_admin_user){ FactoryGirl.create(:pro_admin_user) }

    it 'sets the title' 


    it 'collects comments by creation date' 


    it 'assigns the query' 


    it 'filters comments by the search query' 


    it 'renders the index template' 


    it 'responds successfully' 


    it 'does not include comments on embargoed requests if the current user is
        not a pro admin user' do
      comment = FactoryGirl.create(:comment)
      comment.info_request.create_embargo
      get :index, {}, { :user_id => admin_user.id }
      expect(assigns[:comments].include?(comment)).to be false
    end

    context 'if pro is enabled' do

      it 'does not include comments on embargoed requests if the
          current user is a pro admin user' do
        with_feature_enabled(:alaveteli_pro) do
          comment = FactoryGirl.create(:comment)
          comment.info_request.create_embargo
          get :index, {}, { :user_id => admin_user.id }
          expect(assigns[:comments].include?(comment)).to be false
        end
      end

      it 'includes comments on embargoed requests if the current user is a
          pro admin user' do
        with_feature_enabled(:alaveteli_pro) do
          comment = FactoryGirl.create(:comment)
          comment.info_request.create_embargo
          get :index, {}, { :user_id => pro_admin_user.id }
          expect(assigns[:comments].include?(comment)).to be true
        end
      end
    end

  end

  describe 'GET edit' do
    let(:pro_admin_user){ FactoryGirl.create(:pro_admin_user) }
    let(:admin_user){ FactoryGirl.create(:admin_user) }
    let(:comment){ FactoryGirl.create(:comment) }

    it 'renders the edit template' 


    it 'gets the comment' 



    context 'if pro is enabled' do

      context 'if the current user cannot admin the comment' do

        it 'raises ActiveRecord::RecordNotFound' 

      end

      context 'if the current user can admin the comment' do

        it 'renders the edit template' 

      end
    end
  end

  describe 'PUT update' do
      let(:pro_admin_user){ FactoryGirl.create(:pro_admin_user) }
      let(:admin_user){ FactoryGirl.create(:admin_user) }
      let(:comment){ FactoryGirl.create(:comment) }
      let(:atts){ FactoryGirl.attributes_for(:comment, :body => 'I am new') }

    context 'on valid data submission' do

      it 'gets the comment' 


      it 'updates the comment' 


      it 'logs the update event' 


      context 'the attention_requested flag is the only change' do
        let(:atts) do
          FactoryGirl.attributes_for(:comment,
                                     :body => comment.body,
                                     :attention_requested => true)
        end

        before do
          put :update, { :id => comment.id, :comment => atts },
                       { :user_id => admin_user.id }
        end

        it 'logs the update event' 


        it 'captures the old and new attention_requested values' 


        it 'updates the comment' 


      end

      context 'the comment is being hidden' do

        context 'without changing the text' do

          it 'logs a "hide_comment" event' 


        end

        context 'the text is changed as well' do

          it 'logs an "edit_comment" event' 


        end

      end

      it 'shows a success notice' 


      it 'redirects to the request page' 

    end

    context 'on invalid data submission' do

      it 'renders the edit template' 


    end


    context 'if pro is enabled' do

      context 'if the current user cannot admin the comment' do

        it 'raises ActiveRecord::RecordNotFound' 

      end

      context 'if the current user can admin the comment' do

        it 'updates the comment' 

      end
    end
  end

end

