require 'spec_helper'

describe Project::DatesChronologyValidator do
  context 'record is valid' do
    let(:record) { build(:project) }
    it 'does not raise errors' 

  end

  context 'record is invalid' do
    let(:record) { build(:project, starts_at: Date.current, end_at: 2.days.ago) }
    it 'raises errors' 

  end
end

