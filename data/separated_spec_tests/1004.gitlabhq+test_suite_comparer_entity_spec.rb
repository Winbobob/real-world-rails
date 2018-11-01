require 'spec_helper'

describe TestSuiteComparerEntity do
  include TestReportsHelper

  let(:entity) { described_class.new(comparer) }
  let(:comparer) { Gitlab::Ci::Reports::TestSuiteComparer.new(name, base_suite, head_suite) }
  let(:name) { 'rpsec' }
  let(:base_suite) { Gitlab::Ci::Reports::TestSuite.new(name) }
  let(:head_suite) { Gitlab::Ci::Reports::TestSuite.new(name) }
  let(:test_case_success) { create_test_case_rspec_success }
  let(:test_case_failed) { create_test_case_rspec_failed }

  let(:test_case_resolved) do
    create_test_case_rspec_failed.tap do |test_case|
      test_case.instance_variable_set("@status", Gitlab::Ci::Reports::TestCase::STATUS_SUCCESS)
    end
  end

  describe '#as_json' do
    subject { entity.as_json }

    context 'when head sutie has a newly failed test case which does not exist in base' do
      before do
        base_suite.add_test_case(test_case_success)
        head_suite.add_test_case(test_case_failed)
      end

      it 'contains correct compared test suite details' 

    end

    context 'when head sutie still has a failed test case which failed in base' do
      before do
        base_suite.add_test_case(test_case_failed)
        head_suite.add_test_case(test_case_failed)
      end

      it 'contains correct compared test suite details' 

    end

    context 'when head sutie has a success test case which failed in base' do
      before do
        base_suite.add_test_case(test_case_failed)
        head_suite.add_test_case(test_case_resolved)
      end

      it 'contains correct compared test suite details' 

    end
  end
end

