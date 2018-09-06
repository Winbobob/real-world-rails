require 'spec_helper'

describe AfterBikeSaveWorker do
  it { is_expected.to be_processed_in :updates }

  describe 'enqueuing jobs' do
    let(:bike_id) { FactoryGirl.create(:ownership, user_hidden: true).bike_id }
    it 'enqueues the duplicate_bike_finder_worker' 

  end

  it "doesn't break if unable to find bike" 


  context 'changed listing order' do
    it 'updates the listing order' 

  end

  context 'unchanged listing order' do
    it 'does not update the listing order or enqueue afterbikesave' 

  end
end

