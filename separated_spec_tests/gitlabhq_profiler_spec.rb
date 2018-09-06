require 'spec_helper'

describe Gitlab::Profiler do
  RSpec::Matchers.define_negated_matcher :not_change, :change

  let(:null_logger) { Logger.new('/dev/null') }
  let(:private_token) { 'private' }

  describe '.profile' do
    let(:app) { double(:app) }

    before do
      allow(ActionDispatch::Integration::Session).to receive(:new).and_return(app)
      allow(app).to receive(:get)
    end

    it 'returns a profile result' 


    it 'uses the custom logger given' 


    it 'sends a POST request when data is passed' 


    it 'uses the private_token for auth if given' 


    it 'uses the user for auth if given' 


    context 'when providing a user without a personal access token' do
      it 'raises an error' 

    end

    it 'uses the private_token for auth if both it and user are set' 

  end

  describe '.create_custom_logger' do
    it 'does nothing when nil is passed' 


    context 'the new logger' do
      let(:custom_logger) do
        described_class.create_custom_logger(null_logger, private_token: private_token)
      end

      it 'does not affect the existing logger' 


      it 'strips out the private token' 


      it 'tracks model load times by model' 


      it 'logs the backtrace, ignoring lines as appropriate' 

    end
  end

  describe '.with_custom_logger' do
    context 'when the logger is set' do
      it 'uses the replacement logger for the duration of the block' 


      it 'returns the result of the block' 

    end

    context 'when the logger is nil' do
      it 'returns the result of the block' 


      it 'does not modify the standard Rails loggers' 

    end
  end

  describe '.log_load_times_by_model' do
    it 'logs the model, query count, and time by slowest first' 


    it 'does nothing when called with a logger that does not have load times' 

  end
end

