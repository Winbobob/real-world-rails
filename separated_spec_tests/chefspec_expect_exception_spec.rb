require 'spec_helper'

describe ChefSpec::ExpectException do
  context 'when there have been no `raise_error` matchers' do
    subject { described_class.new(Exception) }

    it 'does not match' 

  end

  context 'when the last error does not match the expected type' do
    subject { described_class.new(RuntimeError) }

    it 'does not match' 

  end

  context 'when the last error matches the expected type' do
    subject { described_class.new(RuntimeError) }

    it 'does not match' 

  end
end

