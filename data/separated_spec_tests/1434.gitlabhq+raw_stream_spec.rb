require 'spec_helper'

describe Gitlab::Ci::Build::Artifacts::Adapters::RawStream do
  describe '#initialize' do
    context 'when stream is passed' do
      let(:stream) { File.open(expand_fixture_path('junit/junit.xml'), 'rb') }

      it 'initialized' 

    end

    context 'when stream is not passed' do
      let(:stream) { nil }

      it 'raises an error' 

    end
  end

  describe '#each_blob' do
    let(:adapter) { described_class.new(stream) }

    context 'when file is not empty' do
      let(:stream) { File.open(expand_fixture_path('junit/junit.xml'), 'rb') }

      it 'iterates content' 

    end

    context 'when file is empty' do
      let(:stream) { Tempfile.new }

      after do
        stream.unlink
      end

      it 'does not iterate content' 

    end
  end
end

