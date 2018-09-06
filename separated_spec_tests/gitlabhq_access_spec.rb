require 'spec_helper'

describe Gitlab::SlashCommands::Presenters::Access do
  describe '#access_denied' do
    subject { described_class.new.access_denied }

    it { is_expected.to be_a(Hash) }

    it 'displays an error message' 

  end

  describe '#not_found' do
    subject { described_class.new.not_found }

    it { is_expected.to be_a(Hash) }

    it 'tells the user the resource was not found' 

  end

  describe '#authorize' do
    context 'with an authorization URL' do
      subject { described_class.new('http://authorize.me').authorize }

      it { is_expected.to be_a(Hash) }

      it 'tells the user to authorize' 

    end

    context 'without authorization url' do
      subject { described_class.new.authorize }

      it { is_expected.to be_a(Hash) }

      it 'tells the user to authorize' 

    end
  end
end

