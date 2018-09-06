require 'rails_helper'

describe BareAsciicastPagePresenter do

  describe '.build' do
    subject { described_class.build(asciicast, playback_options) }

    let(:asciicast) { stub_model(Asciicast, decorate: decorated_asciicast) }
    let(:playback_options) { { speed: 3.0 } }
    let(:decorated_asciicast) { double('decorated_asciicast', theme_name: 'foo') }

    it "builds presenter with given asciicast decorated" 


    it "builds presenter with given playback options" 

  end

end

