require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Configurable do
  let(:entry) do
    Class.new(Gitlab::Ci::Config::Entry::Node) do
      include Gitlab::Ci::Config::Entry::Configurable
    end
  end

  describe 'validations' do
    context 'when entry is a hash' do
      let(:instance) { entry.new(key: 'value') }

      it 'correctly validates an instance' 

    end

    context 'when entry is not a hash' do
      let(:instance) { entry.new('ls') }

      it 'invalidates the instance' 

    end
  end

  describe 'configured entries' do
    before do
      entry.class_eval do
        entry :object, Object, description: 'test object'
      end
    end

    describe '.nodes' do
      it 'has valid nodes' 


      it 'creates a node factory' 


      it 'returns a duplicated factory object' 

    end
  end
end

