require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Artifacts do
  let(:entry) { described_class.new(config) }

  describe 'validation' do
    context 'when entry config value is correct' do
      let(:config) { { paths: %w[public/] } }

      describe '#value' do
        it 'returns artifacs configuration' 

      end

      describe '#valid?' do
        it 'is valid' 

      end

      context "when value includes 'reports' keyword" do
        let(:config) { { paths: %w[public/], reports: { junit: 'junit.xml' } } }

        it 'returns general artifact and report-type artifacts configuration' 

      end
    end

    context 'when entry value is not correct' do
      describe '#errors' do
        context 'when value of attribute is invalid' do
          let(:config) { { name: 10 } }

          it 'reports error' 

        end

        context 'when there is an unknown key present' do
          let(:config) { { test: 100 } }

          it 'reports error' 

        end

        context "when 'reports' keyword is not hash" do
          let(:config) { { paths: %w[public/], reports: 'junit.xml' } }

          it 'reports error' 

        end
      end
    end
  end
end
