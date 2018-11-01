require 'spec_helper'

describe Projects::EndCurrentMemberships do
  let(:memberships) { [create(:membership, :without_end), create(:membership)] }
  let(:project) { create(:project, memberships: memberships) }
  subject { described_class.new(project) }
  let(:time) { Date.current.end_of_day }

  before do
    subject.call
  end

  describe '#call' do
    it 'sets ends_at for associated memberships' 

  end
end

