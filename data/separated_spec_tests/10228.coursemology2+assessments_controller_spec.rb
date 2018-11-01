# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::AssessmentsController do
  let!(:instance) { Instance.default }

  with_tenant(:instance) do
    let(:user) { create(:user) }
    let!(:course) { create(:course, creator: user) }
    let(:category) { course.assessment_categories.first }
    let(:tab) { category.tabs.first }
    let!(:immutable_assessment) do
      create(:assessment, course: course).tap do |stub|
        allow(stub).to receive(:destroy).and_return(false)
      end
    end

    before { sign_in(user) }

    describe '#index' do
      context 'when a category is given' do
        before do
          post :index,
               params: {
                 course_id: course,
                 id: immutable_assessment,
                 assessment: { title: '' },
                 category: category
               }
        end
        it { expect(controller.instance_variable_get(:@category)).to eq(category) }
      end

      context 'when a tab is given' do
        before do
          post :index,
               params: {
                 course_id: course,
                 id: immutable_assessment,
                 assessment: { title: '' },
                 category: category,
                 tab: tab
               }
        end
        it { expect(controller.instance_variable_get(:@tab)).to eq(tab) }
      end
    end

    describe '#update' do
      let(:student) { create(:course_student, course: course).user }
      let(:assessment) do
        create(:assessment, :published_with_mrq_question, course: course, start_at: 1.day.from_now)
      end

      context 'when update fails' do
        it 'renders JSON errors' 

      end

      it 'updates the start_at and end_at' 


      context 'when the assessment is autograded' do
        let(:assessment) { create(:assessment, :autograded, course: course) }
        it 'does not update attributes tabbed_view and password' 

      end

      context 'when the assessment is not autograded' do
        let(:assessment) { create(:assessment, course: course) }
        it 'does not update attribute skippable' 

      end
    end

    describe '#destroy' do
      subject { delete :destroy, params: { course_id: course, id: immutable_assessment } }

      context 'when destroy fails' do
        before { controller.instance_variable_set(:@assessment, immutable_assessment) }

        it 'redirects with a flash message' 

      end
    end

    describe '#add_assessment_breadcrumbs' do
      let(:breadcrumbs) { controller.send(:breadcrumb_names) }
      let(:tabs) { 1 }
      before do
        create_list(:course_assessment_tab, tabs - 1,
                    category: course.assessment_categories.first)
        get :index, params: { course_id: course.id }
      end

      context 'when the category has one tab' do
        it 'only displays the category' 

      end

      context 'when the category has more than one tab' do
        let(:tabs) { 2 }
        it 'also displays the tab' 

      end
    end

    describe '#reorder' do
      let!(:questions) do
        create_list(:course_assessment_question, 2, assessment: immutable_assessment)
      end

      context 'when a valid ordering is given' do
        let(:reversed_order) { immutable_assessment.question_assessments.map(&:id).reverse }

        before do
          post :reorder,
               as: :js,
               params: { course_id: course, id: immutable_assessment, question_order: reversed_order.map(&:to_s) }
        end

        it 'reorders questions' 

      end

      context 'when an invalid ordering is given' do
        subject do
          post :reorder,
               as: :js,
               params: { course_id: course, id: immutable_assessment, question_order: [questions.first.id] }
        end

        it 'raises ArgumentError' 

      end
    end
  end
end

