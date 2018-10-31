require 'spec_helper'

describe RspecFlaky::Report, :aggregate_failures do
  let(:a_hundred_days) { 3600 * 24 * 100 }
  let(:collection_hash) do
    {
      a: { example_id: 'spec/foo/bar_spec.rb:2' },
      b: { example_id: 'spec/foo/baz_spec.rb:3', first_flaky_at: (Time.now - a_hundred_days).to_s, last_flaky_at: (Time.now - a_hundred_days).to_s }
    }
  end
  let(:suite_flaky_example_report) do
    {
      '6e869794f4cfd2badd93eb68719371d1': {
        example_id: 'spec/foo/bar_spec.rb:2',
        file: 'spec/foo/bar_spec.rb',
        line: 2,
        description: 'hello world',
        first_flaky_at: 1234,
        last_flaky_at: 4321,
        last_attempts_count: 3,
        flaky_reports: 1,
        last_flaky_job: nil
      }
    }
  end
  let(:flaky_examples) { RspecFlaky::FlakyExamplesCollection.new(collection_hash) }
  let(:report) { described_class.new(flaky_examples) }

  describe '.load' do
    let!(:report_file) do
      Tempfile.new(%w[rspec_flaky_report .json]).tap do |f|
        f.write(JSON.pretty_generate(suite_flaky_example_report))
        f.rewind
      end
    end

    after do
      report_file.close
      report_file.unlink
    end

    it 'loads the report file' 

  end

  describe '.load_json' do
    let(:report_json) do
      JSON.pretty_generate(suite_flaky_example_report)
    end

    it 'loads the report file' 

  end

  describe '#initialize' do
    it 'accepts a RspecFlaky::FlakyExamplesCollection' 


    it 'does not accept anything else' 

  end

  it 'delegates to #flaky_examples using SimpleDelegator' 


  describe '#write' do
    let(:report_file_path) { Rails.root.join('tmp', 'rspec_flaky_report.json') }

    before do
      FileUtils.rm(report_file_path) if File.exist?(report_file_path)
    end

    after do
      FileUtils.rm(report_file_path) if File.exist?(report_file_path)
    end

    context 'when RspecFlaky::Config.generate_report? is false' do
      before do
        allow(RspecFlaky::Config).to receive(:generate_report?).and_return(false)
      end

      it 'does not write any report file' 

    end

    context 'when RspecFlaky::Config.generate_report? is true' do
      before do
        allow(RspecFlaky::Config).to receive(:generate_report?).and_return(true)
      end

      it 'delegates the writes to RspecFlaky::Report' 

    end
  end

  describe '#prune_outdated' do
    it 'returns a new collection without the examples older than 90 days by default' 


    it 'accepts a given number of days' 

  end
end

