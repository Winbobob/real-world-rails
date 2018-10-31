# frozen_string_literal: true

describe QA::Scenario::Test::Integration::Mattermost do
  context '#perform' do
    it_behaves_like 'a QA scenario class' do
      let(:args) { %w[gitlab_address mattermost_address] }
      let(:tags) { [:mattermost] }
      let(:options) { ['path1']}

      it 'requires a GitHub access token' 

    end
  end
end

