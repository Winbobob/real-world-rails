# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Conditional::ConditionalSatisfiabilityEvaluationService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course) { create(:course) }

    describe '#evaluate' do
      let(:course_user) { create(:course_user, course: course) }
      let!(:achievement) do
        create(:course_achievement, :with_level_condition, course: course)
      end
      let!(:unpublished_achievement) do
        create(:course_achievement, :with_level_condition, course: course, published: false)
      end

      context 'when course user satisfy the level condition' do
        it 'adds the satisfied achievement conditional to the course user' 

      end

      context 'when course user do not satisfy the level condition' do
        it 'does not adds the unsatisfied achievement conditional to the course user' 

      end
    end
  end
end

