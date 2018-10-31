# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminCensorRuleController do
  before(:each) { basic_auth_login(@request) }

  describe 'GET index' do

    let!(:global_rules) do
      3.times.map { FactoryGirl.create(:global_censor_rule) }
    end

    before do
      get :index
    end

    it 'returns a successful response' 


    it 'collects admin censor rules' 


    it 'renders the correct template' 


  end

  describe 'GET new' do

    context 'global censor rule' do

      before do
        get :new
      end

      it 'returns a successful response' 


      it 'initializes a new censor rule' 


      it 'renders the correct template' 


      it 'does not associate the censor rule with an info request' 


      it 'does not associate the censor rule with a public body' 


      it 'does not associate the censor rule with a user' 


      it 'sets the URL for the form to POST to' 


    end

    context 'request_id param' do

      let(:info_request) { FactoryGirl.create(:info_request) }

      before do
        get :new, :request_id => info_request.id
      end

      it 'returns a successful response' 


      it 'initializes a new censor rule' 


      it 'renders the correct template' 


      it 'finds an info request if the request_id param is supplied' 


      it 'associates the info request with the new censor rule' 


      it 'sets the URL for the form to POST to' 


    end

    context 'user_id param' do

      let(:user) { FactoryGirl.create(:user) }

      before do
        get :new, :user_id => user.id
      end

      it 'returns a successful response' 


      it 'initializes a new censor rule' 


      it 'renders the correct template' 


      it 'finds a user if the user_id param is supplied' 


      it 'associates the user with the new censor rule' 


      it 'sets the URL for the form to POST to' 


    end

    # NOTE: This should be public_body_id but the resource is mapped as :bodies
    context 'body_id param' do

      let(:public_body) { FactoryGirl.create(:public_body) }

      before do
        get :new, :body_id => public_body.id
      end

      it 'returns a successful response' 


      it 'initializes a new censor rule' 


      it 'renders the correct template' 


      it 'finds a public body if the public_body_id param is supplied' 


      it 'associates the public_body with the new censor rule' 


      it 'sets the URL for the form to POST to' 


    end

  end

  describe 'POST create' do

    context 'a global censor rule' do

      let(:censor_rule_params) do
        params = FactoryGirl.attributes_for(:global_censor_rule)
        # last_edit_editor gets set in the controller
        params.delete(:last_edit_editor)
        params
      end

      def create_censor_rule
        post :create, :censor_rule => censor_rule_params
      end

      it 'sets the last_edit_editor to the current admin' 


      it 'does not associate the censor rule with an info request' 


      it 'does not associate the censor rule with a public body' 


      it 'does not associate the censor rule with a user' 


      it 'sets the URL for the form to POST to' 


      context 'successfully saving the censor rule' do

        it 'calls expire_requests on the new censor_rule' 


        it 'redirects to the censor rules index' 


      end

      context 'unsuccessfully saving the censor rule' do

        before(:each) do
          allow_any_instance_of(CensorRule).to receive(:save).and_return(false)
        end

        it 'does not persist the censor rule' 


        it 'renders the form' 


      end

    end

    context 'request_id param' do

      let(:censor_rule_params) do
        params = FactoryGirl.attributes_for(:info_request_censor_rule)
        # last_edit_editor gets set in the controller
        params.delete(:last_edit_editor)
        params
      end

      let(:info_request) { FactoryGirl.create(:info_request) }

      it 'sets the last_edit_editor to the current admin' 


      it 'finds an info request if the request_id param is supplied' 


      it 'associates the info request with the new censor rule' 


      it 'sets the URL for the form to POST to' 


      context 'successfully saving the censor rule' do

        it 'persists the censor rule' 


        it 'confirms the censor rule is created' 


        it 'calls expire_requests on the new censor_rule' 


        it 'redirects to the associated info request' 

      end

      context 'unsuccessfully saving the censor rule' do

        before(:each) do
          allow_any_instance_of(CensorRule).to receive(:save).and_return(false)
        end

        it 'does not persist the censor rule' 


        it 'renders the form' 


      end
    end

    context 'user_id param' do

      let(:user) { FactoryGirl.create(:user) }

      let(:censor_rule_params) do
        params = FactoryGirl.attributes_for(:user_censor_rule, :user => user)
        # last_edit_editor gets set in the controller
        params.delete(:last_edit_editor)
        params
      end

      def create_censor_rule
        post :create, :user_id => user.id,
                      :censor_rule => censor_rule_params
      end

      it 'sets the last_edit_editor to the current admin' 


      it 'finds a user if the user_id param is supplied' 


      it 'associates the user with the new censor rule' 


      it 'sets the URL for the form to POST to' 


      context 'successfully saving the censor rule' do

        it 'calls expire_requests on the new censor_rule' 


        it 'redirects to the associated info request' 


      end

      context 'unsuccessfully saving the censor rule' do

        before(:each) do
          allow_any_instance_of(CensorRule).to receive(:save).and_return(false)
        end

        it 'does not persist the censor rule' 


        it 'renders the form' 


      end

    end

    context 'body_id param' do

      let(:censor_rule_params) do
        params = FactoryGirl.attributes_for(:public_body_censor_rule)
        # last_edit_editor gets set in the controller
        params.delete(:last_edit_editor)
        params
      end

      let(:public_body) { FactoryGirl.create(:public_body) }

      before(:each) do
        post :create, :body_id => public_body.id,
                      :censor_rule => censor_rule_params
      end

      it 'sets the last_edit_editor to the current admin' 


      it 'finds a public body if the body_id param is supplied' 


      it 'associates the public body with the new censor rule' 


      it 'sets the URL for the form to POST to' 


      context 'successfully saving the censor rule' do

        it 'persists the censor rule' 


        it 'confirms the censor rule is created' 


        it 'calls expire_requests on the new censor_rule' 


        it 'redirects to the associated public body' 

      end

      context 'unsuccessfully saving the censor rule' do

        before(:each) do
          allow_any_instance_of(CensorRule).to receive(:save).and_return(false)
        end

        it 'does not persist the censor rule' 


        it 'renders the form' 


      end
    end

  end

  describe 'GET edit' do

    context 'a CensorRule with an associated InfoRequest' do

      let(:censor_rule) { FactoryGirl.create(:info_request_censor_rule) }

      it 'returns a successful response' 


      it 'renders the correct template' 


      it 'finds the correct censor rule to edit' 


    end

    context 'a CensorRule with an associated User' do

      let(:censor_rule) { FactoryGirl.create(:user_censor_rule) }

      it 'returns a successful response' 


      it 'renders the correct template' 


      it 'finds the correct censor rule to edit' 


    end

    context 'a CensorRule with an associated PublicBody' do

      let(:censor_rule) { FactoryGirl.create(:public_body_censor_rule) }

      it 'returns a successful response' 


      it 'renders the correct template' 


      it 'finds the correct censor rule to edit' 


    end

    context 'a global rule' do

      let(:censor_rule) { FactoryGirl.create(:global_censor_rule) }

      it 'returns a successful response' 


      it 'renders the correct template' 


      it 'finds the correct censor rule to edit' 


    end

  end

  describe 'PUT update' do

    context 'a global censor rule' do

      let(:censor_rule) { FactoryGirl.create(:global_censor_rule) }

      it 'finds the correct censor rule to edit' 


      it 'sets the last_edit_editor to the current admin' 


      context 'successfully saving the censor rule' do

        it 'updates the censor rule' 


        it 'confirms the censor rule is updated' 


        it 'calls expire_requests on the censor_rule' 


        it 'redirects to the censor rule index' 


      end

      context 'unsuccessfully saving the censor rule' do

        before(:each) do
          allow_any_instance_of(CensorRule).to receive(:save).and_return(false)
        end

        it 'does not update the censor rule' 


        it 'renders the form' 


      end

    end

    context 'a CensorRule with an associated InfoRequest' do

      let(:censor_rule) { FactoryGirl.create(:info_request_censor_rule) }

      it 'finds the correct censor rule to edit' 


      it 'sets the last_edit_editor to the current admin' 


      context 'successfully saving the censor rule' do

        it 'updates the censor rule' 


        it 'confirms the censor rule is updated' 


        it 'calls expire_requests on the censor_rule' 


        it 'redirects to the associated info request' 


      end

      context 'unsuccessfully saving the censor rule' do

        before(:each) do
          allow_any_instance_of(CensorRule).to receive(:save).and_return(false)
        end

        it 'does not update the censor rule' 


        it 'renders the form' 


      end

    end

    context 'a CensorRule with an associated User' do

      let(:censor_rule) { FactoryGirl.create(:user_censor_rule) }

      it 'finds the correct censor rule to edit' 


      it 'sets the last_edit_editor to the current admin' 


      context 'successfully saving the censor rule' do
        it 'updates the censor rule' 


        it 'confirms the censor rule is updated' 


        it 'calls expire_requests on the censor_rule' 


        it 'redirects to the associated info request' 

      end

      context 'unsuccessfully saving the censor rule' do

        before(:each) do
          allow_any_instance_of(CensorRule).to receive(:save).and_return(false)
        end

        it 'does not update the censor rule' 


        it 'renders the form' 


      end

    end

    context 'a CensorRule with an associated PublicBody' do

      let(:censor_rule) { FactoryGirl.create(:public_body_censor_rule) }

      it 'finds the correct censor rule to edit' 


      it 'sets the last_edit_editor to the current admin' 


      context 'successfully saving the censor rule' do

        it 'updates the censor rule' 


        it 'confirms the censor rule is updated' 


        it 'calls expire_requests on the censor_rule' 


        it 'redirects to the associated public body' 


      end

      context 'unsuccessfully saving the censor rule' do

        before(:each) do
          allow_any_instance_of(CensorRule).to receive(:save).and_return(false)
        end

        it 'does not update the censor rule' 


        it 'renders the form' 


      end

    end

  end

  describe 'DELETE destroy' do

    context 'a global CensorRule' do

      let(:censor_rule) { FactoryGirl.create(:global_censor_rule) }

      it 'finds the correct censor rule to destroy' 


      it 'confirms the censor rule is destroyed in all cases' 


      it 'redirects to the censor rules index' 


    end

    context 'a CensorRule with an associated InfoRequest' do

      let(:censor_rule) { FactoryGirl.create(:info_request_censor_rule) }

      it 'finds the correct censor rule to destroy' 


      it 'confirms the censor rule is destroyed in all cases' 


      it 'calls expire_requests on the censor rule' 


      it 'redirects to the associated info request' 


    end

    context 'a CensorRule with an associated User' do

      let(:censor_rule) { FactoryGirl.create(:user_censor_rule) }

      it 'finds the correct censor rule to destroy' 


      it 'confirms the censor rule is destroyed in all cases' 


      it 'calls expire_requests on the censor rule' 


      it 'redirects to the associated info request' 


    end

    context 'a CensorRule with an associated PublicBody' do

      let(:censor_rule) { FactoryGirl.create(:public_body_censor_rule) }

      it 'finds the correct censor rule to destroy' 


      it 'confirms the censor rule is destroyed in all cases' 


      it 'calls expire_requests on the censor rule' 


      it 'redirects to the associated public body' 


    end

  end

end

