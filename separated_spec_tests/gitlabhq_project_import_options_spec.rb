require 'spec_helper'

describe ProjectImportOptions do
  let(:project) { create(:project, :import_started) }
  let(:job) { { 'args' => [project.id, nil, nil], 'jid' => '123' } }
  let(:worker_class) do
    Class.new do
      include Sidekiq::Worker
      include ProjectImportOptions
    end
  end

  it 'sets default retry limit' 


  it 'sets default status expiration' 


  describe '.sidekiq_retries_exhausted' do
    it 'marks fork as failed' 


    it 'logs the appropriate error message for forked projects' 


    it 'logs the appropriate error message for forked projects' 

  end
end

