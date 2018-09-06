require 'rails_helper'

describe 'the post-workshop survey' do
  let(:submit_button_text) { 'Submit' }

  before do
    @event = create(:event)
    @user = create(:user)
    @rsvp = create(:rsvp, user: @user, event: @event)
  end

  describe 'previewing survey' do
    before do
      @organizer = create(:user)
      @event.organizers << @organizer
      sign_in_as @organizer
      visit preview_event_surveys_path(@event)
    end

    it 'does not allow organizer to submit survey' 


    it 'allows organizer to email RSVPs the survey' 

  end

  describe 'taking a survey' do
    before do
      sign_in_as @user
      visit new_event_rsvp_survey_path(@event, @rsvp)
    end

    context 'with a new survey' do
      it 'has survey questions' 


      it 'redirects home on submit' 

    end

    context 'with an already-taken survey' do
      before do
        fill_in 'What was great?', with: "Hotdogs"
        click_button submit_button_text
        visit new_event_rsvp_survey_path(@event, @rsvp)
      end

      it 'has a flash warning' 


      it 'shows you your previous answers' 


      it 'does not have a submit button' 

    end
  end

  describe 'viewing the survey results' do
    before do
      create(:survey, rsvp: @rsvp)
    end

    context 'as an organizer' do
      before do
        @organizer = create(:user)
        @event.organizers << @organizer
        sign_in_as @organizer
        visit event_surveys_path(@event)
      end

      it 'shows the feedback' 

    end
  end
end


