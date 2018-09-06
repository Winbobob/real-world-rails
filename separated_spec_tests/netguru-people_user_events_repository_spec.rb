require 'spec_helper'

describe UserEventsRepository do
  let(:membership) { create :membership }
  let(:user) { membership.user }
  let(:project) { membership.project }
  let(:user_memberships_repository) { UserMembershipsRepository.new(user) }

  describe '#all' do
    subject { described_class.new(user_memberships_repository).all }

    it 'returns id of project under id key' 


    it 'returns name of project under text key' 


    it 'returns user id under user_id key' 

  end
end

