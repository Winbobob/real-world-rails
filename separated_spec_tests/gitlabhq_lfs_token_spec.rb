require 'spec_helper'

describe Gitlab::LfsToken do
  describe '#token' do
    shared_examples 'an LFS token generator' do
      it 'returns a randomly generated token' 


      it 'returns the correct token based on the key' 

    end

    context 'when the actor is a user' do
      let(:actor) { create(:user) }
      let(:handler) { described_class.new(actor) }

      it_behaves_like 'an LFS token generator'

      it 'returns the correct username' 


      it 'returns the correct token type' 

    end

    context 'when the actor is a deploy key' do
      let(:actor) { create(:deploy_key) }
      let(:handler) { described_class.new(actor) }

      it_behaves_like 'an LFS token generator'

      it 'returns the correct username' 


      it 'returns the correct token type' 

    end
  end
end

