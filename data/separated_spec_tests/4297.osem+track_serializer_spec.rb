# frozen_string_literal: true

require 'spec_helper'

describe TrackSerializer, type: :serializer do
  let(:track) { create(:track) }
  let(:serializer) { TrackSerializer.new(track) }

  it 'sets guild, name, color' 

end

