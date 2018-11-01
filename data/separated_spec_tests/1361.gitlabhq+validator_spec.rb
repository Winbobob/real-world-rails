require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Validator do
  let(:validator) { Class.new(described_class) }
  let(:validator_instance) { validator.new(node) }
  let(:node) { spy('node') }

  before do
    allow(node).to receive(:key).and_return('node')
    allow(node).to receive(:ancestors).and_return([])
  end

  describe 'delegated validator' do
    before do
      validator.class_eval do
        validates :test_attribute, presence: true
      end
    end

    context 'when node is valid' do
      before do
        allow(node).to receive(:test_attribute).and_return('valid value')
      end

      it 'validates attribute in node' 


      it 'returns no errors' 

    end

    context 'when node is invalid' do
      before do
        allow(node).to receive(:test_attribute).and_return(nil)
      end

      it 'validates attribute in node' 


      it 'returns errors' 

    end
  end
end

