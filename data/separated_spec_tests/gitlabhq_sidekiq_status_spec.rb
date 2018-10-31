require 'spec_helper'

describe Gitlab::SidekiqStatus do
  describe '.set', :clean_gitlab_redis_shared_state do
    it 'stores the job ID' 

  end

  describe '.unset', :clean_gitlab_redis_shared_state do
    it 'removes the job ID' 

  end

  describe '.all_completed?', :clean_gitlab_redis_shared_state do
    it 'returns true if all jobs have been completed' 


    it 'returns false if a job has not yet been completed' 

  end

  describe '.running?', :clean_gitlab_redis_shared_state do
    it 'returns true if job is running' 


    it 'returns false if job is not found' 

  end

  describe '.num_running', :clean_gitlab_redis_shared_state do
    it 'returns 0 if all jobs have been completed' 


    it 'returns 2 if two jobs are still running' 

  end

  describe '.num_completed', :clean_gitlab_redis_shared_state do
    it 'returns 1 if all jobs have been completed' 


    it 'returns 1 if a job has not yet been completed' 

  end

  describe '.key_for' do
    it 'returns the key for a job ID' 

  end

  describe 'completed', :clean_gitlab_redis_shared_state do
    it 'returns the completed job' 


    it 'returns only the jobs completed' 

  end
end

