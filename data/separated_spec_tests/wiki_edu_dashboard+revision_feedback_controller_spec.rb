# frozen_string_literal: true

require 'rails_helper'

describe RevisionFeedbackController do
  describe '#index' do
    let!(:course) { create(:course, id: 1) }
    let(:assignment) { create(:assignment, id: 1, course_id: course.id) }
    let(:params) { { 'title': 'Quantum_Chemistry', 'assignment_id': assignment.id } }

    context 'When the article exists' do
      before do
        VCR.use_cassette 'ores_features' do
          get :index, params: params
        end
      end

      it 'renders without error' 


      it 'calls RevisionFeedbackService with features' 


      it 'assigns valid feedback' 

    end
  end
end

