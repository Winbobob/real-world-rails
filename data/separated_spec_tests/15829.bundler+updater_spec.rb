# frozen_string_literal: true

require "net/http"
require "bundler/compact_index_client"
require "bundler/compact_index_client/updater"

RSpec.describe Bundler::CompactIndexClient::Updater do
  let(:fetcher) { double(:fetcher) }
  let(:local_path) { Pathname("/tmp/localpath") }
  let(:remote_path) { double(:remote_path) }

  subject(:updater) { described_class.new(fetcher) }

  context "when the ETag header is missing" do
    # Regression test for https://github.com/bundler/bundler/issues/5463

    let(:response) { double(:response, :body => "") }

    it "MisMatchedChecksumError is raised" 

  end

  context "when the download is corrupt" do
    let(:response) { double(:response, :body => "") }

    it "raises HTTPError" 

  end

  context "when bundler doesn't have permissions on Dir.tmpdir" do
    let(:response) { double(:response, :body => "") }

    it "Errno::EACCES is raised" 

  end
end

