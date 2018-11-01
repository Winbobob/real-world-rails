# frozen_string_literal: true

describe QA::Scenario::Test::Integration::Github do
  context '#perform' do
    let(:env) { spy('Runtime::Env') }

    before do
      stub_const('QA::Runtime::Env', env)
    end

    it_behaves_like 'a QA scenario class' do
      let(:tags) { [:github] }

      it 'requires a GitHub access token' 

    end
  end
end

