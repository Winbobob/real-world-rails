require 'spec_helper'

describe RepositoryCheckQueue do
  let(:worker) do
    Class.new do
      def self.name
        'DummyWorker'
      end

      include ApplicationWorker
      include RepositoryCheckQueue
    end
  end

  it 'sets the queue name of a worker' 


  it 'disables retrying of failed jobs' 

end

