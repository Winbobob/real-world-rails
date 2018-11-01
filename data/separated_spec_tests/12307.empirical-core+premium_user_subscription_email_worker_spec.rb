require 'rails_helper'

describe PremiumUserSubscriptionEmailWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }

    it 'should send the premium user subscription email' 

  end
end

