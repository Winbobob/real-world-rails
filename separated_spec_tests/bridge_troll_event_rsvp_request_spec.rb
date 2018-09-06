require 'rails_helper'

describe 'creating or editing an rsvp' do
  context "for a teaching event" do
    def fill_in_valid_volunteer_details
      fill_in "rsvp_subject_experience", with: "I have some subject experience"
      fill_in "rsvp_teaching_experience", with: "I have some teaching experience"
      choose @course.levels[0][:title]
    end

    let(:chapter) { create(:chapter) }
    before do
      @event = create(:event, chapter: chapter)
      @user = create(:user)
      @course = @event.course
      sign_in_as @user
    end

    context "with a new volunteer rsvp" do
      before do
        visit volunteer_new_event_rsvp_path(@event)
      end

      it "allows user to toggle childcare info with the needs_childcare button", js: true do
        expect(page.find("#rsvp_needs_childcare")).not_to be_checked
        expect(page).to have_field('rsvp_childcare_info', visible: false)

        page.check "rsvp_needs_childcare"

        expect(page).to have_field('rsvp_childcare_info', visible: true)

        page.uncheck "rsvp_needs_childcare"

        expect(page).to have_field('rsvp_childcare_info', visible: false)
      end

      context "with a valid RSVP" do
        before do
          fill_in_valid_volunteer_details
        end

        it "allows the user to update their gender" 


        it "allows the user to affiliate themselves with the event's region" 

      end

      context 'with an invalid RSVP' do
        it 'maintains state when the form is submitted' 

      end
    end

    context "with an rsvp with childcare info" do
      before do
        @rsvp = create(:rsvp, user: @user, childcare_info: "Bobbie: 17, Susie: 20000007")
        visit edit_event_rsvp_path @rsvp.event, @rsvp
      end

      it "allows user to toggle childcare info with the needs_childcare button", js: true do
        expect(page.find("#rsvp_needs_childcare")).to be_checked
        expect(page.find("#rsvp_childcare_info")).to have_text(@rsvp.childcare_info)

        page.uncheck "rsvp_needs_childcare"
        expect(page).to have_field('rsvp_childcare_info', visible: false)

        page.check "rsvp_needs_childcare"

        expect(page.find("#rsvp_childcare_info")).to have_text(@rsvp.childcare_info)
      end
    end

    context "with an rsvp toggling food options" do
      let(:food_text) { "The food's on us. Let us know if you have any dietary restrictions." }

      it "has food options when enabled" 


      it "does not have food options when disabled" 

    end

    context 'with an rsvp with dietary restrictions' do
      let(:rsvp) {
        create(:rsvp,
          user: @user,
          dietary_restrictions: [build(:dietary_restriction, restriction: 'vegetarian')]
        )
      }
      let(:form_url) { edit_event_rsvp_path(rsvp.event, rsvp) }

      it 'allows user to change them' 

    end

    describe "a new learn rsvp" do
      describe "plus-one host toggle" do
        let(:plus_one_host_text) { "If you are not a member of this workshop's target demographic" }

        context "when enabled" do
          it "asks for the name of the person's host (if they are a plus-one)" 

        end

        context "when disabled" do
          before do
            @event.update_attribute(:plus_one_host_toggle, false)
          end

          it "does not show the plus-one host form" 

        end
      end
    end

    describe 'displaying custom question field' do
      before do
        @event.update(custom_question: custom_question)
        visit volunteer_new_event_rsvp_path(@event)
      end

      context 'when event asks a custom question' do
        let(:custom_question) { 'What is your t-shirt size?' }

        it 'allows the user to answer the custom question' 

      end

      context 'when event does not ask a custom question' do
        let(:custom_question) { '' }

        it 'does not display a field for the user to respond to the custom question' 

      end
    end
  end

  context "for a non-teaching event" do
    before do
      @event = create(:event, course_id: nil)
      @user = create(:user)
      sign_in_as @user
      visit volunteer_new_event_rsvp_path(@event)
    end

    it "requires subject experience" 

  end
end

