require 'spec_helper'

describe Gitlab::Ci::Build::Policy do
  let(:policy) { spy('policy specification') }

  before do
    stub_const("#{described_class}::Something", policy)
  end

  describe '.fabricate' do
    context 'when policy exists' do
      it 'fabricates and initializes relevant policy' 

    end

    context 'when some policies are not defined' do
      it 'gracefully skips unknown policies' 

    end

    context 'when passing a nil value as specs' do
      it 'returns an empty array' 

    end
  end
end

