require 'rails_helper'

RSpec.describe ExternalUsers::CertificationsController, type: :controller, focus: true do
  let(:certification_type) { create(:certification_type) }
  let!(:advocate) { create(:external_user) }

  before { sign_in advocate.user }

  let(:claim) { create(:advocate_claim) }

  describe 'GET #new' do

    context 'claim is valid for submission' do
      before(:each) do
        get :new, params: { claim_id: claim.id }
      end

      it 'should return success' 


      it 'should render new' 


      it 'should instantiate a new certification with pre-filled fields' 

    end

    context 'claim already in submitted state' do
      it 'should redirect to claim path with a flash message' 

    end

    context 'claim not in a valid state' do
      it 'should redirect to the check your claim page with flash message' 

    end
  end

  describe 'POST create' do
    context 'AGFS' do
      let(:claim) { create(:advocate_claim) }
      let(:sns_client) do
        Aws::SNS::Client.new(
            region: 'eu_west_1',
            stub_responses:
                {
                    publish: {}
                }
        )
      end

      before do
        allow(Aws::SNS::Client).to receive(:new).and_return sns_client
        allow(sns_client).to receive(:publish)
      end

      context 'claim not in a valid state' do
        let(:claim) { create(:claim, case_type_id: nil) }

        it 'should redirect to check your claim page with flash message' 

      end

      context 'valid certification params for submission' do
        let(:frozen_time) { Time.new(2015, 8, 20, 13, 54, 22) }

        it 'should be a redirect to confirmation' 


        it 'should change the state to submitted' 


        it 'should set the submitted at date' 


        it 'logs a successful message on the queue' 

      end
    end

    context 'LGFS' do
      let(:claim) { create(:litigator_claim) }

      let(:sns_client) do
        Aws::SNS::Client.new(
          region: 'eu_west_1',
          stub_responses:
            {
              publish: {}
            }
        )
      end

      before do
        allow(Aws::SNS::Client).to receive(:new).and_return sns_client
        allow(sns_client).to receive(:publish)
      end

      it 'calls the SNS notification path' 

    end

    context 'claim not in a valid state' do
      let(:claim) { create(:litigator_claim, case_type_id: nil) }

      it 'should redirect to check your claim page with flash message' 

    end

    context 'invalid certification' do
      it 'should redirect to new' 

    end
  end

  describe 'PATCH #update' do
    it 'should redirect to claim path with a flash message' 

  end
end

def valid_certification_params(claim, certification_type)
  certification_date = claim.created_at
  {
    'claim_id'      => claim.id,
    'commit'        => "Certify and Submit Claim",
    'certification' => {
      'certification_type_id'   => certification_type.id,
      'certified_by'            => 'David Cameron',
      'main_hearing'            => 'true',
      'certification_date_dd'   => certification_date.day,
      'certification_date_mm'   => certification_date.month,
      'certification_date_yyyy' => certification_date.year
    }
  }
end

