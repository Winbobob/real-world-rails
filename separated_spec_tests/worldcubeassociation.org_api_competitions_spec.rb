# frozen_string_literal: true

require "rails_helper"

RSpec.describe "API Competitions" do
  let(:headers) { { "CONTENT_TYPE" => "application/json" } }

  describe "PATCH #update_events_from_wcif" do
    let(:competition) { FactoryBot.create(:competition, :with_delegate, :with_organizer, :visible) }

    describe "website user (cookies based)" do
      context "when not signed in" do
        sign_out

        it "does not allow access" 

      end

      context "when signed in as a board member" do
        sign_in { FactoryBot.create :user, :board_member }

        it "updates the competition events of an unconfirmed competition" 


        it "does not delete all rounds of an event if something is invalid" 


        context "confirmed competition" do
          before :each do
            competition.events = [Event.find("333"), Event.find("222")]
            competition.update!(isConfirmed: true)
          end

          it "can add events" 


          it "can remove events" 

        end
      end

      context "when signed in as competition delegate" do
        let(:comp_delegate) { competition.delegates.first }

        before :each do
          sign_in comp_delegate
          competition.events = [Event.find("333"), Event.find("222")]
        end

        context "confirmed competition" do
          before :each do
            competition.update!(isConfirmed: true)
          end

          it "allows adding rounds to an event" 


          it "does not allow adding events" 


          it "does not allow removing events" 

        end

        context "unconfirmed competition" do
          it "allows adding events" 


          it "allows removing events" 

        end
      end

      context "when signed in as a regular user" do
        sign_in { FactoryBot.create :user }

        it "does not allow access" 

      end
    end

    describe "OAuth user" do
      context "as a competition manager" do
        let(:scopes) { Doorkeeper::OAuth::Scopes.new }

        before :each do
          scopes.add "manage_competitions"
          api_sign_in_as(competition.organizers.first, scopes: scopes)
        end

        it "can update events" 

      end

      context "as a normal user" do
        let(:user) { FactoryBot.create :user }
        let(:scopes) { Doorkeeper::OAuth::Scopes.new }

        before :each do
          scopes.add "manage_competitions"
          api_sign_in_as(user, scopes: scopes)
        end

        it "can't update events" 

      end
    end

    describe "CSRF" do
      # CSRF protection is always disabled for tests, enable it for this these requests.
      around(:each) do |example|
        ActionController::Base.allow_forgery_protection = true
        example.run
        ActionController::Base.allow_forgery_protection = false
      end

      context "cookies based user" do
        sign_in { FactoryBot.create :user }

        it "prevents from CSRF attacks" 

      end

      context "OAuth user" do
        let(:scopes) { Doorkeeper::OAuth::Scopes.new }

        before :each do
          scopes.add "manage_competitions"
          api_sign_in_as(competition.organizers.first, scopes: scopes)
        end

        it "does not use CSRF protection as we use oauth token" 

      end
    end
  end

  describe "PATCH #update_persons_from_wcif" do
    let!(:competition) { FactoryBot.create(:competition, :with_delegate, :with_organizer, :visible, :registration_open) }
    let!(:registration) { FactoryBot.create(:registration, competition: competition) }
    let!(:organizer_registration) { FactoryBot.create(:registration, competition: competition, user: competition.organizers.first) }

    context "when not signed in" do
      it "does not allow access" 

    end

    context "when signed in as a competition manager" do
      before { sign_in competition.organizers.first }

      it "can change roles for a person" 


      it "cannot override organizer role" 


      it "cannot change person immutable data" 

    end
  end

  describe "PATCH #update_schedule_from_wcif" do
    let!(:competition) { FactoryBot.create(:competition, :with_delegate, :with_organizer, :visible, :registration_open, with_schedule: true) }

    context "when not signed in" do
      it "does not allow access" 

    end

    context "when signed in as not a competition manager" do
      before(:each) { sign_in FactoryBot.create(:user) }
      it "does not allow access" 

    end

    context "when signed in as a competition manager" do
      before { sign_in competition.organizers.first }

      let!(:schedule) { competition.to_wcif["schedule"] }

      it "can set venues, rooms and activities" 


      it "can update venues and rooms" 


      it "can delete venues and rooms" 


      it "can update activities and nested activities" 


      it "can delete activities and nested activities" 


      it "doesn't change anything when submitting an invalid WCIF" 

    end
  end
end

def create_wcif_events(event_ids)
  event_ids.map do |event_id|
    {
      id: event_id,
      rounds: [
        {
          id: "#{event_id}-r1",
          format: "a",
          timeLimit: nil,
          cutoff: nil,
          advancementCondition: nil,
          scrambleGroupCount: 1,
        },
      ],
    }
  end
end

