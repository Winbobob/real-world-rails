# frozen_string_literal: true

require 'spec_helper'

describe Api::V1::EventsController do
  let!(:conference) { create(:conference) }
  let!(:event) { create(:event_full, state: 'confirmed', title: 'Example Event') }
  let!(:conference_event) { create(:event_full, state: 'confirmed', title: 'Conference Event', program: conference.program) }

  describe 'GET #index' do
    context 'without conference scope' do
      it 'returns all confirmed events' 

    end

    context 'with conference scope' do
      it 'returns all confirmed events of conference' 

    end
  end
end

