require 'spec_helper'

describe Users::UpdateService do
  let(:user) { create(:user) }

  describe '#execute' do
    it 'updates the name' 


    it 'returns an error result when record cannot be updated' 


    it 'includes namespace error messages' 


    it 'updates the status if status params were given' 


    it 'does not delete the status if no status param was passed' 


    it 'includes status error messages' 


    def update_user(user, opts)
      described_class.new(user, opts.merge(user: user)).execute
    end
  end

  describe '#execute!' do
    it 'updates the name' 


    it 'raises an error when record cannot be updated' 


    it 'fires system hooks when a new user is saved' 


    def update_user(user, opts)
      described_class.new(user, opts.merge(user: user)).execute!
    end
  end
end

