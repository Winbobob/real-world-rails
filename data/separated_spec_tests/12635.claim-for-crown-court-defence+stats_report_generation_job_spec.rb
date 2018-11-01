require 'rails_helper'

RSpec.describe StatsReportGenerationJob, type: :job do
  describe '#perform' do
    let(:report_type) { 'provisional_assessment' }
    let(:result) { double(:generator_result) }

    subject(:job) { described_class.new }

    it 'calls the stats report generator with the provided report type' 

  end
end

