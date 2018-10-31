require 'rails_helper'

describe CreditTransactionsController do
  it { should use_before_action :signed_in! }
  let(:user) { build_stubbed(:user) }

  before do
    allow(controller).to receive(:current_user) { user }
    allow(user).to receive(:redeem_credit) { "test" }
  end

  describe '#redeem_credits_for_premium' do
    it 'should render the correct json' 

  end
end

