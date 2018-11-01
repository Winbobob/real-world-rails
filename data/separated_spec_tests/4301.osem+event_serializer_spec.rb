# frozen_string_literal: true

require 'spec_helper'
describe EventSerializer, type: :serializer do
  let(:event) { create(:event, title: 'Some Talk', abstract: 'Lorem ipsum dolor sit amet') }
  let(:serializer) { EventSerializer.new(event) }

  context 'event does not have date, room and tracks assigned' do
    it 'sets guid, title, length, abstract and type' 

  end

  context 'event has date, speakers, room and tracks assigned' do
    let(:speaker) { create(:user) }
    let(:room) { create(:room) }
    let(:track) { create(:track) }

    before do
      event.language = 'English'
      event.speakers = [speaker]
      create(:event_schedule, event: event, room: room, start_time: Date.new(2014, 03, 04) + 9.hours)
      event.track = track
    end

    it 'sets guid, title, length, abstract, type, date, language, speakers, room and track' 

  end
end

