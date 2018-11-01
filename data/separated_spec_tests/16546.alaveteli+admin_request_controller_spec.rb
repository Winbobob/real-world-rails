# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminRequestController, "when administering requests" do

  describe 'GET #index' do
    let(:info_request){ FactoryBot.create(:info_request) }
    let(:admin_user){ FactoryBot.create(:admin_user) }
    let(:pro_admin_user){ FactoryBot.create(:pro_admin_user) }

    it "is successful" 


    it 'assigns all info requests to the view' 


    it 'does not include embargoed requests if the current user is
        not a pro admin user' do
      info_request.create_embargo
      get :index, {}, { :user_id => admin_user.id }
      expect(assigns[:info_requests].include?(info_request)).to be false
    end


    context 'when pro is enabled' do

      it 'does not include embargoed requests if the current user is
          not a pro admin user' do
        with_feature_enabled(:alaveteli_pro) do
          info_request.create_embargo
          get :index, {}, { :user_id => admin_user.id }
          expect(assigns[:info_requests].include?(info_request)).to be false
        end
      end

      it 'includes embargoed requests if the current user
          is a pro admin user' do
        with_feature_enabled(:alaveteli_pro) do
          info_request.create_embargo
          get :index, {}, { :user_id => pro_admin_user.id }
          expect(assigns[:info_requests].include?(info_request)).to be true
        end
      end
    end

    context 'when passed a query' do
      let!(:dog_request){ FactoryBot.create(:info_request,
                                            :title => 'A dog request') }
      let!(:cat_request){ FactoryBot.create(:info_request,
                                            :title => 'A cat request') }

      it 'assigns info requests with titles matching the query to the view
          case insensitively' do
        get :index, { :query => 'Cat' }, { :user_id => admin_user.id }
        expect(assigns[:info_requests].include?(dog_request)).to be false
        expect(assigns[:info_requests].include?(cat_request)).to be true
      end

      it 'does not include embargoed requests if the current user is an
          admin user' do
        cat_request.create_embargo
        get :index, { :query => 'cat' }, { :user_id => admin_user.id }
        expect(assigns[:info_requests].include?(cat_request)).to be false
      end

      context 'when pro is enabled' do
        it 'does not include embargoed requests if the current user is an
            admin user' do
          with_feature_enabled(:alaveteli_pro) do
            cat_request.create_embargo
            get :index, { :query => 'cat' }, { :user_id => admin_user.id }
            expect(assigns[:info_requests].include?(cat_request)).to be false
          end
        end

        it 'includes embargoed requests if the current user
            is a pro admin user' do
          with_feature_enabled(:alaveteli_pro) do
            cat_request.create_embargo
            get :index, { :query => 'cat' }, { :user_id => pro_admin_user.id }
            expect(assigns[:info_requests].include?(cat_request)).to be true
          end
        end
      end

    end

  end

  describe 'GET #show' do
    let(:info_request){ FactoryBot.create(:info_request) }
    let(:external_request){ FactoryBot.create(:external_request) }
    let(:admin_user){ FactoryBot.create(:admin_user) }
    let(:pro_admin_user){ FactoryBot.create(:pro_admin_user) }

    render_views

    it "is successful" 


    it 'shows an external info request with no username' 


    context 'if the request is embargoed' do

      before do
        info_request.create_embargo
      end

      it 'raises ActiveRecord::RecordNotFound for an admin user' 


      context 'with pro enabled' do

        it 'raises ActiveRecord::RecordNotFound for an admin user' 


        it 'is successful for a pro admin user' 

      end

    end

  end

  describe 'GET #edit' do
    let(:info_request){ FactoryBot.create(:info_request) }

    it "is successful" 


  end

  describe 'PUT #update' do
    let(:info_request){ FactoryBot.create(:info_request) }

    it "saves edits to a request" 


    it 'expires the request cache when saving edits to it' 


  end

  describe 'DELETE #destroy' do
    let(:info_request){ FactoryBot.create(:info_request) }

    it 'calls destroy on the info_request object' 


    it 'uses a different flash message to avoid trying to fetch a non existent user record' 


    it 'redirects after destroying a request with incoming_messages' 


  end

  describe 'POST #hide' do
    let(:info_request){ FactoryBot.create(:info_request) }

    it "hides requests and sends a notification email that it has done so" 


    it 'expires the file cache for the request' 


    context 'when hiding an external request' do

      before do
        @info_request = mock_model(InfoRequest, :prominence= => nil,
                                   :log_event => nil,
                                   :set_described_state => nil,
                                   :save! => nil,
                                   :user => nil,
                                   :user_name => 'External User',
                                   :is_external? => true)
        allow(@info_request).to receive(:expire)

        allow(InfoRequest).to receive(:find).with(@info_request.id.to_s).and_return(@info_request)
        @default_params = { :id => @info_request.id,
                            :explanation => 'Foo',
                            :reason => 'vexatious' }
      end

      def make_request(params=@default_params)
        post :hide, params
      end

      it 'should redirect the the admin page for the request' 


      it 'should set the request prominence to "requester_only"' 


      it 'should not send a notification email' 


      it 'should add a notice to the flash saying that the request has been hidden' 


      it 'should expire the file cache for the request' 

    end

  end

end

