require 'rails_helper'

describe Teachers::ProgressReports::ActivitySessionsController, type: :controller do
  let(:teacher) { create(:teacher) }
  include_context 'Topic Progress Report'
  it_behaves_like 'Progress Report' do
    let(:default_filters) { {page: 1} }
    let(:result_key) { 'activity_sessions' }
    let(:expected_result_count) { visible_activity_sessions.size }

    it_behaves_like "filtering progress reports by Unit" do
      let(:filter_value) { empty_unit.id }
      let(:expected_result_count) { 0 }
    end
  end

  context 'XHR GET #index' do
    context 'when logged in' do
      let(:json) { JSON.parse(response.body) }

      before do
        session[:user_id] = teacher.id
      end

      it 'includes the serialized data for activity sessions' 


      it 'includes the number of pages of results' 


      it 'can filter by classroom' 


      it 'can filter by student' 


      it 'fetches classroom and student data for the filter options' 

    end
  end

end

