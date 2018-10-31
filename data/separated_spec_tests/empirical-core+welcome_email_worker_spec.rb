require 'rails_helper'

describe WelcomeEmailWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }

    it 'should send the welcome email' 

  end
end

