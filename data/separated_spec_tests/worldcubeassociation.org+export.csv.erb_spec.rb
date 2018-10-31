# frozen_string_literal: true

require "rails_helper"

RSpec.describe "registrations/export.csv.erb" do
  let(:competition) { FactoryBot.create :competition, :registration_open }
  let!(:user) {
    FactoryBot.create(
      :user,
      name: "Bob",
      country_iso2: "US",
      dob: Date.new(1990, 1, 1),
      gender: "m",
      email: "bob@bob.com",
    ).tap do |user|
      FactoryBot.create(
        :registration,
        competition: competition,
        accepted_at: Time.now,
        user: user,
        competition_events: [competition.competition_events.find_by!(event_id: "333")],
        guests: 1,
      )
    end
  }

  it "renders valid csv" 


  it "renders null (missing) gender as empty string" 

end

