# frozen_string_literal: true

require 'spec_helper'

describe Api::V1::TracksController do
  let!(:conference) { create(:conference) }
  let!(:conference_track) { create(:track, name: 'Conference Track', program_id: conference.program.id) }
  let!(:track) { create(:track, name: 'Test Track') }

  describe 'GET #index' do
    context 'without conference scope' do
      it 'returns all tracks' 

    end

    context 'with conference scope' do
      it 'returns all rooms of conference' 

    end
  end
end

