require 'rake_helper'

describe 'gitlab:uploads rake tasks' do
  describe 'check' do
    let!(:upload) { create(:upload, path: Rails.root.join('spec/fixtures/banana_sample.gif')) }

    before do
      Rake.application.rake_require('tasks/gitlab/uploads/check')
      stub_env('VERBOSE' => 'true')
    end

    it 'outputs the integrity check for each batch' 


    it 'errors out about missing files on the file system' 


    it 'errors out about invalid checksum' 

  end
end

