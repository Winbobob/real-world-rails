require 'rails_helper'

describe Api::V1::ActivitySessionsController, type: :controller do


  describe '#update' do
    let(:token) { double :acceptable? => true, resource_owner_id: user.id }
    let(:user) { create(:student) }

    before do
      allow(controller).to receive(:doorkeeper_token) {token}
      @activity_session = create(:activity_session, state: 'started', user: user)
    end

    it 'passes activity session and user to notifier service' 


    context 'default behavior' do
      include_context "calling the api"

      before do
        subject
        @parsed_body = JSON.parse(response.body)
      end

      def subject
        # FIXME: URL Parameter should be called uid, not id, because that is confusing
        put :update, id: @activity_session.uid
      end

      it 'responds with 200' 


      it 'responds with the updated activity session' 


    end

    context 'concept results are included' do

      def subject
        @writing_concept = create(:concept, name: 'Creative Writing')
        results = [
          create(:concept_result, metadata: {
              foo: 'bar',
            }, activity_session_id: @activity_session.id, concept: @writing_concept
          ),
          create(:concept_result, metadata: {
              baz: 'foo',
            }, activity_session_id: @activity_session.id
          ),
          create(:concept_result,
            activity_session_id: @activity_session.id
          )
        ]
        put :update, id: @activity_session.uid, concept_results:  JSON.parse(results.to_json)
      end

      it 'succeeds' 


      it 'stores the concept results' 


      it 'saves the arbitrary metadata for the results' 


      it 'saves the concept tag relationship (ID) in the result' 

    end

    context 'result is assigned to a non-existent concept tag' do
      def subject
        results = [
          {
            concept_uid: 'Non-existent UID',
            metadata: {
              foo: 'bar',
            }
          }
        ]
        put :update, id: @activity_session.uid, concept_results: results
      end

      # this is no longer the case, as results should not be saved with nonexistent concept tag
      it 'does not save the concept result' 

    end
  end

  describe '#show' do
    let!(:session) { create(:activity_session) }

    it 'renders the correct json' 

  end

  describe '#create' do
    let(:classroom_unit) { create(:classroom_unit) }
    let(:session) { create(:proofreader_activity_session, classroom_unit: classroom_unit) }

    it 'creates the activity session' 

  end

  describe '#destoy' do
    include_context "calling the api" #bypass doorkeeper
    let!(:session) { create(:proofreader_activity_session) }

    it 'destroys the activity session' 

  end
end

