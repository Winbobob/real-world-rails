# frozen_string_literal: true

require "rails_helper"

RSpec.describe "competitions/my_competitions" do
  let(:competition) { FactoryBot.create(:competition, :registration_open, name: "Melbourne Open 2016") }
  let(:registration) { FactoryBot.create(:registration, competition: competition) }

  before do
    allow(view).to receive(:current_user) { registration.user }
    assign(:not_past_competitions, [competition])
    assign(:past_competitions, [])
  end

  it "shows upcoming competitions" 


  it "shows you are on the waiting list" 

end

