require 'rails_helper'

RSpec.describe CaseWorkers::Admin::ManagementInformationController, type: :controller do
  let(:case_worker_admin) { create(:case_worker, :admin) }
  let(:case_worker) { create(:case_worker) }

  before { sign_in persona.user }

  context 'when signed in as an admin' do
    let(:persona) { case_worker_admin }

    describe 'GET #index' do
      before { get :index }

      it 'returns http success' 


      it 'renders the template' 

    end

    describe '#GET download' do
      context 'for a valid report type' do
        let(:report_type) { 'management_information' }

        context 'using DB storage' do
          let(:content) { 'header1,header2,header3' }
          let!(:stats_report) { create(:stats_report, report_name: 'management_information', report: content) }

          before do
            get :download, params: { report_type: report_type }
          end

          it 'returns http success' 


          it 'renders the template' 

        end

        context 'using S3 storage' do
          let(:content) { 'header1,header2,header3' }
          let(:document) { StringIO.new(content) }
          let!(:stats_report) {
            create(:stats_report,
                   report_name: report_type,
                   document: document,
                   document_file_name: "#{report_type}_#{Time.now.to_s(:number)}.csv",
                   document_content_type: 'text/csv'
                  )
          }

          before do
            get :download, params: { report_type: report_type }
          end

          after { document.close }

          it 'returns http success' 


          it 'renders the template' 

        end
      end

      context 'for an invalid report type' do
        let(:report_type) { 'invalid_report_type' }

        before do
          get :download, params: { report_type: report_type }
        end

        it 'redirects to the management information page with an error' 

      end
    end

    describe '#GET generate' do
      context 'for a valid report type' do
        let(:report_type) { 'management_information' }

        before do
          allow(StatsReportGenerationJob).to receive(:perform_later).with(report_type)
          get :generate, params: { report_type: report_type }
        end

        it 'redirects the user to the management information page with a successful alert message' 


        it 'starts a ManagemenInformationGeneration job' 

      end

      context 'for an invalid report type' do
        let(:report_type) { 'invalid_report_type' }

        before do
          get :generate, params: { report_type: report_type }
        end

        it 'redirects to the management information page with an error' 

      end
    end
  end

  context 'when signed in as a case worker' do
    let(:persona) { case_worker }

    [:index, :download, :generate].each do |view|
      describe "GET ##{view}" do
        before { get view }

        it 'returns an http redirect' 


        it 'redirect to the login prompt' 

      end
    end
  end
end

