require 'rake_helper'

describe 'gitlab:env:info' do
  before do
    Rake.application.rake_require 'tasks/gitlab/info'

    stub_warn_user_is_not_gitlab
    allow(Gitlab::Popen).to receive(:popen)
  end

  describe 'git version' do
    before do
      allow(Gitlab::Popen).to receive(:popen).with([Gitlab.config.git.bin_path, '--version'])
        .and_return(git_version)
    end

    context 'when git installed' do
      let(:git_version) { 'git version 2.10.0' }

      it 'prints git version' 

    end

    context 'when git not installed' do
      let(:git_version) { '' }

      it 'prints unknown' 

    end
  end
end

