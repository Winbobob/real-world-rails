# frozen_string_literal: true

require "bundler/worker"

RSpec.describe Bundler::Worker do
  let(:size) { 5 }
  let(:name) { "Spec Worker" }
  let(:function) { proc {|object, worker_number| [object, worker_number] } }
  subject { described_class.new(size, name, function) }

  after { subject.stop }

  describe "#initialize" do
    context "when Thread.start raises ThreadError" do
      it "raises when no threads can be created" 

    end
  end
end

