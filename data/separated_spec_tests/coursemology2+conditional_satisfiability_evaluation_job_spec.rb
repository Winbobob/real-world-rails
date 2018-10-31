# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Conditional::ConditionalSatisfiabilityEvaluationJob do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course_user) { create(:course_user) }
    subject { Course::Conditional::ConditionalSatisfiabilityEvaluationJob }

    it 'can be queued' 


    it 'evaluate the satisfiability of the conditionals for the course user' 

  end
end

