require 'rails_helper'

describe SupportSearch do
  before :all do
    prepare_supports
  end

  def prepare_supports
    @support ||= Support.create!(user_id: 1,
                                 topic_id: 11,
                                 receiver_id: 111,
                                 body: 'foo bar baz')
    @done_support ||= Support.create!(user_id: 2,
                                      topic_id: 22,
                                      receiver_id: 222,
                                      body: 'bingo mingo mongo',
                                      done: true)
  end

  describe '#results' do
    describe 'filters supports by' do
      let!(:support) { @support }
      let!(:done_support) { @done_support }

      it 'user_id' 


      it 'receiver_id' 


      it 'receiver_id' 


      it 'body' 


      describe "state representing" do
        it 'done supports' 


        it 'pending supports' 


        it 'all supports' 

      end
    end
  end

  describe '#paginated_results' do
    let(:search) { SupportSearch.new }

    describe 'when only page number is passed' do
      it 'it shows at least 2 records' 

    end

    describe 'when page number and per page number are passed' do
      it 'it shows as many records as defined per page' 

    end
  end
end

