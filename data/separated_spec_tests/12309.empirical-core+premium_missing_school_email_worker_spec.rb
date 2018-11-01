require 'rails_helper'

describe PremiumMissingSchoolEmailWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }

    it 'should send the premium school missing email' 

  end
end

