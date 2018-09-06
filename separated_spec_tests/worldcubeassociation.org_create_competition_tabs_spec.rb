# frozen_string_literal: true

require "rails_helper"

RSpec.feature "create competition tabs" do
  let(:organizer) { FactoryBot.create :user }
  let(:competition) { FactoryBot.create :competition, organizers: [organizer] }

  it "creating a new tab" 


  it "editing an existing tab" 

end

