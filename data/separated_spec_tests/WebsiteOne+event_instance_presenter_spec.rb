require 'spec_helper'

describe EventInstancePresenter do
  let(:presenter){ EventInstancePresenter.new(hangout) }

  context 'all fields are present' do
    let(:hangout){ FactoryBot.build_stubbed(:event_instance, created: '1979-10-14 11:15 UTC') }

    it 'displays created time' 


    it 'displays title' 


    it 'displays category' 


    it 'displays project' 


    it 'displays event' 


    it 'returns host' 


    it 'returns an array of participants' 


    it 'do not show the host in the list of participants' 


    it 'returns video url' 


    it 'returns a link to video' 


    it 'returns a link to youtube player' 

  end

  context 'some fields are missing' do
    let(:hangout){ FactoryBot.build_stubbed(:event_instance,
                         title: nil,
                         category: nil,
                         project: nil,
                         event: nil,
                         user: nil,
                         yt_video_id: nil,
                         participants: nil) }

    it 'displays title' 


    it 'displays category' 


    it 'displays project' 


    it 'displays event' 


    it 'returns host' 


    it 'returns an array of participants' 


    it 'returns an array with nullUser if participant gplus_id is not found' 


    it "don't throw an exception when have nil person at participants" 


    it 'returns video url' 


    it 'returns a link to video' 


    it 'returns a link to youtube player' 

  end

end


