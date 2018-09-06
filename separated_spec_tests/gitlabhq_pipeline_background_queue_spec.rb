require 'spec_helper'

describe PipelineBackgroundQueue do
  let(:worker) do
    Class.new do
      def self.name
        'DummyWorker'
      end

      include ApplicationWorker
      include PipelineBackgroundQueue
    end
  end

  it 'sets a default object storage queue automatically' 

end

