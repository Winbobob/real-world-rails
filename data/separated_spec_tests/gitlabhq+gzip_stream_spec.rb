require 'spec_helper'

describe Gitlab::Ci::Build::Artifacts::Adapters::GzipStream do
  describe '#initialize' do
    context 'when stream is passed' do
      let(:stream) { File.open(expand_fixture_path('junit/junit.xml.gz'), 'rb') }

      it 'initialized' 

    end

    context 'when stream is not passed' do
      let(:stream) { nil }

      it 'raises an error' 

    end
  end

  describe '#each_blob' do
    let(:adapter) { described_class.new(stream) }

    context 'when stream is gzip file' do
      context 'when gzip file contains one file' do
        let(:stream) { File.open(expand_fixture_path('junit/junit.xml.gz'), 'rb') }

        it 'iterates content and file_name' 

      end

      context 'when gzip file contains three files' do
        let(:stream) { File.open(expand_fixture_path('junit/junit_with_three_testsuites.xml.gz'), 'rb') }

        it 'iterates content and file_name' 

      end
    end

    context 'when stream is zip file' do
      let(:stream) { File.open(expand_fixture_path('ci_build_artifacts.zip'), 'rb') }

      it 'raises an error' 

    end
  end
end

