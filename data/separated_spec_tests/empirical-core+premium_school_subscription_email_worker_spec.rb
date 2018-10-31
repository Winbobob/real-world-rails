require 'rails_helper'

describe PremiumSchoolSubscriptionEmailWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:teacher_with_school) }

    it 'should send the premium school subscription email' 

  end
end

