require 'spec_helper'

describe Gitlab::SlashCommands::Presenters::Deploy do
  let(:build) { create(:ci_build) }

  describe '#present' do
    subject { described_class.new(build).present('staging', 'prod') }

    it { is_expected.to have_key(:text) }
    it { is_expected.to have_key(:response_type) }
    it { is_expected.to have_key(:status) }
    it { is_expected.not_to have_key(:attachments) }

    it 'messages the channel of the deploy' 

  end

  describe '#action_not_found' do
    subject { described_class.new(nil).action_not_found }

    it { is_expected.to have_key(:text) }
    it { is_expected.to have_key(:response_type) }
    it { is_expected.to have_key(:status) }
    it { is_expected.not_to have_key(:attachments) }

    it 'tells the user there is no action' 

  end
end

