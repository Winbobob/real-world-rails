require 'rails_helper'

describe CallTool::MemberCallsStats do
  let!(:page) { create(:page, :with_call_tool) }
  subject { CallTool::MemberCallsStats.new(page) }

  describe '#status_totals_by_day' do
    let(:data) { subject.status_totals_by_day }

    before do
      Timecop.travel(3.days.ago) do
        create_list(:call, 3, :connected, page: page)
        create(:call, :started, page: page)
      end
    end

    it 'returns an array of 7 items' 


    it 'returns an empty row if now calls where made on that day' 


    it 'returns the appropriate calls count when calls are made' 

  end

  describe '#status_totals_by_week' do
    let(:data) { subject.status_totals_by_week }
    before do
      create_list(:call, 2, :connected, page: page)
      Timecop.travel(2.weeks.ago) do
        create(:call, :started, page: page)
      end
    end

    it 'returns an array of 5 items (last 5 weeks)' 


    it 'returns empty rows for weeks that had no calls' 


    it 'returns the appropriate calls count for the weeks that had calls' 

  end

  describe '#last_week_status_totals' do
    let(:data) { subject.last_week_status_totals }

    before do
      create_list(:call, 2, :connected, page: page)
      create_list(:call, 3, :started, page: page)
    end

    it 'returns the right values' 

  end
end

