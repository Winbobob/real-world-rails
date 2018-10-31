require 'spec_helper'

describe AfterBikeSaveWorker do
  let(:subject) { AfterBikeSaveWorker }
  let(:instance) { subject.new }

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

  describe "serialized" do
    let!(:bike) { FactoryGirl.create(:stolen_bike) }
    it "calls the things we expect it to call" 

  end

  describe "remove_partial_registrations" do
    let!(:partial_registration) { FactoryGirl.create(:b_param_partial_registration, owner_email: "stuff@things.COM") }
    let(:bike) { FactoryGirl.create(:bike, owner_email: "stuff@things.com") }
    it "removes the partial registration" 

    context "with a more accurate match" do
      let(:manufacturer) { bike.manufacturer }
      let!(:partial_registration_accurate) { FactoryGirl.create(:b_param_partial_registration, owner_email: "STUFF@things.com", manufacturer: manufacturer) }
      it "only removes the more accurate match" 

    end
  end
end

