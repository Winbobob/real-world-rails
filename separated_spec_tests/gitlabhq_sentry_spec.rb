require 'spec_helper'

describe Gitlab::Sentry do
  describe '.context' do
    it 'adds the locale to the tags' 

  end

  describe '.track_exception' do
    let(:exception) { RuntimeError.new('boom') }

    before do
      allow(described_class).to receive(:enabled?).and_return(true)
    end

    it 'raises the exception if it should' 


    context 'when exceptions should not be raised' do
      before do
        allow(described_class).to receive(:should_raise?).and_return(false)
      end

      it 'logs the exception with all attributes passed' 


      it 'sets the context' 

    end
  end
end

