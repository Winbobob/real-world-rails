# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminUserController do

  describe 'GET index' do

    it 'renders the index template' 


    it 'responds successfully' 


    it 'sets a default sort order' 


    it 'assigns the sort options' 


    it 'assigns a custom sort order if valid' 


    it 'uses the default sort order if a custom sort order is invalid' 


    it 'sorts the records by name_asc' 


    it 'sorts the records by name_desc' 


    it 'sorts the records by created_at_asc' 


    it 'sorts the records by created_at_desc' 


    it 'sorts the records by updated_at_asc' 


    it 'sorts the records by updated_at_desc' 


    it "assigns users matching a case-insensitive query to the view" 


    it 'strips the string when searching' 


    it 'searches and sorts the records' 


    it 'filters the records by role' 


    it 'filters the records by multiple roles' 


  end

  describe 'GET #show' do
    let(:info_request){ FactoryBot.create(:info_request) }
    let(:admin_user){ FactoryBot.create(:admin_user) }
    let(:pro_admin_user){ FactoryBot.create(:pro_admin_user) }

    it "is successful" 


    it "assigns the user's info requests to the view" 


    it 'does not include embargoed requests if the current user is
        not a pro admin user' do
      info_request.create_embargo
      get :show, { :id => info_request.user }, { :user_id => admin_user.id }
      expect(assigns[:info_requests]).to eq([])
    end

    context 'when pro is enabled' do

      it 'does not include embargoed requests if the current user is
          not a pro admin user' do
        with_feature_enabled(:alaveteli_pro) do
          info_request.create_embargo
          get :show, { :id => info_request.user }, { :user_id => admin_user.id }
          expect(assigns[:info_requests]).to eq([])
        end
      end

      it 'includes embargoed requests if the current user is a pro admin user
          and pro is enabled' do
        with_feature_enabled(:alaveteli_pro) do
          info_request.create_embargo
          get :show, { :id => info_request.user }, { :user_id => pro_admin_user.id }
          expect(assigns[:info_requests].include?(info_request)).to be true
        end
      end

    end

    it "assigns the user's comments to the view" 


    it 'does not include comments on embargoed requests if the current user is
        not a pro admin user' do
      comment = FactoryBot.create(:comment, :info_request => info_request,
                                            :user => info_request.user)
      info_request.create_embargo
      get :show, { :id => info_request.user }, { :user_id => admin_user.id }
      expect(assigns[:comments]).to eq([])
    end

    context 'when pro is enabled' do

      it 'does not include comments on embargoed requests if the current user is
          not a pro admin user' do
        with_feature_enabled(:alaveteli_pro) do
          comment = FactoryBot.create(:comment, :info_request => info_request,
                                                :user => info_request.user)
          info_request.create_embargo
          get :show, { :id => info_request.user }, { :user_id => admin_user.id }
          expect(assigns[:comments]).to eq([])
        end
      end

      it 'includes comments on embargoed requests if the current user is a
          pro admin user' do
        with_feature_enabled(:alaveteli_pro) do
          comment = FactoryBot.create(:comment, :info_request => info_request,
                                                :user => info_request.user)
          info_request.create_embargo
          get :show, { :id => info_request.user }, { :user_id => pro_admin_user.id }
          expect(assigns[:comments]).to eq([comment])
        end
      end

    end

  end

  describe "POST #update" do

    let(:admin_user){ FactoryBot.create(:admin_user) }

    before do
      allow(AlaveteliConfiguration).to receive(:skip_admin_auth).and_return(false)
    end

    it "saves a change to 'can_make_batch_requests'" 


    it "should not allow an existing email address to be used" 


    it "sets the user's roles" 


    it "unsets the user's roles if no role ids are supplied" 


    it 'does not set a role the setter cannot grant and revoke' 


      it 'does not set a role that does not exist' 
    it 'redirects to the page the admin was previously on' 


    it 'sets the given comments visibility to hidden' 


    it 'sets the given comments visibility to visible' 


    it 'only modifes the given list of comments' 


    it 'preserves the visibility if a comment is already of the requested visibility' 


  end

end

