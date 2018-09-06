# frozen_string_literal: true

require 'spec_helper'
describe RoomSerializer, type: :serializer do
  let(:room) { create(:room) }
  let(:serializer) { RoomSerializer.new(room) }

  it 'set guid, name and description' 

end

