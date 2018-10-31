require 'spec_helper'

describe CronjobQueue do
  let(:worker) do
    Class.new do
      def self.name
        'DummyWorker'
      end

      include ApplicationWorker
      include CronjobQueue
    end
  end

  it 'sets the queue name of a worker' 


  it 'disables retrying of failed jobs' 

end

