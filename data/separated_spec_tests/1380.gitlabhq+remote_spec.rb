# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Ci::Config::External::File::Remote do
  let(:remote_file) { described_class.new(location) }
  let(:location) { 'https://gitlab.com/gitlab-org/gitlab-ce/blob/1234/.gitlab-ci-1.yml' }
  let(:remote_file_content) do
    <<~HEREDOC
      before_script:
        - apt-get update -qq && apt-get install -y -qq sqlite3 libsqlite3-dev nodejs
        - ruby -v
        - which ruby
        - gem install bundler --no-ri --no-rdoc
        - bundle install --jobs $(nproc)  "${FLAGS[@]}"
    HEREDOC
  end

  describe "#valid?" do
    context 'when is a valid remote url' do
      before do
        WebMock.stub_request(:get, location).to_return(body: remote_file_content)
      end

      it 'should return true' 

    end

    context 'with an irregular url' do
      let(:location) { 'not-valid://gitlab.com/gitlab-org/gitlab-ce/blob/1234/.gitlab-ci-1.yml' }

      it 'should return false' 

    end

    context 'with a timeout' do
      before do
        allow(Gitlab::HTTP).to receive(:get).and_raise(Timeout::Error)
      end

      it 'should be falsy' 

    end

    context 'when is not a yaml file' do
      let(:location) { 'https://asdasdasdaj48ggerexample.com' }

      it 'should be falsy' 

    end

    context 'with an internal url' do
      let(:location) { 'http://localhost:8080' }

      it 'should be falsy' 

    end
  end

  describe "#content" do
    context 'with a valid remote file' do
      before do
        WebMock.stub_request(:get, location).to_return(body: remote_file_content)
      end

      it 'should return the content of the file' 

    end

    context 'with a timeout' do
      before do
        allow(Gitlab::HTTP).to receive(:get).and_raise(Timeout::Error)
      end

      it 'should be falsy' 

    end

    context 'with an invalid remote url' do
      let(:location) { 'https://asdasdasdaj48ggerexample.com' }

      before do
        WebMock.stub_request(:get, location).to_raise(SocketError.new('Some HTTP error'))
      end

      it 'should be nil' 

    end

    context 'with an internal url' do
      let(:location) { 'http://localhost:8080' }

      it 'should be nil' 

    end
  end

  describe "#error_message" do
    subject { remote_file.error_message }

    context 'when remote file location is not valid' do
      let(:location) { 'not-valid://gitlab.com/gitlab-org/gitlab-ce/blob/1234/.gitlab-ci-1.yml' }

      it 'returns an error message describing invalid address' 

    end

    context 'when timeout error has been raised' do
      before do
        WebMock.stub_request(:get, location).to_timeout
      end

      it 'should returns error message about a timeout' 

    end

    context 'when HTTP error has been raised' do
      before do
        WebMock.stub_request(:get, location).to_raise(Gitlab::HTTP::Error)
      end

      it 'should returns error message about a HTTP error' 

    end

    context 'when response has 404 status' do
      before do
        WebMock.stub_request(:get, location).to_return(body: remote_file_content, status: 404)
      end

      it 'should returns error message about a timeout' 

    end

    context 'when the URL is blocked' do
      let(:location) { 'http://127.0.0.1/some/path/to/config.yaml' }

      it 'should include details about blocked URL' 

    end
  end
end

