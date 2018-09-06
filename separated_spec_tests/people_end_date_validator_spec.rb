require 'spec_helper'

describe Membership::EndDateValidator do
  context 'record is valid' do
    let(:record) { build(:membership) }
    it 'does not raise errors' 

  end

  context 'record is invalid' do
    let(:project) { build(:project, starts_at: 5.days.ago, end_at: Date.current) }
    let(:record) { build(:membership, project: project, starts_at: 3.days.ago, ends_at: 2.days.from_now) }
    it 'raises errors' 

  end
end

