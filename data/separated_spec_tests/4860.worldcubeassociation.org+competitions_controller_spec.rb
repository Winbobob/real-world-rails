# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompetitionsController do
  let(:competition) { FactoryBot.create(:competition, :with_delegate, :registration_open) }
  let(:future_competition) { FactoryBot.create(:competition, :with_delegate, :ongoing) }

  describe 'GET #index' do
    describe "selecting events" do
      let!(:competition1) { FactoryBot.create(:competition, :confirmed, :visible, starts: 1.week.from_now, events: Event.where(id: %w(222 333 444 555 666))) }
      let!(:competition2) { FactoryBot.create(:competition, :confirmed, :visible, starts: 2.week.from_now, events: Event.where(id: %w(333 444 555 pyram clock))) }
      let!(:competition3) { FactoryBot.create(:competition, :confirmed, :visible, starts: 3.week.from_now, events: Event.where(id: %w(222 333 skewb 666 pyram sq1))) }
      let!(:competition4) { FactoryBot.create(:competition, :confirmed, :visible, starts: 4.week.from_now, events: Event.where(id: %w(333 pyram 666 777 clock))) }

      context "when no event is selected" do
        it "competitions are sorted by start date" 

      end

      context "when events are selected" do
        it "only competitions matching all of the selected events are shown" 


        it "competitions are still sorted by start date" 


        # See: https://github.com/thewca/worldcubeassociation.org/issues/472
        it "works when event_ids are passed as a hash instead of an array (facebook redirection)" 

      end
    end

    describe "selecting present/past/recent/custom competitions" do
      let!(:past_comp1) { FactoryBot.create(:competition, :confirmed, :visible, starts: 1.year.ago) }
      let!(:past_comp2) { FactoryBot.create(:competition, :confirmed, :visible, starts: 3.years.ago) }
      let!(:in_progress_comp1) { FactoryBot.create(:competition, :confirmed, :visible, starts: Date.today, ends: 1.day.from_now) }
      let!(:in_progress_comp2) { FactoryBot.create(:competition, :confirmed, :visible, starts: Date.today, ends: Date.today) }
      let!(:upcoming_comp1) { FactoryBot.create(:competition, :confirmed, :visible, starts: 2.weeks.from_now) }
      let!(:upcoming_comp2) { FactoryBot.create(:competition, :confirmed, :visible, starts: 3.weeks.from_now) }

      context "when present is selected" do
        before do
          get :index, params: { state: :present }
        end

        it "shows only competitions being in progress or upcoming" 


        it "upcoming competitions are sorted ascending by date" 

      end

      context "when past is selected" do
        it "when all years are selected, shows all past competitions" 


        it "when a single year is selected, shows past competitions from this year" 


        it "competitions are sorted descending by date" 

      end

      context "when recent is selected" do
        before do
          get :index, params: { state: :recent }
        end

        it "shows in progress competition that ends today" 

      end

      context "when custom is selected" do
        before do
          get :index, params: { state: :custom, from_date: 1.day.from_now, to_date: 2.weeks.from_now }
        end

        it "shows competitions overlapping the given date range" 

      end
    end
  end

  describe 'GET #show' do
    context 'when not signed in' do
      sign_out

      it 'redirects to the old php page' 


      it '404s when competition is not visible' 

    end
  end

  describe 'GET #new' do
    context 'when not signed in' do
      sign_out

      it 'redirects to the sign in page' 

    end

    context 'when signed in as an admin' do
      sign_in { FactoryBot.create :admin }

      it 'shows the competition creation form' 

    end

    context 'when signed in as a delegate' do
      sign_in { FactoryBot.create :delegate }

      it 'shows the competition creation form' 

    end

    context 'when signed in as a regular user' do
      sign_in { FactoryBot.create :user }

      it 'does not allow access' 

    end
  end

  describe 'GET #edit' do
    let(:organizer) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create :admin }
    let!(:my_competition) { FactoryBot.create(:competition, :confirmed, latitude: 10.0, longitude: 10.0, organizers: [organizer], starts: 1.week.ago) }
    let!(:other_competition) { FactoryBot.create(:competition, :with_delegate, latitude: 11.0, longitude: 11.0, starts: 1.day.ago) }

    context 'when signed in as an organizer' do
      before :each do
        sign_in organizer
      end

      it 'cannot see unconfirmed nearby competitions' 

    end

    context 'when signed in as an admin' do
      before :each do
        sign_in admin
      end

      it "can see unconfirmed nearby competitions" 

    end
  end

  describe 'POST #create' do
    context 'when not signed in' do
      it 'redirects to the sign in page' 

    end

    context 'when signed in as a regular user' do
      sign_in { FactoryBot.create :user }
      it 'does not allow creation' 

    end

    context 'when signed in as an admin' do
      sign_in { FactoryBot.create :admin }

      it "creates a new competition" 


      it "creates a competition with correct website when using WCA as competition's website" 

    end

    context 'when signed in as a delegate' do
      let(:delegate) { FactoryBot.create :delegate }
      before :each do
        sign_in delegate
      end

      it 'creates a new competition with organizers and expect them to receive a notification email' 


      it 'shows an error message under name when creating a competition with a duplicate id' 


      it 'clones a competition' 


      it 'clones a competition that they delegated' 

    end
  end

  describe 'POST #update' do
    context 'when signed in as an admin' do
      sign_in { FactoryBot.create :admin }

      it 'redirects organizer view to organizer view' 


      it 'redirects admin view to admin view' 


      it 'renders admin view when failing to save admin view' 


      it 'can confirm competition' 


      it 'saves delegate_ids' 


      it "saving removes nonexistent delegates" 


      it "saving removes nonexistent organizers" 


      it "can change competition id" 


      it "can change extra registration requirements field after competition is confirmed" 

    end

    context 'when signed in as organizer' do
      let(:organizer) { FactoryBot.create(:delegate) }
      before :each do
        competition.organizers << organizer
        future_competition.organizers << organizer
        sign_in organizer
      end

      it 'cannot pass a non-delegate as delegate' 


      it 'can change the delegate' 


      it 'cannot confirm competition' 


      it "who is also the delegate can remove oneself as delegate" 


      it "organizer cannot demote oneself" 


      it "can update the registration fees when there is no payment" 


      it "can update the registration fees when there is any payment" 

    end

    context "when signed in as board member" do
      let(:board_member) { FactoryBot.create(:user, :board_member) }

      before :each do
        sign_in board_member
      end

      it "board member can demote oneself" 


      it "board member can delete a non-visible competition" 


      it "board member cannot delete a visible competition" 

    end

    context "when signed in as delegate" do
      let(:delegate) { FactoryBot.create(:delegate) }
      let(:organizer1) { FactoryBot.create(:user) }
      let(:organizer2) { FactoryBot.create(:user) }
      before :each do
        competition.delegates << delegate
        sign_in delegate
      end

      it "adds another organizer and expects him to receive a notification email" 


      it "notifies organizers correctly when id changes" 


      it "removes an organizer and expects him to receive a notification email" 


      it "can confirm competition and expects board and organizers to receive a notification email" 


      it "cannot delete not confirmed, but visible competition" 


      it "cannot delete confirmed competition" 


      it "can delete not confirmed and not visible competition" 


      it "can change registration open/close of locked competition" 


      it "can change extra registration requirements field before competition is confirmed" 


      it "cannot change extra registration requirements field after competition is confirmed" 

    end

    context "when signed in as delegate for a different competition" do
      let(:delegate) { FactoryBot.create(:delegate) }
      before :each do
        sign_in delegate
      end

      it "cannot delete competition they are not delegating" 

    end
  end

  describe 'GET #post_announcement' do
    context 'when signed in as results team member' do
      sign_in { FactoryBot.create(:user, :wrt_member) }

      # Posts should always be in English, therefore we want to check using an English text,
      # even if the user posting has a different locale
      before :each do
        session[:locale] = :fr
      end

      it 'creates an announcement post and expects organizers to receive a notification email' 


      it 'handles nil start date' 

    end
  end

  describe 'GET #post_results' do
    context 'when signed in as results team member' do
      sign_in { FactoryBot.create(:user, :wrt_member) }

      # Posts should always be in English, therefore we want to check using an English text,
      # even if the user posting has a different locale
      before :each do
        session[:locale] = :fr
      end

      it "handles no event" 


      context "winners announcement" do
        context "333" do
          def add_result(pos, name, event_id: "333", dnf: false)
            Result.create!(
              pos: pos,
              personId: "2006YOYO#{format('%.2d', pos)}",
              personName: name,
              countryId: "USA",
              competitionId: competition.id,
              eventId: event_id,
              roundTypeId: "f",
              formatId: "a",
              value1: dnf ? SolveTime::DNF_VALUE : 999,
              value2: 999,
              value3: 999,
              value4: dnf ? SolveTime::DNF_VALUE : 999,
              value5: 999,
              best: 999,
              average: dnf ? SolveTime::DNF_VALUE : 999,
            )
          end

          let!(:unrelated_podium_result) { add_result(1, "joe", event_id: "333oh") }

          it "announces top 3 in final" 


          it "handles only 2 people in final" 


          it "handles only 1 person in final" 


          it "handles DNF averages in the podium" 


          it "handles ties in the podium" 


          it "handles tied third place" 

        end

        context "333bf" do
          def add_result(pos, name)
            Result.create!(
              pos: pos,
              personId: "2006YOYO#{format('%.2d', pos)}",
              personName: name,
              countryId: "USA",
              competitionId: competition.id,
              eventId: "333bf",
              roundTypeId: "f",
              formatId: "3",
              value1: 60.seconds.in_centiseconds,
              value2: 60.seconds.in_centiseconds,
              value3: 60.seconds.in_centiseconds,
              value4: 0,
              value5: 0,
              best: 60.seconds.in_centiseconds,
              average: 60.seconds.in_centiseconds,
            )
          end

          it "announces top 3 in final" 

        end

        context "333fm" do
          def add_result(pos, name, dnf: false)
            Result.create!(
              pos: pos,
              personId: "2006YOYO#{format('%.2d', pos)}",
              personName: name,
              countryId: "USA",
              competitionId: competition.id,
              eventId: "333fm",
              roundTypeId: "f",
              formatId: "m",
              value1: dnf ? SolveTime::DNF_VALUE : 29,
              value2: 24,
              value3: 30,
              value4: 0,
              value5: 0,
              best: 24,
              average: dnf ? SolveTime::DNF_VALUE : 2766,
            )
          end

          it "announces top 3 in final" 


          it "handles DNF averages in the podium" 

        end

        context "333mbf" do
          def add_result(pos, name)
            solve_time = SolveTime.new("333mbf", :best, 0)
            solve_time.attempted = 9
            solve_time.solved = 8
            solve_time.time_centiseconds = (45.minutes + 32.seconds).in_centiseconds
            Result.create!(
              pos: pos,
              personId: "2006YOYO#{format('%.2d', pos)}",
              personName: name,
              countryId: "USA",
              competitionId: competition.id,
              eventId: "333mbf",
              roundTypeId: "f",
              formatId: "3",
              value1: solve_time.wca_value,
              value2: solve_time.wca_value,
              value3: solve_time.wca_value,
              value4: 0,
              value5: 0,
              best: solve_time.wca_value,
              average: 0,
            )
          end

          it "announces top 3 in final" 

        end
      end

      it "announces world records" 


      it "sends the notification emails to users that competed" 


      it "sends notifications of id claim possibility to newcomers" 

    end
  end

  describe 'GET #my_competitions' do
    let(:delegate) { FactoryBot.create(:delegate) }
    let(:organizer) { FactoryBot.create(:user) }
    let!(:future_competition1) { FactoryBot.create(:competition, :registration_open, starts: 3.week.from_now, organizers: [organizer], delegates: [delegate], events: Event.where(id: %w(222 333))) }
    let!(:future_competition2) { FactoryBot.create(:competition, :registration_open, starts: 2.weeks.from_now, organizers: [organizer], events: Event.where(id: %w(222 333))) }
    let!(:future_competition3) { FactoryBot.create(:competition, :registration_open, starts: 1.weeks.from_now, organizers: [organizer], events: Event.where(id: %w(222 333))) }
    let!(:past_competition1) { FactoryBot.create(:competition, :registration_open, starts: 1.month.ago, organizers: [organizer], events: Event.where(id: %w(222 333))) }
    let!(:past_competition2) { FactoryBot.create(:competition, :registration_open, starts: 2.month.ago, delegates: [delegate], events: Event.where(id: %w(222 333))) }
    let!(:past_competition3) { FactoryBot.create(:competition, :registration_open, starts: 3.month.ago, delegates: [delegate], events: Event.where(id: %w(222 333))) }
    let!(:past_competition4) { FactoryBot.create(:competition, :registration_open, starts: 4.month.ago, results_posted_at: 1.month.ago, delegates: [delegate], events: Event.where(id: %w(222 333))) }
    let!(:unscheduled_competition1) { FactoryBot.create(:competition, starts: nil, ends: nil, delegates: [delegate], events: Event.where(id: %w(222 333)), year: "0") }
    let(:registered_user) { FactoryBot.create :user, name: "Jan-Ove Waldner" }
    let!(:registration1) { FactoryBot.create(:registration, :accepted, competition: future_competition1, user: registered_user) }
    let!(:registration2) { FactoryBot.create(:registration, :accepted, competition: future_competition3, user: registered_user) }
    let!(:registration3) { FactoryBot.create(:registration, :accepted, competition: past_competition1, user: registered_user) }
    let!(:registration4) { FactoryBot.create(:registration, :accepted, competition: past_competition3, user: organizer) }
    let!(:registration5) { FactoryBot.create(:registration, :accepted, competition: future_competition3, user: delegate) }
    let!(:results_person) { FactoryBot.create(:person, wca_id: "2014PLUM01", name: "Jeff Plumb") }
    let!(:results_user) { FactoryBot.create :user, name: "Jeff Plumb", wca_id: "2014PLUM01" }
    let!(:result) { FactoryBot.create(:result, person: results_person, competitionId: past_competition1.id) }

    context 'when not signed in' do
      sign_out

      it 'redirects to the sign in page' 

    end

    context 'when signed in as user with results for a comp they did not register for' do
      before do
        sign_in results_user
      end

      it 'shows my upcoming and past competitions' 

    end

    context 'when signed in as a regular user' do
      before do
        sign_in registered_user
      end

      it 'shows my upcoming and past competitions' 


      it 'does not show past competitions they have a rejected registration for' 


      it 'does not show upcoming competitions they have a rejected registration for' 


      it 'shows upcoming competition they have a pending registration for' 


      it 'does not show past competitions they have a pending registration for' 


      it 'does not show past competitions with results uploaded they have an accepted registration but not results for' 

    end

    context 'when signed in as an organizer' do
      before do
        sign_in organizer
      end

      it 'shows my upcoming and past competitions' 

    end

    context 'when signed in as a delegate' do
      before do
        sign_in delegate
      end

      it 'shows my upcoming and past competitions' 

    end
  end

  describe 'GET #edit_events' do
    context 'when not signed in' do
      sign_out

      it 'redirects to the sign in page' 

    end

    context 'when signed in as an admin' do
      sign_in { FactoryBot.create :admin }

      it 'shows the edit competition events form' 

    end

    context 'when signed in as a regular user' do
      sign_in { FactoryBot.create :user }

      it 'does not allow access' 

    end
  end

  describe 'POST #update_events' do
    context 'when not signed in' do
      sign_out

      it 'redirects to the sign in page' 

    end

    context 'when signed in as an admin' do
      sign_in { FactoryBot.create :admin }

      it 'updates the competition events' 

    end

    context 'when signed in as a regular user' do
      sign_in { FactoryBot.create :user }

      it 'does not allow access' 

    end
  end

  describe 'GET #payment_setup' do
    context 'when not signed in' do
      sign_out

      it 'redirects to the sign in page' 

    end

    context 'when signed in as an admin' do
      sign_in { FactoryBot.create :admin }

      it 'displays payment setup status' 

    end

    context 'when signed in as a regular user' do
      sign_in { FactoryBot.create :user }

      it 'does not allow access' 

    end
  end

  describe 'GET #stripe_connect' do
    context 'when not signed in' do
      sign_out

      it 'redirects to the sign in page' 

    end

    context 'when signed in as a regular user' do
      sign_in { FactoryBot.create :user }

      it 'does not allow access' 

    end
  end

  describe 'GET #edit_schedule' do
    context 'when not signed in' do
      sign_out

      it 'redirects to the sign in page' 

    end

    context 'when signed in as a regular user' do
      sign_in { FactoryBot.create :user }

      it 'does not allow access' 

    end

    context 'when signed in as a competition delegate' do
      before do
        sign_in competition.delegates.first
      end

      it 'displays the page' 

    end
  end
end

