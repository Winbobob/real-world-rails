# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Ci::Config::External::File::Local do
  let(:project) { create(:project, :repository) }
  let(:local_file) { described_class.new(location, { project: project, sha: '12345' }) }

  describe '#valid?' do
    context 'when is a valid local path' do
      let(:location) { '/lib/gitlab/ci/templates/existent-file.yml' }

      before do
        allow_any_instance_of(described_class).to receive(:fetch_local_content).and_return("image: 'ruby2:2'")
      end

      it 'should return true' 

    end

    context 'when is not a valid local path' do
      let(:location) { '/lib/gitlab/ci/templates/non-existent-file.yml' }

      it 'should return false' 

    end

    context 'when is not a yaml file' do
      let(:location) { '/config/application.rb' }

      it 'should return false' 

    end
  end

  describe '#content' do
    context 'with a a valid file' do
      let(:local_file_content) do
        <<~HEREDOC
          before_script:
            - apt-get update -qq && apt-get install -y -qq sqlite3 libsqlite3-dev nodejs
            - ruby -v
            - which ruby
            - gem install bundler --no-ri --no-rdoc
            - bundle install --jobs $(nproc)  "${FLAGS[@]}"
        HEREDOC
      end
      let(:location) { '/lib/gitlab/ci/templates/existent-file.yml' }

      before do
        allow_any_instance_of(described_class).to receive(:fetch_local_content).and_return(local_file_content)
      end

      it 'should return the content of the file' 

    end

    context 'with an invalid file' do
      let(:location) { '/lib/gitlab/ci/templates/non-existent-file.yml' }

      it 'should be nil' 

    end
  end

  describe '#error_message' do
    let(:location) { '/lib/gitlab/ci/templates/non-existent-file.yml' }

    it 'should return an error message' 

  end
end

