require 'spec_helper'

describe RspecFlaky::Config, :aggregate_failures do
  before do
    # Stub these env variables otherwise specs don't behave the same on the CI
    stub_env('FLAKY_RSPEC_GENERATE_REPORT', nil)
    stub_env('SUITE_FLAKY_RSPEC_REPORT_PATH', nil)
    stub_env('FLAKY_RSPEC_REPORT_PATH', nil)
    stub_env('NEW_FLAKY_RSPEC_REPORT_PATH', nil)
  end

  describe '.generate_report?' do
    context "when ENV['FLAKY_RSPEC_GENERATE_REPORT'] is not set" do
      it 'returns false' 

    end

    context "when ENV['FLAKY_RSPEC_GENERATE_REPORT'] is set" do
      using RSpec::Parameterized::TableSyntax

      where(:env_value, :result) do
        '1'      | true
        'true'   | true
        'foo'    | false
        '0'      | false
        'false'  | false
      end

      with_them do
        before do
          stub_env('FLAKY_RSPEC_GENERATE_REPORT', env_value)
        end

        it 'returns false' 

      end
    end
  end

  describe '.suite_flaky_examples_report_path' do
    context "when ENV['SUITE_FLAKY_RSPEC_REPORT_PATH'] is not set" do
      it 'returns the default path' 

    end

    context "when ENV['SUITE_FLAKY_RSPEC_REPORT_PATH'] is set" do
      before do
        stub_env('SUITE_FLAKY_RSPEC_REPORT_PATH', 'foo/suite-report.json')
      end

      it 'returns the value of the env variable' 

    end
  end

  describe '.flaky_examples_report_path' do
    context "when ENV['FLAKY_RSPEC_REPORT_PATH'] is not set" do
      it 'returns the default path' 

    end

    context "when ENV['FLAKY_RSPEC_REPORT_PATH'] is set" do
      before do
        stub_env('FLAKY_RSPEC_REPORT_PATH', 'foo/report.json')
      end

      it 'returns the value of the env variable' 

    end
  end

  describe '.new_flaky_examples_report_path' do
    context "when ENV['NEW_FLAKY_RSPEC_REPORT_PATH'] is not set" do
      it 'returns the default path' 

    end

    context "when ENV['NEW_FLAKY_RSPEC_REPORT_PATH'] is set" do
      before do
        stub_env('NEW_FLAKY_RSPEC_REPORT_PATH', 'foo/new-report.json')
      end

      it 'returns the value of the env variable' 

    end
  end
end

