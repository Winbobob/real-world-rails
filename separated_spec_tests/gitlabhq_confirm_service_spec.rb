require 'spec_helper'

describe Emails::ConfirmService do
  let(:user) { create(:user) }

  subject(:service) { described_class.new(user) }

  describe '#execute' do
    it 'sends a confirmation email again' 

  end
end

