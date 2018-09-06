require 'rails_helper'

RSpec.describe HealthStatusController, type: :controller do

  describe 'GET #ping' do
    before { get :ping }

    it 'returns success code' 


    it 'returns JSON' 


    describe 'renders correct json' do
      let(:json) { JSON.parse(response.body) }
      let(:keys) do
        ["version_number",
         "build_date",
         "commit_id",
         "build_tag"]
      end

      it 'has ping.json schema defined keys' 


      it 'key count' 

    end
  end

  describe 'GET #raise_exception' do
    it { expect { get :raise_exception }.to raise_exception(RuntimeError) }
  end

  describe 'GET #healthcheck' do
    context 'when all the components are operational' do
      before do
        hash = {
          ok: true,
          database: {
            description: "Postgres database",
            ok: true
          },
          smtp: {
            description: "SMTP server",
            ok: true
          }
        }
        allow(HealthStatus).to receive(:current_status).and_return(hash)
        get :healthcheck
      end

      it 'returns JSON' 


      it 'completes with status code 200' 

    end

    context 'when database is down' do
      before do
        hash = {
          ok: false,
          database: {
            description: "Postgres database",
            ok: false
          }
        }
        allow(HealthStatus).to receive(:current_status).and_return(hash)
        get :healthcheck
      end

      it 'returns JSON' 


      it 'completes with error status code 500' 

    end

    context 'when SMTP server is down' do
      before do
        hash = {
          ok: false,
          database: {
            description: "Postgres database",
            ok: true
          },
          smtp: {
            description: "SMTP server",
            ok: false
          }
        }
        allow(HealthStatus).to receive(:current_status).and_return(hash)
        get :healthcheck
      end

      it 'returns JSON' 


      it 'completes with error status code 500' 

    end

    context 'when DWP proxy API is up' do

      before {
        hash = {
          ok: true,
          database: {
            description: 'Postgres database',
            ok: true
          },
          smtp: {
            description: 'SMTP server',
            ok: true
          },
          api: {
            description: 'DWP API',
            ok: true
          }
        }
        allow(HealthStatus).to receive(:current_status).and_return(hash)
        get :healthcheck
      }

      it 'completes successfully' 

    end

    context 'when DWP proxy API is down' do
      before do
        hash = {
          ok: false,
          database: {
            description: 'Postgres database',
            ok: true
          },
          smtp: {
            description: 'SMTP server',
            ok: true
          },
          api: {
            description: 'DWP API',
            ok: false
          }
        }
        allow(HealthStatus).to receive(:current_status).and_return(hash)
        get :healthcheck
      end

      it 'completes with error status code 500' 

    end
  end
end

