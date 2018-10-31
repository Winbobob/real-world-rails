require 'spec_helper'

describe Scheduling::MissingUsers do
  let!(:technical_users) { create_list(:user, 5, :developer) }
  let!(:other_technial_users) { create_list(:user, 3, :developer) }
  let(:pm_user) { create(:pm_user) }
  let(:qa_user) { create(:qa_user) }

  subject { described_class.new(other_technial_users.map(&:id)) }

  describe '#call' do
    it 'returns users that are not in the given ids list' 


    it 'returns users that are with technical roles as primary' 

  end
end

