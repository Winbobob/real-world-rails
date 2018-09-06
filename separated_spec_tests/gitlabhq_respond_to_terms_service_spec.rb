require 'spec_helper'

describe Users::RespondToTermsService do
  let(:user) { create(:user) }
  let(:term) { create(:term) }

  subject(:service) { described_class.new(user, term) }

  describe '#execute' do
    it 'creates a new agreement if it did not exist' 


    it 'updates an agreement if it existed' 


    it 'adds the accepted terms to the user' 


    it 'removes accepted terms when declining' 

  end
end

