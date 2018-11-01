require 'rake_helper'

describe 'gitlab:artifacts rake tasks' do
  describe 'check' do
    let!(:artifact) { create(:ci_job_artifact, :archive, :correct_checksum) }

    before do
      Rake.application.rake_require('tasks/gitlab/artifacts/check')
      stub_env('VERBOSE' => 'true')
    end

    it 'outputs the integrity check for each batch' 


    it 'errors out about missing files on the file system' 


    it 'errors out about invalid checksum' 


    it 'errors out about missing checksum' 

  end
end

