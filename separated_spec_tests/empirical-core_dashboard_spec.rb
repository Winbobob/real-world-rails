require 'rails_helper'

describe 'Dashboard', redis: :true do
  let(:classroom_with_sufficient_data) {create(:classroom_with_35_classroom_activities)}
  let(:teacher_with_sufficient_data) {classroom_with_sufficient_data.owner}
  let(:classroom_with_no_activities) {create(:classroom)}
  let(:teacher_with_no_activities) {classroom_with_no_activities.owner}

  before(:each) do
    $redis.redis.flushdb
  end

  context 'when there are no completed activities' do
    it "returns results that state insufficient data" 

  end

  context 'when there are more than 30 completed activities' do
    it "returns the 5 students" 


    it "returns the lowest scoring student" 

  end

  context 'when it is called' do
    it "sets a cache if none exsits" 


    it "returns a cache if one does exist" 

  end
end

