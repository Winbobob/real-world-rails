require 'rails_helper'

describe Jobs::ToggleTopicClosed do
  let(:admin) { Fabricate(:admin) }

  let(:topic) do
    Fabricate(:topic_timer, user: admin).topic
  end

  before do
    SiteSetting.queue_jobs = true
  end

  it 'should be able to close a topic' 


  describe 'opening a topic' do
    it 'should be work' 


    describe 'when category has auto close configured' do
      let(:category) { Fabricate(:category, auto_close_hours: 5) }
      let(:topic) { Fabricate(:topic, category: category, closed: true) }

      it "should restore the category's auto close timer" 

    end
  end

  describe 'when trying to close a topic that has been deleted' do
    it 'should not do anything' 

  end

  describe 'when user is not authorized to close topics' do
    let(:topic) do
      Fabricate(:topic_timer, execute_at: 2.hours.from_now).topic
    end

    it 'should not do anything' 

  end
end

