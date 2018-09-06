require 'spec_helper'

describe Gitlab::GithubImport::NotifyUponDeath do
  let(:worker_class) do
    Class.new do
      include Sidekiq::Worker
      include Gitlab::GithubImport::NotifyUponDeath
    end
  end

  describe '.sidekiq_retries_exhausted' do
    it 'notifies the JobWaiter when 3 arguments are given and the last is a String' 


    it 'does not notify the JobWaiter when only 2 arguments are given' 


    it 'does not notify the JobWaiter when only 1 argument is given' 


    it 'does not notify the JobWaiter when the last argument is not a String' 

  end
end

