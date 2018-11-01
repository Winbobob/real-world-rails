require 'rails_helper'

describe Teachers::ProgressReports::Concepts::StudentsController, type: :controller do
  include_context 'Student Concept Progress Report'
  it_behaves_like 'Progress Report' do
    let(:result_key) { 'students' }
    let(:expected_result_count) { visible_students.size }
  end

  context 'GET #index json' do
    context 'when logged in' do
      let(:json) { JSON.parse(response.body) }
      subject { get :index, format: :json }
      before do
        session[:user_id] = teacher.id
      end

      it 'includes a list of students in the JSON' 

    end
  end
end

