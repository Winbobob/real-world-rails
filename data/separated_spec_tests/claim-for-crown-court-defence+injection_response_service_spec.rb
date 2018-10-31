require 'rails_helper'

RSpec.describe InjectionResponseService, slack_bot: true do
  subject(:irs) { described_class.new(json) }

  let(:claim) { create :claim }
  let(:injection_attempt) { claim.injection_attempts.last }

  let(:invalid_json) { { "errors": [], 'claim_id': '1234567', "messages":[] } }
  let(:valid_json_with_invalid_uuid) { { "from":"external application", "errors":[], "uuid":'b08cfd61-9999-8888-7777-651477183efb', "messages":[{'message':'Claim injected successfully.'}]} }
  let(:valid_json_on_success) { { "from":"external application", "errors":[], "uuid":claim.uuid, "messages":[{'message':'Claim injected successfully.'}]} }
  let(:valid_json_on_failure) { { "from":"external application", "errors":[ {'error':"No defendant found for Rep Order Number: '123456432'."}, {'error':"Another injection error."} ],"uuid":claim.uuid,"messages":[] } }

shared_examples "creates injection attempts" do
  it 'returns true' 


  it 'creates an injection attempt' 

end

  context 'when initialized with' do
    describe 'valid json' do
      let(:json) { valid_json_on_success }

      it { is_expected.to be_a_kind_of(described_class) }
    end

    describe 'invalid json' do
      let(:json) { invalid_json }

      it { expect { subject }.to raise_error ParseError, 'Invalid JSON string' }
    end
  end

  describe '#run!' do
    subject(:run!) { irs.run! }

    context 'when injection succeeded' do
      let(:json) { valid_json_on_success }
      include_examples 'creates injection attempts'

      it 'marks injection as succeeded' 

    end

    context 'when injection failed' do
      let(:json) { valid_json_on_failure }
      include_examples 'creates injection attempts'

      it 'marks injection as failed' 


      it 'adds error messages from the response' 

    end

    context 'when claim uuid cannot be matched' do
      let(:json) { valid_json_with_invalid_uuid }

      it { is_expected.to be false }

      it 'logs an error' 

    end
  end
end

