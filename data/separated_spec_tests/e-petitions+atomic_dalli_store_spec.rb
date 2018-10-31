require 'rails_helper'

RSpec.describe ActiveSupport::Cache::AtomicDalliStore do
  let(:options) do
    { namespace: "epets_test", expires_in: 2.seconds }
  end

  let(:client) { subject.dalli }
  let(:exception) { Dalli::DalliError.new }

  let(:ttl_key) { "epets_test:foo.ttl" }
  let(:ttl_set_args) { [ttl_key, "", 2.seconds, raw: true] }
  let(:ttl_get_args) { [ttl_key, raw: true] }
  let(:ttl_add_args) { [ttl_key, "", 10, raw: true] }

  around do |example|
    client.delete("epets_test:foo")
    client.delete("epets_test:foo.ttl")
    example.run
  end

  before do
    allow(client).to receive(:get).and_call_original
    allow(client).to receive(:set).and_call_original
    allow(client).to receive(:add).and_call_original
    allow(client).to receive(:delete).and_call_original
  end

  describe "#fetch" do
    context "when the cache is not set" do
      it "calls the block" 


      it "writes the value to the cache" 


      it "writes the TTL value to the cache" 


      it "returns the value" 


      it "handles exceptions" 

    end

    context "when the cache is set" do
      before do
        subject.write("foo", "bar", options)
      end

      it "doesn't calls the block" 


      it "returns the value" 


      it "handles exceptions when reading the lock" 


      it "handles exceptions when setting the lock" 

    end
  end

  describe "#read" do
    context "when the cache is not set" do
      it "returns nil" 

    end

    context "when the cache is set" do
      before do
        subject.write("foo", "bar", options)
      end

      it "returns the value" 


      it "handles exceptions when reading the lock" 


      it "handles exceptions when setting the lock" 

    end
  end

  describe "#write" do
    it "writes the value to the cache" 


    it "writes the TTL value to the cache" 


    it "handles exceptions when setting the TTL" 

  end

  describe "#delete" do
    before do
      subject.write("foo", "bar", options)
    end

    it "deletes the value from the cache" 


    it "deletes the TTL value from the cache" 


    it "handles exceptions when deleting the TTL" 

  end
end

