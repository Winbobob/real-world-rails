require 'rake_helper'

describe 'gitlab:shell rake tasks' do
  before do
    Rake.application.rake_require 'tasks/gitlab/shell'

    stub_warn_user_is_not_gitlab
  end

  after do
    TestEnv.create_fake_git_hooks
  end

  describe 'install task' do
    it 'invokes create_hooks task' 

  end

  describe 'create_hooks task' do
    it 'calls gitlab-shell bin/create_hooks' 

  end
end

