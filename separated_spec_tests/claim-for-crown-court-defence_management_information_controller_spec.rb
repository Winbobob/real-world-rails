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
      before do
        allow(Stats::StatsReport).to receive(:most_recent_management_information).and_return(stats_report)
        allow(stats_report).to receive(:report).and_return(true)
        get :download
      end

      let(:stats_report) { instance_double ::Stats::StatsReport, report_name: 'management_information', download_filename: 'test.csv' }

      it 'returns http success' 


      it 'renders the template' 

    end

    describe '#GET generate' do
      before do
        allow(ManagementInformationGenerationJob).to receive(:perform_later)
        get :generate
      end

      it 'returns http success' 


      it 'redirect to the login prompt' 


      it 'starts a ManagemenInformationGeneration job' 

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

