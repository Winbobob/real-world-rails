# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Conditional::SatisfiabilityGraphBuildService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:course) { create(:course) }
    let!(:achievement) { create(:achievement, course: course) }
    let!(:assessment) { create(:assessment, course: course) }

    describe '.build' do
      subject { Course::Conditional::SatisfiabilityGraphBuildService.build(course) }

      it 'cache the satisfiability graph for the course' 

    end

    describe '#build' do
      subject { Course::Conditional::SatisfiabilityGraphBuildService.new }

      it 'returns the satisfiability graph for the course' 

    end
  end
end

