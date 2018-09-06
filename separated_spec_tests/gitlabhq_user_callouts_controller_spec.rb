require 'spec_helper'

describe UserCalloutsController do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "POST #create" do
    subject { post :create, feature_name: feature_name, format: :json }

    context 'with valid feature name' do
      let(:feature_name) { UserCallout.feature_names.keys.first }

      context 'when callout entry does not exist' do
        it 'should create a callout entry with dismissed state' 


        it 'should return success' 

      end

      context 'when callout entry already exists' do
        let!(:callout) { create(:user_callout, feature_name: UserCallout.feature_names.keys.first, user: user) }

        it 'should return success' 

      end
    end

    context 'with invalid feature name' do
      let(:feature_name) { 'bogus_feature_name' }

      it 'should return bad request' 

    end
  end
end

