# frozen_string_literal: true

require 'spec_helper'

describe Api::V1::RoomsController do
  let!(:conference) { create(:conference) }
  let!(:venue) { create(:venue, conference: conference) }
  let!(:conference_room) { create(:room, name: 'Conference Room', venue: venue) }
  let!(:room) { create(:room, name: 'Test Room') }

  describe 'GET #index' do
    context 'without conference scope' do
      it 'returns all rooms' 

    end

    context 'with conference scope' do
      it 'returns all rooms of conference' 

    end
  end
end

