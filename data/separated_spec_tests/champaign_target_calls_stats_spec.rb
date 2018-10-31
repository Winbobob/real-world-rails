require 'rails_helper'

describe CallTool::TargetCallsStats do
  let!(:page) { create(:page) }
  let!(:call_tool) { create(:call_tool, page: page, targets: targets) }
  let(:targets) { build_list(:call_tool_target, 3, :with_country) }
  let(:target_a) { targets[0] }
  let(:target_b) { targets[1] }
  let(:target_c) { targets[2] }

  subject { CallTool::TargetCallsStats.new(page) }

  before do
    Timecop.travel 1.month.ago do
      create(:call, :with_busy_target_status, page: page, target: target_a)
    end
    create_list(:call, 2, :with_busy_target_status, page: page, target: target_a)
    create(:call, :with_completed_target_status, page: page, target: target_a)
    create(:call, :with_completed_target_status, page: page, target: target_b)
  end

  describe '#last_week_status_totals_by_target' do
    let(:data) { subject.last_week_status_totals_by_target }
    it 'returns the right values' 

  end

  describe '#status_totals_by_target' do
    let(:data) { subject.status_totals_by_target }
    it 'returns the right values' 

  end

  describe '#last_week_status_totals' do
    let(:data) { subject.last_week_status_totals }
    it 'returns the right values' 

  end

  describe '#status_totals' do
    let(:data) { subject.status_totals }
    it 'returns the right values' 

  end
end

