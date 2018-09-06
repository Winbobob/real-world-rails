require 'rails_helper'

describe AskForSupportNotification do
  describe '#message' do
    let(:support) { Support.create }
    subject { described_class.new(support) }

    it 'has proper support url' 

  end
end

