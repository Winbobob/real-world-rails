require 'rails_helper'
require 'health_check_middleware'

RSpec.describe HealthCheckMiddleware do
  let(:env) { {} }
  let(:app) { double }
  subject { HealthCheckMiddleware.new(app) }

  context 'invoking the healthcheck based on paths' do
    it 'matches "/health-check"' 


    it 'matches "/health-check/" (e.g. trailing slashes)' 


    it 'ignores "/health-check/blah" (e.g. extra path segments after health-check)' 


    it 'ignores "/blah/health-check" (e.g. extra path segments before health-check)' 


    it 'ignores "/petitions/1/" (e.g. paths that look nothing like health-check)' 

  end

  context 'when the PATH_INFO inovkes the health check' do
    let(:checkup_data) { {} }
    before do
      env['PATH_INFO'] = '/health-check'
      allow(HealthCheck).to receive(:checkup).with(env).and_return checkup_data
    end

    it 'renders the result of the checkup as JSON' 

  end

  context 'when the PATH_INFO does not invoke the health check' do
    before { env['PATH_INFO'] = '/petitions/1' }

    it 'calls through to the wrapped app and returns its response' 

  end
end

