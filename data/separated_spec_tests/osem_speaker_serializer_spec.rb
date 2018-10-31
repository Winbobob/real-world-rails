# frozen_string_literal: true

require 'spec_helper'
describe SpeakerSerializer, type: :serializer do
  let(:speaker) { create(:user, name: 'John Doe', affiliation: 'JohnDoesInc', biography: nil) }
  let(:serializer) { SpeakerSerializer.new(speaker) }

  context 'speaker does not have biography' do
    it 'sets name and affiliation' 

  end

  context 'speaker has biography' do
    before{ speaker.update_attributes(biography: 'Doest of all Jon Does') }

    it 'sets name, affiliation and biography' 

  end
end

