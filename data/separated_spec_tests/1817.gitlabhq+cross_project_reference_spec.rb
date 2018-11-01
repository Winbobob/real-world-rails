require 'spec_helper'

describe Banzai::CrossProjectReference do
  let(:including_class) { Class.new.include(described_class).new }

  before do
    allow(including_class).to receive(:context).and_return({})
    allow(including_class).to receive(:parent_from_ref).and_call_original
  end

  describe '#parent_from_ref' do
    context 'when no project was referenced' do
      it 'returns the project from context' 

    end

    context 'when no project was referenced in group context' do
      it 'returns the group from context' 

    end

    context 'when referenced project does not exist' do
      it 'returns nil' 

    end

    context 'when referenced project exists' do
      it 'returns the referenced project' 

    end
  end
end

