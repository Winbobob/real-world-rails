require 'rails_helper'

describe AccountCreatedEmailWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }

    it 'should send the account created email to the user' 

  end
end

