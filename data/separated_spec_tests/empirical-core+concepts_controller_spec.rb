require 'rails_helper'

describe Api::V1::ConceptsController, type: :controller do

  context 'POST #create' do
    let!(:user) { create(:staff) }
    let!(:token) { double :acceptable? => true, resource_owner_id: user.id }
    let!(:concept_name) { 'Concept1' }
    let!(:parent_concept) { create(:concept) }

    def subject
      post :create, {concept: {name: concept_name, parent_uid: parent_concept.uid}}
    end

    it_behaves_like 'protected endpoint'

    context 'default behavior' do
      let(:parsed_body) { JSON.parse(response.body) }

      before do
        allow(controller).to receive(:doorkeeper_token) {token}
        subject
      end

      it 'responds with 200' 


      it 'responds with correct keys' 


      it 'responds with correct values' 

    end
  end

  context 'GET #index' do
    let!(:concept1) { create(:concept, name: 'Articles') }
    let!(:concept2) { create(:concept, name: 'The', parent: concept1) }
    let(:parsed_body) { JSON.parse(response.body) }

    def subject
      get :index
    end

    before do
      subject
    end

    it 'returns all concepts' 

  end
end

