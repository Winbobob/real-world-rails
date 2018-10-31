# frozen_string_literal: true

require 'rails_helper'

describe QuestionsController do
  describe '#question' do
    context 'when the question exists' do
      let!(:question) { create(:q_checkbox) }
      let(:question_id) { question.id }

      before { get :question, params: { id: question_id }, format: :json }

      it 'renders the question in json' 

    end
  end

  describe '#update_position' do
    context 'when the question exists' do
      let!(:question) { create(:q_checkbox, position: 1) }
      let(:question_id) { question.id }

      before { get :update_position, params: { id: question_id, position: 50 } }

      it 'updates the postion' 

    end
  end
end

