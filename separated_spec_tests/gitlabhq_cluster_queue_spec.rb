require 'spec_helper'

describe ClusterQueue do
  let(:worker) do
    Class.new do
      def self.name
        'DummyWorker'
      end

      include ApplicationWorker
      include ClusterQueue
    end
  end

  it 'sets a default pipelines queue automatically' 

end

