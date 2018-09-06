require 'spec_helper'

describe Scheduling::BookedCheck do
  let!(:user) { create(:user) }
  let!(:expired_booked_membership) { create(:membership, :booked_expired, user: user) }
  let!(:current_booked_membership) { create(:membership, :booked, user: user) }


  subject { described_class.new.call }

  describe '#call' do
    it 'removes booked memberships that is outdated' 


    it 'leaves booked memberships that are still before expiration date' 

  end
end

