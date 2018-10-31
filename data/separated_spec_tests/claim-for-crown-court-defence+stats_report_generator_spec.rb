require 'rails_helper'

RSpec.describe Stats::StatsReportGenerator, type: :service do
  describe '.call' do
    context 'when the report type is not valid' do
      let(:report_type) { 'some-report-type' }

      it 'raises an invalid report type error' 


      it 'does not create a new report' 

    end

    context 'when there is already a report of that type in progress' do
      let(:report_type) { 'management_information' }
      let!(:report) { Stats::StatsReport.create(report_name: report_type, status: 'started', report: 'some content') }

      it 'does not create a new report' 

    end

    context 'when there is no report of that type in progress' do
      let(:report_type) { 'management_information' }
      let!(:report) { Stats::StatsReport.create(report_name: report_type, status: 'completed', report: 'some content') }
      let(:mocked_result) { Stats::Result.new('some new content', 'csv') }

      it 'creates a new report marked as completed with the generated content' 


      context 'but an error happens during the generation of the report' do
        before do
          expect(Stats::ManagementInformationGenerator).to receive(:call).and_raise(StandardError)
        end

        it 'raises the error' 


        it 'creates a new report marked as errored' 


        context 'and when the error notifications are enabled' do
          before do
            allow(Settings).to receive(:notify_report_errors).and_return(true)
          end

          it 'sends an error notification' 

        end

        context 'and when the error notifications are disabled' do
          before do
            allow(Settings).to receive(:notify_report_errors).and_return(false)
          end

          it 'does not sends an error notification' 

        end
      end
    end
  end
end

