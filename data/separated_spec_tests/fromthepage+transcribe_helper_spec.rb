require 'spec_helper'

RSpec.describe TranscribeHelper, type: :helper do
  describe '#excerpt_subject' do
    let(:page) { FactoryBot.build_stubbed(:page,
      source_text: "5\n4\n3\n2\n1\n[[Transcription]]\n1\n2\n3\n4\n5",
      source_translation: "5\n4\n3\n2\n1\n[[Translation]]\n1\n2\n3\n4\n5",
    ) }
    it 'should default to transcription match with three lines of context' 


    it 'should match translation based on option' 


    it 'should match the title and one line on either side' 


    it 'should match only the title with radius 0' 

    it 'should return only title with invalid parameter' 

    it "should return only title if there's no match" 

  end
end

