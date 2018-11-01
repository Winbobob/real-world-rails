require 'spec_helper'

describe Gitlab::Ci::Reports::TestSuite do
  include TestReportsHelper

  let(:test_suite) { described_class.new('Rspec') }
  let(:test_case_success) { create_test_case_rspec_success }
  let(:test_case_failed) { create_test_case_rspec_failed }
  let(:test_case_skipped) { create_test_case_rspec_skipped }
  let(:test_case_error) { create_test_case_rspec_error }

  it { expect(test_suite.name).to eq('Rspec') }

  describe '#add_test_case' do
    context 'when status of the test case is success' do
      it 'stores data correctly' 

    end

    context 'when status of the test case is failed' do
      it 'stores data correctly' 

    end

    context 'when two test cases are added' do
      it 'sums up total time' 

    end
  end

  describe '#total_count' do
    subject { test_suite.total_count }

    before do
      test_suite.add_test_case(test_case_success)
      test_suite.add_test_case(test_case_failed)
    end

    it { is_expected.to eq(2) }
  end

  describe '#total_status' do
    subject { test_suite.total_status }

    context 'when all test cases succeeded' do
      before do
        test_suite.add_test_case(test_case_success)
      end

      it { is_expected.to eq(Gitlab::Ci::Reports::TestCase::STATUS_SUCCESS) }
    end

    context 'when a test case failed' do
      before do
        test_suite.add_test_case(test_case_success)
        test_suite.add_test_case(test_case_failed)
      end

      it { is_expected.to eq(Gitlab::Ci::Reports::TestCase::STATUS_FAILED) }
    end
  end

  Gitlab::Ci::Reports::TestCase::STATUS_TYPES.each do |status_type|
    describe "##{status_type}" do
      subject { test_suite.public_send("#{status_type}") }

      context "when #{status_type} test case exists" do
        before do
          test_suite.add_test_case(public_send("test_case_#{status_type}"))
        end

        it 'returns all success test cases' 

      end

      context "when #{status_type} test case do not exist" do
        it 'returns nothing' 

      end
    end
  end

  Gitlab::Ci::Reports::TestCase::STATUS_TYPES.each do |status_type|
    describe "##{status_type}_count" do
      subject { test_suite.public_send("#{status_type}_count") }

      context "when #{status_type} test case exists" do
        before do
          test_suite.add_test_case(public_send("test_case_#{status_type}"))
        end

        it 'returns the count' 

      end

      context "when #{status_type} test case do not exist" do
        it 'returns nothing' 

      end
    end
  end
end

