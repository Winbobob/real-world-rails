require 'spec_helper'

RSpec.describe HealthCheckController, type: :controller do
  describe '#healthcheck' do
    context 'when a problem exists' do
      before do
        expect(ActiveRecord::Base.connection).to receive(:active?).once.and_raise(PG::ConnectionBad)
        get :healthcheck
      end

      it { expect(response).to have_http_status(:success) }

      let(:expected_response) do
        {
          checks: { database: false },
          ok: false
        }.to_json
      end

      it 'returns the expected response report' 

    end

    context 'when everything is ok' do
      before do
        get :healthcheck
      end

      let(:expected_response) do
        {
          checks: { database: true },
          ok: true
        }.to_json
      end

      it { expect(response).to have_http_status(:success) }

      it 'returns the expected response report' 

    end
  end

  describe '#ping' do
    before { get :ping }

    subject { response }

    it { is_expected.to have_http_status(:success) }

    context 'returned schema' do
      let(:keys) { ['version_number', 'build_date', 'commit_id', 'build_tag'] }

      subject { JSON.parse(response.body) }

      it 'matches ping.json schema names' 


      it 'matches ping.json schema key count' 

    end
  end
end

