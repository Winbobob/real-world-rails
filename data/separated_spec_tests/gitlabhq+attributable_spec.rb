require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Attributable do
  let(:node) do
    Class.new do
      include Gitlab::Ci::Config::Entry::Attributable
    end
  end

  let(:instance) { node.new }

  before do
    node.class_eval do
      attributes :name, :test
    end
  end

  context 'when config is a hash' do
    before do
      allow(instance)
        .to receive(:config)
        .and_return({ name: 'some name', test: 'some test' })
    end

    it 'returns the value of config' 


    it 'returns no method error for unknown attributes' 

  end

  context 'when config is not a hash' do
    before do
      allow(instance)
        .to receive(:config)
        .and_return('some test')
    end

    it 'returns nil' 

  end

  context 'when method is already defined in a superclass' do
    it 'raises an error' 

  end
end

