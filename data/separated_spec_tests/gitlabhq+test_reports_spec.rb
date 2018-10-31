require 'spec_helper'

describe Gitlab::Ci::Reports::TestReports do
  include TestReportsHelper

  let(:test_reports) { described_class.new }

  describe '#get_suite' do
    subject { test_reports.get_suite(suite_name) }

    context 'when suite name is rspec' do
      let(:suite_name) { 'rspec' }

      it { expect(subject.name).to eq('rspec') }

      it 'initializes a new test suite and returns it' 


      context 'when suite name is already allocated' do
        before do
          subject
        end

        it 'does not initialize a new test suite' 

      end
    end
  end

  describe '#total_time' do
    subject { test_reports.total_time }

    before do
      test_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
      test_reports.get_suite('junit').add_test_case(create_test_case_java_success)
    end

    it 'returns the total time' 

  end

  describe '#total_count' do
    subject { test_reports.total_count }

    before do
      test_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
      test_reports.get_suite('junit').add_test_case(create_test_case_java_success)
    end

    it 'returns the total count' 

  end

  describe '#total_status' do
    subject { test_reports.total_status }

    context 'when all test cases succeeded' do
      before do
        test_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        test_reports.get_suite('junit').add_test_case(create_test_case_java_success)
      end

      it 'returns correct total status' 

    end

    context 'when there is a failed test case' do
      before do
        test_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        test_reports.get_suite('junit').add_test_case(create_test_case_java_failed)
      end

      it 'returns correct total status' 

    end

    context 'when there is a skipped test case' do
      before do
        test_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        test_reports.get_suite('junit').add_test_case(create_test_case_java_skipped)
      end

      it 'returns correct total status' 

    end

    context 'when there is an error test case' do
      before do
        test_reports.get_suite('rspec').add_test_case(create_test_case_rspec_success)
        test_reports.get_suite('junit').add_test_case(create_test_case_java_error)
      end

      it 'returns correct total status' 

    end
  end

  Gitlab::Ci::Reports::TestCase::STATUS_TYPES.each do |status_type|
    describe "##{status_type}_count" do
      subject { test_reports.public_send("#{status_type}_count") }

      context "when #{status_type} test case exists" do
        before do
          test_reports.get_suite('rspec').add_test_case(public_send("create_test_case_rspec_#{status_type}"))
          test_reports.get_suite('junit').add_test_case(public_send("create_test_case_java_#{status_type}"))
        end

        it 'returns the count' 

      end

      context "when #{status_type} test case do not exist" do
        it 'returns nothing' 

      end
    end
  end
end

