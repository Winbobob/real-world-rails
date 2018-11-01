require 'rake_helper'

describe 'gitlab:lfs rake tasks' do
  describe 'check' do
    let!(:lfs_object) { create(:lfs_object, :with_file, :correct_oid) }

    before do
      Rake.application.rake_require('tasks/gitlab/lfs/check')
      stub_env('VERBOSE' => 'true')
    end

    it 'outputs the integrity check for each batch' 


    it 'errors out about missing files on the file system' 


    it 'errors out about invalid checksum' 

  end
end

