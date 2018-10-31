require 'spec_helper'

RSpec.describe AccountsController, type: :controller, skip: true do
  let(:team) { Fabricate(:team, account: nil) }
  let(:plan) { Plan.create(amount: 20_000, interval: Plan::MONTHLY, name: 'Monthly') }
  let(:current_user) { Fabricate(:user) }

  before do
    team.add_member(current_user)
    controller.send :sign_in, current_user
  end

  def new_token
    Stripe::Token.create(card: { number: 4_242_424_242_424_242, cvc: 224, exp_month: 12, exp_year: 14 }).try(:id)
  end

  def valid_params
    {
      chosen_plan: plan.public_id,
      stripe_card_token: new_token
    }
  end

  it 'should create an account and send email' 


  describe '#send_inovice' do
    before do
      team.account = Account.new

      allow(Team).to receive(:find) { team }
      allow(team.account).to receive(:send_invoice_for) { true }
      allow(team.account).to receive(:admin) { current_user }

      allow(Time).to receive(:current) { Date.parse('02/11/15').to_time } # so we do not bother with the time portion of the day
    end

    it 'calls send_invoice for the last month' 


    it 'displays success message' 


    it 'redirects to team profile' 


    it 'displays failure message' 


  end
end

