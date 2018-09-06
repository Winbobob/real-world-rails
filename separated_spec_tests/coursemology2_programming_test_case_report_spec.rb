# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::ProgrammingTestCaseReport do
  context 'when given a report containing multiple test suites' do
    self::REPORT_PATH = File.join(Rails.root,
                                  'spec/fixtures/course/programming_multiple_test_suite_report.xml')
    self::REPORT_XML = File.read(self::REPORT_PATH)

    let(:parsed_report) do
      Course::Assessment::ProgrammingTestCaseReport.new(self.class::REPORT_XML)
    end
    subject { parsed_report }

    describe '#test_suites' do
      it 'returns all the test suites in the report' 

    end

    describe '#test_cases' do
      it 'returns all the test cases in the report' 

    end

    describe Course::Assessment::ProgrammingTestCaseReport::TestSuite do
      subject { parsed_report.test_suites.second }

      describe '#name' do
        it 'returns the name attribute' 

      end

      describe '#identifier' do
        it 'generates an identifier for the test suite' 

      end

      describe '#duration' do
        it 'returns the time attribute' 

      end

      describe '#test_cases' do
        it 'returns all test cases in the suite' 

      end
    end

    describe Course::Assessment::ProgrammingTestCaseReport::TestCase do
      let(:test_cases) { parsed_report.test_suites.second.test_cases }
      subject { test_cases.first }

      describe '#class_name' do
        it 'returns the classname attribute' 

      end

      describe '#name' do
        it 'returns the name attribute' 

      end

      describe '#identifier' do
        it 'generates an identifier for the test suite' 


        context 'when the test case as a class name' do
          it 'uses the class name as part of the identifier' 

        end

        context 'when the test case does not have a class name' do
          it 'still generates an identifier' 

        end
      end

      describe '#duration' do
        it 'returns the time attribute' 

      end

      context 'when the test case failed' do
        subject { test_cases.first }
        it { is_expected.to be_failed }
        it { is_expected.not_to be_passed }
      end

      context 'when the test case was skipped' do
        subject { test_cases.second }
        it { is_expected.to be_skipped }
        it { is_expected.not_to be_passed }
      end

      context 'when the test case passed' do
        subject { test_cases.third }
        it { is_expected.to be_passed }
      end
    end
  end

  context 'when given a report containing a single test suite' do
    self::REPORT_PATH = File.join(Rails.root,
                                  'spec/fixtures/course/programming_single_test_suite_report.xml')
    self::REPORT_XML = File.read(self::REPORT_PATH)

    let(:parsed_report) do
      Course::Assessment::ProgrammingTestCaseReport.new(self.class::REPORT_XML)
    end
    subject { parsed_report }

    describe '#test_suites' do
      it 'returns all the test suites in the report' 

    end

    describe '#test_cases' do
      it 'returns all the test cases in the report' 

    end

    describe Course::Assessment::ProgrammingTestCaseReport::TestCase do
      let(:test_cases) { parsed_report.test_suites.first.test_cases }

      context 'when the test case errored' do
        subject { test_cases.first }
        it { is_expected.to be_errored }
        it { is_expected.not_to be_passed }
      end
    end
  end

  context 'when given a report with test case meta information' do
    let(:report_path) do
      File.join(Rails.root, 'spec/fixtures/course/'\
                'programming_single_test_suite_report_meta.xml')
    end

    let(:report_xml) { File.read(report_path) }

    let(:parsed_report) do
      Course::Assessment::ProgrammingTestCaseReport.new(report_xml)
    end
    let(:test_cases) { parsed_report.test_suites.first.test_cases }

    describe Course::Assessment::ProgrammingTestCaseReport::TestCase do
      subject { test_cases.first }

      describe '#expression' do
        it 'returns the expression attribute' 

      end

      describe '#expected' do
        it 'returns the expected attribute' 

      end

      describe '#hint' do
        it 'returns the hint attribute' 

      end

      describe '#output' do
        it 'returns the output attribute' 

      end
    end

    describe 'when there is no meta information' do
      subject { test_cases.second }

      describe '#expression' do
        it 'returns an empty string as the expression attribute' 

      end

      describe '#expected' do
        it 'returns an empty string as the expected attribute' 

      end

      describe '#hint' do
        it 'returns an empty string as the hint attribute' 

      end

      describe '#output' do
        it 'returns an empty string as the hint attribute' 

      end
    end
  end

  context 'when given a report with meta information attached to test case tags' do
    let(:report_path) do
      File.join(Rails.root, 'spec/fixtures/course/'\
                'programming_single_test_suite_report_test_case_meta.xml')
    end

    let(:report_xml) { File.read(report_path) }

    let(:parsed_report) do
      Course::Assessment::ProgrammingTestCaseReport.new(report_xml)
    end
    let(:test_cases) { parsed_report.test_suites.first.test_cases }

    describe Course::Assessment::ProgrammingTestCaseReport::TestCase do
      subject { test_cases.first }

      describe '#expression' do
        it 'returns the expression attribute' 

      end

      describe '#expected' do
        it 'returns the expected attribute' 

      end
      describe '#hint' do
        it 'returns the hint attribute' 

      end

      describe '#output' do
        it 'returns the output attribute' 

      end
    end

    describe 'when there is no meta information' do
      subject { test_cases.second }

      describe '#expression' do
        it 'returns an empty string as the expression attribute' 

      end

      describe '#expected' do
        it 'returns an empty string as the expected attribute' 

      end

      describe '#hint' do
        it 'returns an empty string as the hint attribute' 

      end

      describe '#output' do
        it 'returns an empty string as the hint attribute' 

      end
    end
  end

  # Test dynamic hints, failure and error messages, messages hash,
  # output meta
  context 'when given a report with various kinds of output data' do
    let(:report_path) do
      File.join(Rails.root, 'spec/fixtures/course/'\
                'programming_messages_test_report.xml')
    end

    let(:report_xml) { File.read(report_path) }

    let(:parsed_report) do
      Course::Assessment::ProgrammingTestCaseReport.new(report_xml)
    end
    let(:public_test_cases) { parsed_report.test_suites.first.test_cases }
    let(:private_test_cases) { parsed_report.test_suites.second.test_cases }

    describe Course::Assessment::ProgrammingTestCaseReport::TestCase do
      context 'failed test case' do
        subject { public_test_cases.first } # passed test case with output meta

        describe '#output' do
          it 'returns the output attribute' 

        end

        describe '#messages' do
          it 'returns the output and failure message in a hash' 

        end
      end

      context 'timed out test case' do
        subject { public_test_cases.second }

        describe '#output' do
          it 'returns an empty string as the output attribute' 

        end

        describe '#failure_message' do
          it 'returns the failure message' 

        end
      end

      context 'failed test case with dynamic hint' do
        subject { private_test_cases.first }

        describe '#hint' do
          it 'returns the hint attribute generated when catching the exception' 

        end

        describe '#output' do
          it 'returns the output attribute' 

        end

        describe '#failure_contents' do
          it 'returns the contents of the failure tag' 

        end

        describe '#messages' do
          it 'returns a hash with the output, hint, failure and failure_contents' 

        end
      end

      context 'error test case' do
        subject { private_test_cases.second }

        describe '#output' do
          it 'returns the output attribute' 

        end

        describe '#error_message' do
          it 'returns the error type and message attributes in a single string' 

        end

        describe '#error_contents' do
          it 'returns the contents of the error tag' 

        end

        describe '#messages' do
          it 'returns a hash with the output, error and error_contents' 

        end
      end
    end
  end

  context 'when given a report with test cases with errors' do
    let(:report_path) do
      File.join(Rails.root, 'spec/fixtures/course/'\
                'programming_single_test_suite_report.xml')
    end

    let(:report_xml) { File.read(report_path) }

    let(:parsed_report) do
      Course::Assessment::ProgrammingTestCaseReport.new(report_xml)
    end
    let(:test_cases) { parsed_report.test_suites.first.test_cases }

    describe Course::Assessment::ProgrammingTestCaseReport::TestCase do
      subject { test_cases.first }

      describe '#error_type' do
        it 'returns the error type attribute' 

      end

      describe '#error_message' do
        it 'returns the error type and error message together' 

      end
    end

    describe 'when the test case has no error' do
      subject { test_cases.third }

      describe '#error_type' do
        it 'returns nil for the error type attribute' 


        it 'returns nil for the error message' 

      end
    end
  end
end

