# frozen_string_literal: true

require 'spec_helper'

describe EventsHelper, type: :helper do
  let(:conference) { create(:conference) }
  let(:event) { create(:event_full, program: conference.program) }
  let(:my_vote) { 3 }
  let(:max_rating) { 5 }
  let(:fraction) { my_vote.to_s + '/' + max_rating.to_s }

  setup do
    allow(event).to receive(:average_rating) { my_vote }
  end

  describe '#registered_text' do
    describe 'returns correct string' do
      it 'when there are no registrations' 


      it 'when there is 1 registration' 

    end
  end

  describe '#rating_tooltip' do
    let(:vote_count) { pluralize(event.voters.length, 'vote') }

    it 'includes the average rating' 

    it 'includes the vote count' 

  end

  describe '#rating_fraction' do
    it 'represents the rating as a fraction of the max' 


    describe 'rating_stars' do
      it 'renders labels for each value of max_rating' 


      it 'renders bright labels for each value of vote' 

    end
  end

  describe '#event_switch_checkbox' do
    let(:result) do
      event_switch_checkbox(event, :is_highlight, conference.short_title)
    end

    it 'should build a switch checkbox' 


    it 'should use the admin event url' 

  end

  describe '#event_type_dropdown' do
    let(:event_types) do
      [
        event.event_type,
        create(:event_type, title: 'foo'),
        create(:event_type, title: 'bar')
      ]
    end
    let(:result) do
      event_type_dropdown(event, event_types, conference.short_title)
    end

    it 'builds a bootstrap dropdown list of event types' 

  end

  describe '#track_dropdown' do
    let(:tracks) do
      [
        event.track,
        create(:track, name: 'foo'),
        create(:track, name: 'bar')
      ]
    end
    let(:result) do
      track_dropdown(event, tracks, conference.short_title)
    end

    it 'builds a bootstrap dropdown list of tracks' 

  end

  describe '#difficulty_dropdown' do
    let(:difficulties) do
      [
        event.difficulty_level,
        create(:difficulty_level, title: 'foo'),
        create(:difficulty_level, title: 'bar')
      ]
    end
    let(:result) do
      difficulty_dropdown(event, difficulties, conference.short_title)
    end

    it 'builds a bootstrap dropdown list of difficulty levels' 

  end

  describe '#state_dropdown' do
    let(:conference_id) { conference.short_title }
    let(:email_settings) { conference.email_settings }

    setup do
      allow(event).to receive(:transition_possible?).at_least(:once) { false }
    end

    it 'builds a bootstrap dropdown list of event states' 


    it 'handles the accept transition' 


    it 'handles the accept transition without email' 


    it 'handles the reject transition' 


    it 'handles the reject transition without email' 


    it 'handles the restart transition' 


    it 'handles the confirm transition' 


    it 'handles the cancel transition' 

  end
end

