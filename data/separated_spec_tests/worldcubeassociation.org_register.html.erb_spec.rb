# frozen_string_literal: true

require "rails_helper"

RSpec.describe "registrations/register" do
  it "shows waiting list information" 


  it "shows message about registration being past" 


  it "shows message about registration not yet being open" 


  def setup(payment_status)
    competition = FactoryBot.create(:competition, :entry_fee, :visible, :registration_open)
    registration = FactoryBot.create(:registration, payment_status, competition: competition)
    allow(view).to receive(:current_user) { registration.user }
    assign(:competition, competition)
    assign(:registration, registration)
    assign(:selected_events, [])
    render
  end

  it "renders paid registrations" 


  it "renders unpaid registrations and ask for payment" 

end

