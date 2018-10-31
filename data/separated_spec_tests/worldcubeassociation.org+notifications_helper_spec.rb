# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationsHelper do
  describe "#notifications_for_user" do
    context "when delegate" do
      let(:delegate) { FactoryBot.create :delegate }

      context "with some unconfirmed competitions" do
        let!(:unconfirmed_competition) { FactoryBot.create :competition, delegates: [delegate] }
        let!(:confirmed_competition) { FactoryBot.create :competition, :confirmed, delegates: [delegate] }

        it "shows unconfirmed competitions" 


        it "doesn't duplicate competitions which we are both delegating and organizing" 

      end

      it "shows WCA ID claims for confirmed accounts, but not for unconfirmed accounts" 


      context "have delegated competitions that are missing reports" do
        let!(:past_competition_missing_report) { FactoryBot.create :competition, :past, :visible, :confirmed, delegates: [delegate] }
        let!(:past_competition_having_report) { FactoryBot.create :competition, :past, :visible, :confirmed, :with_delegate_report, delegates: [delegate] }
        let!(:future_competition) { FactoryBot.create :competition, :future, :visible, :confirmed, delegates: [delegate] }

        it "asks me to submit the reports" 

      end
    end

    context "when signed in as a board member" do
      let(:board_member) { FactoryBot.create :user, :board_member, :wca_id }
      let!(:unconfirmed_competition) { FactoryBot.create :competition }
      let!(:confirmed_competition) { FactoryBot.create(:competition, :confirmed) }
      let!(:visible_confirmed_competition) { FactoryBot.create(:competition, :confirmed, :visible) }
      let!(:visible_unconfirmed_competition) { FactoryBot.create :competition, :visible }

      it "shows confirmed, but not visible competitions, as well as unconfirmed, but visible competitions" 

    end

    context "when signed in as someone without a wca id" do
      let(:user) { FactoryBot.create :user }

      it "asks me to request my WCA ID" 


      it "asks me to complete my profile before registering for a competition" 


      context "when already claimed a wca id" do
        it "tells me who is working on it" 

      end
    end
  end
end

