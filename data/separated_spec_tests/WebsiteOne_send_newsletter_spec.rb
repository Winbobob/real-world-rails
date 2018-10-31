require 'spec_helper'

describe SendNewsletter do

  describe 'processes' do
    before :each do
      Newsletter.redefine_without_warning('CHUNK_SIZE', 5 ) # by default at 180 - but too much overhead in specs
      # make sure it takes 2 runs - a.k.a more user than CHUNK_SIZE
      FactoryBot.create_list(:user, Newsletter::CHUNK_SIZE + Newsletter::CHUNK_SIZE/2)
      @newsletter = FactoryBot.create(:newsletter, do_send: true)
    end

    after :all do
      Newsletter.redefine_without_warning('CHUNK_SIZE', 180 ) # reset to default
    end

    it 'specified chunk-size' 


    it 'persists last processed user_id' 


    it 'was_sent is false until all recipients processed' 


    it 'was_sent is true if all recipients processed' 


    it 'sends newsletter to adequate users per run' 

  end

  describe 'no unsent newsletter' do
    it 'returns nil' 

  end
end

