require 'rails_helper'

describe NewAdminEmailWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }
    let!(:school) { create(:school) }

    it 'should send the new admin email' 

  end
end

