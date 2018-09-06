require 'spec_helper'

describe ComponentsHelper do
  describe '#gitlab_workhorse_version' do
    context 'without a Gitlab-Workhorse header' do
      it 'shows the version from Gitlab::Workhorse.version' 

    end

    context 'with a Gitlab-Workhorse header' do
      before do
        helper.request.headers['Gitlab-Workhorse'] = '42.42.0-rc3'
      end

      it 'shows the actual GitLab Workhorse version currently in use' 

    end
  end
end

