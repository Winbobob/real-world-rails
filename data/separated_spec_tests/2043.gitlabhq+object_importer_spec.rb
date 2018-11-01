require 'spec_helper'

describe Gitlab::GithubImport::ObjectImporter do
  let(:worker) do
    Class.new do
      def self.name
        'DummyWorker'
      end

      include(Gitlab::GithubImport::ObjectImporter)

      def counter_name
        :dummy_counter
      end

      def counter_description
        'This is a counter'
      end
    end.new
  end

  describe '#import' do
    it 'imports the object' 

  end

  describe '#counter' do
    it 'returns a Prometheus counter' 

  end
end

