require 'spec_helper'

describe Gitlab::DowntimeCheck do
  subject { described_class.new }
  let(:path) { 'foo.rb' }

  describe '#check' do
    before do
      expect(subject).to receive(:require).with(path)
    end

    context 'when a migration does not specify if downtime is required' do
      it 'raises RuntimeError' 

    end

    context 'when a migration requires downtime' do
      context 'when no reason is specified' do
        it 'raises RuntimeError' 

      end

      context 'when a reason is specified' do
        it 'returns an Array of messages' 

      end
    end
  end

  describe '#check_and_print' do
    it 'checks the migrations and prints the results to STDOUT' 

  end

  describe '#class_for_migration_file' do
    it 'returns the class for a migration file path' 

  end

  describe '#online?' do
    it 'returns true when a migration can be performed online' 


    it 'returns false when a migration can not be performed online' 

  end

  describe '#downtime_reason' do
    context 'when a reason is defined' do
      it 'returns the downtime reason' 

    end

    context 'when a reason is not defined' do
      it 'returns nil' 

    end
  end
end

