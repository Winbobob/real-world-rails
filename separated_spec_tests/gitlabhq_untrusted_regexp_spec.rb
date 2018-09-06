require 'spec_helper'

describe Gitlab::UntrustedRegexp do
  describe '#initialize' do
    subject { described_class.new(pattern) }

    context 'invalid regexp' do
      let(:pattern) { '[' }

      it { expect { subject }.to raise_error(RegexpError) }
    end
  end

  describe '#replace_all' do
    it 'replaces all instances of the match in a string' 

  end

  describe '#replace' do
    it 'replaces the first instance of the match in a string' 

  end

  describe '#===' do
    it 'returns true for a match' 


    it 'returns false for no match' 

  end

  describe '#scan' do
    subject { described_class.new(regexp).scan(text) }
    context 'malicious regexp' do
      let(:text) { malicious_text }
      let(:regexp) { malicious_regexp }

      include_examples 'malicious regexp'
    end

    context 'empty regexp' do
      let(:regexp) { '' }
      let(:text) { 'foo' }

      it 'returns an array of nil matches' 

    end

    context 'empty capture group regexp' do
      let(:regexp) { '()' }
      let(:text) { 'foo' }

      it 'returns an array of nil matches in an array' 

    end

    context 'no capture group' do
      let(:regexp) { '.+' }
      let(:text) { 'foo' }

      it 'returns the whole match' 

    end

    context 'one capture group' do
      let(:regexp) { '(f).+' }
      let(:text) { 'foo' }

      it 'returns the captured part' 

    end

    context 'two capture groups' do
      let(:regexp) { '(f).(o)' }
      let(:text) { 'foo' }

      it 'returns the captured parts' 

    end
  end
end

