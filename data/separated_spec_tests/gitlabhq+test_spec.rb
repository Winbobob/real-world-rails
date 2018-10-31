require 'spec_helper'

describe Gitlab::Ci::Parsers::Test do
  describe '.fabricate!' do
    subject { described_class.fabricate!(file_type) }

    context 'when file_type exists' do
      let(:file_type) { 'junit' }

      it 'fabricates the class' 

    end

    context 'when file_type does not exist' do
      let(:file_type) { 'undefined' }

      it 'raises an error' 

    end
  end
end

