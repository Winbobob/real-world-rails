# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompetitionTabsController, type: :controller do
  let(:organizer) { FactoryBot.create :user }
  let(:competition) { FactoryBot.create :competition, organizers: [organizer] }

  context "when signed in as organizer" do
    before do
      sign_in organizer
    end

    it "can view the tabs index for his competition" 


    it "can create a new tab" 


    it "can update an existing tab" 


    it "can destroy an existing tab" 

  end
end

