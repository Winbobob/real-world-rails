require 'rails_helper'

describe AsciicastSerializer do

  let(:serializer) { AsciicastSerializer.new(asciicast, playback_options: PlaybackOptions.new) }
  let(:asciicast) { create(:asciicast) }

  describe '#to_json' do
    subject { JSON.parse(serializer.to_json) }

    it 'includes id' 


    it 'includes url' 


    it 'includes snapshot' 


    it 'includes width' 


    it 'includes height' 

  end

end

