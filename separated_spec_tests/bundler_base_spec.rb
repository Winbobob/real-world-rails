# frozen_string_literal: true

RSpec.describe Bundler::Fetcher::Base do
  let(:downloader)  { double(:downloader) }
  let(:remote)      { double(:remote) }
  let(:display_uri) { "http://sample_uri.com" }

  class TestClass < described_class; end

  subject { TestClass.new(downloader, remote, display_uri) }

  describe "#initialize" do
    context "with the abstract Base class" do
      it "should raise an error" 

    end

    context "with a class that inherits the Base class" do
      it "should set the passed attributes" 

    end
  end

  describe "#remote_uri" do
    let(:remote_uri_obj) { double(:remote_uri_obj) }

    before { allow(remote).to receive(:uri).and_return(remote_uri_obj) }

    it "should return the remote's uri" 

  end

  describe "#fetch_uri" do
    let(:remote_uri_obj) { URI("http://rubygems.org") }

    before { allow(subject).to receive(:remote_uri).and_return(remote_uri_obj) }

    context "when the remote uri's host is rubygems.org" do
      it "should create a copy of the remote uri with index.rubygems.org as the host" 

    end

    context "when the remote uri's host is not rubygems.org" do
      let(:remote_uri_obj) { URI("http://otherhost.org") }

      it "should return the remote uri" 

    end

    it "memoizes the fetched uri" 

  end

  describe "#available?" do
    it "should return whether the api is available" 

  end

  describe "#api_fetcher?" do
    it "should return false" 

  end
end

