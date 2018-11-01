require 'rails_helper'

describe StudentLoginPdfDownloadAnalyticsWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }
    let!(:classroom) { create(:classroom) }
    let(:analyzer) { double(:analyzer, track_student_login_pdf_download: true) }

    before do
      allow(SegmentAnalytics).to receive(:new) { analyzer }
    end

    it 'should track the student login pdf download' 

  end
end

