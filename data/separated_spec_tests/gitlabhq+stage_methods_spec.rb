require 'spec_helper'

describe Gitlab::GithubImport::StageMethods do
  let(:project) { create(:project) }
  let(:worker) do
    Class.new { include(Gitlab::GithubImport::StageMethods) }.new
  end

  describe '#perform' do
    it 'returns if no project could be found' 


    it 'imports the data when the project exists' 

  end

  describe '#try_import' do
    it 'imports the project' 


    it 'reschedules the worker if RateLimitError was raised' 

  end

  describe '#find_project' do
    it 'returns a Project for an existing ID' 


    it 'returns nil for a project that failed importing' 


    it 'returns nil for a non-existing project ID' 

  end
end

