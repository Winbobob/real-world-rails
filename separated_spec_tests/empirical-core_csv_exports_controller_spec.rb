require 'rails_helper'

describe Teachers::ProgressReports::CsvExportsController, type: :controller do
  include_context 'Activity Progress Report'

  describe 'POST #create' do
    let(:export_type) { 'activity_sessions' }
    let(:filters) { { unit_id: '123' } }
    subject do
      post :create, {
        report_url: "/teachers/progress_reports/standards/classrooms/#{classroom_one.id}/students",
        csv_export: {
          export_type: export_type,
          filters: filters,
        }
      }
    end

    context 'when authenticated as a teacher' do
      before do
        session[:user_id] = teacher.id
      end

      let(:response_json) { JSON.parse(response.body)['csv_export'] }

      it 'creates a CSV export with the specified type' 


      it 'assigns filters from the request params' 


      it 'parses additional filters from the report_url' 


      it 'kicks off a background job to email generate/email the CSV' 


      context 'with nested export params' do
        let(:filters) { {'sort' => {'baz' => 'blah', 'bar' => 'bar'}} }

        it 'continues to work properly' 

      end

      context 'with a nonsense export type' do
        let(:export_type) { 'foobar' }

        it 'responds with an error' 

      end
    end

    context 'when not authenticated as a teacher' do
      it 'requires a logged-in teacher' 

    end
  end
end

