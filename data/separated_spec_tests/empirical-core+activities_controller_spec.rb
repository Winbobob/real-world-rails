require 'rails_helper'

describe Api::V1::ActivitiesController, type: :controller do

  context 'GET #show' do
    include_context "calling the api"

    before do
      @activity1 = create(:activity)

      get :show, format: :json, id: @activity1.uid
      @parsed_body = JSON.parse(response.body)
    end

    # it_behaves_like "an api request"

    it 'responds with 200' 


    # it "should have an object at it's root" do
    #   expect(@parsed_body.keys).to include('status')
    # end
    #
    # it "should present a uid" do
    #   expect(@parsed_body['object']['uid']).to eq(@activity1.uid)
    # end
  end

  context 'PUT #update' do
    include_context "calling the api" # this handles the doorkeeper auth

    let!(:activity) { create(:activity) }

    before do
      put :update, format: :json, id: activity.uid, name: 'foobar'
      @parsed_body = JSON.parse(response.body)
    end

    it_behaves_like 'an api request'

    it 'responds with 200' 

  end

  context 'POST #create' do
    include_context 'calling the api'
    let(:topic) { create(:topic) }
    let(:section) { create(:section) }
    let(:activity_classification) { create(:activity_classification) }

    subject do
      post :create, {
        name: 'foobar',
        uid: 'abcdef123',
        topic_uid: topic.uid,
        activity_classification_uid: activity_classification.uid
      }
    end

    describe 'general API behavior' do
      before do
        subject
        @parsed_body = JSON.parse(response.body)
      end

      it_behaves_like 'an api request'

      it 'allows setting the uid field on the activity' 


      it 'flags activities as beta by default' 


      describe 'handles uid information' do
        let(:activity) { Activity.find_by_uid(@parsed_body['activity']['uid']) }

        it 'sets topic_id from topic_uid' 


        it 'sets activity_classification_id from activity_classification_uid' 

      end
    end

    describe 'when the request is valid' do
      it 'creates an activity' 


      it 'responds with 200' 

    end

    describe 'when there was an error creating the activity' do
      it 'responds with 422 Unprocessable Entity' 

    end
  end

  describe '#destroy' do
    include_context "calling the api" # this handles the doorkeeper auth
    let(:activity) { create(:activity) }

    context 'when the destroy is successful' do
      it 'should return the success json' 

    end

    context 'when the destroy is not successful' do
      before do
        allow_any_instance_of(Activity).to receive(:destroy!) { false }
      end

      it 'should return the failed json' 

    end
  end

  describe '#follow_up_activity_name_and_supporting_info' do
    include_context "calling the api" # this handles the doorkeeper auth
    let(:follow_up_activity) { create(:activity) }
    let(:activity) { create(:activity, follow_up_activity: follow_up_activity) }

    it 'should render the correct json' 

  end

  describe '#supporting_info' do
    let(:activity) { create(:activity) }

    it 'should render the correct json' 

  end

  describe '#uids_and_flags' do
    let!(:activity) { create(:activity) }
    let!(:activity1) { create(:activity) }

    it 'should render the correct json' 

  end

  describe '#published_edition' do
    let(:objective) { create(:objective, name: "Publish Customized Lesson") }
    let(:milestone) { create(:milestone, name: "Publish Customized Lesson") }
    let(:user) { create(:user) }

    before do
      allow(controller).to receive(:current_user) { user }
    end

    it 'should create the usermilestone and checkbox' 

  end

  context 'when not authenticated via OAuth' do
    it 'POST #create returns 401 Unauthorized' 


    it 'PUT #update returns 401 Unauthorized' 


    it 'DELETE #destroy returns 401 Unauthorized' 

  end
end

