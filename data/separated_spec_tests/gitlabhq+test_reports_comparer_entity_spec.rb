require 'spec_helper'

describe TestReportsComparerEntity do
  include TestReportsHelper

  let(:entity) { described_class.new(comparer) }
  let(:comparer) { Gitlab::Ci::Reports::TestReportsComparer.new(base_reports, head_reports) }
  let(:base_reports) { Gitlab::Ci::Reports::TestReports.new }
  let(:head_reports) { Gitlab::Ci::Reports::TestReports.new }

  describe '#as_json' do
    subject { entity.as_json }

    context 'when head and base reports include two test suites' do
      context 'when the status of head report is success' do
        before do
          base_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
          base_reports.get_suite('junit').add_test_case(create_test_case_java_success)
          head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
          head_reports.get_suite('junit').add_test_case(create_test_case_java_success)
        end

        it 'contains correct compared test reports details' 

      end

      context 'when the status of head report is failed' do
        before do
          base_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
          base_reports.get_suite('junit').add_test_case(create_test_case_java_success)
          head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
          head_reports.get_suite('junit').add_test_case(create_test_case_java_failed)
        end

        it 'contains correct compared test reports details' 

      end

      context 'when the status of head report is resolved' do
        before do
          base_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
          base_reports.get_suite('junit').add_test_case(create_test_case_java_failed)
          head_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
          head_reports.get_suite('junit').add_test_case(create_test_case_java_resolved)
        end

        let(:create_test_case_java_resolved) do
          create_test_case_java_failed.tap do |test_case|
            test_case.instance_variable_set("@status", Gitlab::Ci::Reports::TestCase::STATUS_SUCCESS)
          end
        end

        it 'contains correct compared test reports details' 

      end
    end
  end
end

