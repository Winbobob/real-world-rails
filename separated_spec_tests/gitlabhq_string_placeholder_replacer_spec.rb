require 'spec_helper'

describe Gitlab::StringPlaceholderReplacer do
  describe '.render_url' do
    it 'returns the nil if the string is blank' 


    it 'returns the string if the placeholder regex' 


    it 'returns the string if no block given' 


    context 'when all params are valid' do
      let(:string) { '%{path}/%{id}/%{branch}' }
      let(:regex) { /(path|id)/ }

      it 'replaces each placeholders with the block result' 


      it 'does not replace the placeholder if the block result is nil' 

    end
  end
end

