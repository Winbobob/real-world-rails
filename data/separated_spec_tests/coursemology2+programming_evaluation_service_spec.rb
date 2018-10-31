# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::ProgrammingEvaluationService do
  describe Course::Assessment::ProgrammingEvaluationService::Result do
    self::TIME_LIMIT_EXCEEDED_EXIT_CODE = 137
    let(:exit_code) { 0 }
    let(:test_reports) { { report: '' } }
    subject do
      Course::Assessment::ProgrammingEvaluationService::Result.new('', '', test_reports, exit_code)
    end

    describe '#error' do
      context 'when the test reports have values' do
        context 'when the exit code is 0' do
          it { is_expected.not_to be_error }
        end

        context 'when the exit code is nonzero' do
          let(:exit_code) { 2 }
          it { is_expected.not_to be_error }
        end
      end

      context 'when the test_reports are an empty hash' do
        let(:test_reports) { {} }
        context 'when the exit code is 0' do
          it { is_expected.not_to be_error }
        end

        context 'when the exit code is nonzero' do
          let(:exit_code) { 2 }
          it { is_expected.to be_error }
        end
      end
    end

    describe '#time_limit_exceeded?' do
      context 'when the process exits normally' do
        it { is_expected.not_to be_time_limit_exceeded }
      end

      context 'when the process exits with a SIGKILL' do
        let(:exit_code) { self.class::TIME_LIMIT_EXCEEDED_EXIT_CODE }
        it { is_expected.to be_time_limit_exceeded }
      end
    end

    describe '#exception' do
      context 'when the result is not errored' do
        it 'returns nil' 

      end

      context 'when the time limit is exceeded' do
        let(:exit_code) { self.class::TIME_LIMIT_EXCEEDED_EXIT_CODE }
        let(:test_reports) { {} }
        it 'returns TimeLimitExceededError' 

      end

      context 'when there are all other errors' do
        let(:exit_code) { 2 }
        let(:test_reports) { {} }
        it 'returns Error' 

      end
    end
  end

  let(:instance) { Instance.default }
  with_tenant(:instance) do
    subject { Course::Assessment::ProgrammingEvaluationService }
    let(:course) { create(:course) }

    it 'returns the result of evaluating' 


    context 'when the evaluation times out' do
      it 'raises a Timeout::Error' 

    end

    describe '#create_container' do
      let(:memory_limit) { nil }
      let(:time_limit) { nil }
      let(:service_instance) do
        subject.new(Coursemology::Polyglot::Language::Python::Python2Point7.instance,
                    memory_limit, time_limit, Rails.root.join('spec', 'fixtures', 'course',
                                                              'programming_question_template.zip'), nil)
      end
      let(:image) { 'python:2.7' }
      let(:container) { service_instance.send(:create_container, image) }

      it 'prefixes the image with coursemology/evaluator-image' 


      context 'when resource limits are specified' do
        let(:memory_limit) { 16 }
        let(:time_limit) { 5 }

        it 'specifies them when creating the container' 

      end
    end
  end
end

