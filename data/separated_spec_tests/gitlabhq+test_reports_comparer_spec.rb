require 'spec_helper'

describe Gitlab::Ci::Reports::TestReportsComparer do
  include TestReportsHelper

  let(:comparer) { described_class.new(base_reports, head_reports) }
  let(:base_reports) { Gitlab::Ci::Reports::TestReports.new }
  let(:head_reports) { Gitlab::Ci::Reports::TestReports.new }

  describe '#suite_comparers' do
    subject { comparer.suite_comparers }

    context 'when head and base reports include two test suites' do
      before do
        base_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        base_reports.get_suite('junit').add_test_case(create_test_case_java_success)
        head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        head_reports.get_suite('junit').add_test_case(create_test_case_java_success)
      end

      it 'returns test suite comparers with specified values' 

    end
  end

  describe '#total_status' do
    subject { comparer.total_status }

    context 'when all tests cases are success in head suites' do
      before do
        head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        head_reports.get_suite('junit').add_test_case(create_test_case_java_success)
      end

      it 'returns the total status' 

    end

    context 'when there is a failed test case in head suites' do
      before do
        head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        head_reports.get_suite('junit').add_test_case(create_test_case_java_failed)
      end

      it 'returns the total status in head suite' 

    end
  end

  describe '#total_count' do
    subject { comparer.total_count }

    before do
      head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
      head_reports.get_suite('junit').add_test_case(create_test_case_java_failed)
    end

    it 'returns the total test counts in head suites' 

  end

  describe '#resolved_count' do
    subject { comparer.resolved_count }

    context 'when there is a resolved test case in head suites' do
      let(:create_test_case_java_resolved) do
        create_test_case_java_failed.tap do |test_case|
          test_case.instance_variable_set("@status", Gitlab::Ci::Reports::TestCase::STATUS_SUCCESS)
        end
      end

      before do
        base_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        base_reports.get_suite('junit').add_test_case(create_test_case_java_failed)
        head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        head_reports.get_suite('junit').add_test_case(create_test_case_java_resolved)
      end

      it 'returns the correct count' 

    end

    context 'when there are no resolved test cases in head suites' do
      before do
        base_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        base_reports.get_suite('junit').add_test_case(create_test_case_java_failed)
        head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        head_reports.get_suite('junit').add_test_case(create_test_case_java_failed)
      end

      it 'returns the correct count' 

    end
  end

  describe '#failed_count' do
    subject { comparer.failed_count }

    context 'when there is a failed test case in head suites' do
      before do
        head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        head_reports.get_suite('junit').add_test_case(create_test_case_java_failed)
      end

      it 'returns the correct count' 

    end

    context 'when there are no failed test cases in head suites' do
      before do
        head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        head_reports.get_suite('junit').add_test_case(create_test_case_rspec_success)
      end

      it 'returns the correct count' 

    end
  end
end

