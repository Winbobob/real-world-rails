# frozen_string_literal: true

require 'spec_helper'

describe Api::V1::SpeakersController do
  let!(:conference) { create(:conference) }
  let!(:event) { create(:event_full) }
  let!(:conference_event) { create(:event_full, program: conference.program) }

  let(:speaker) { create(:user, name: 'Speaker') }
  let(:conference_speaker) { create(:user, name: 'Conf_Speaker') }

  describe 'GET #index' do
    before do
      event.speakers = [speaker]
      conference_event.speakers = [conference_speaker]
    end

    context 'without conference scope' do
      it 'returns all speakers' 

    end

    context 'with conference scope' do
      it 'returns all speakers of conference' 

    end
  end
end

