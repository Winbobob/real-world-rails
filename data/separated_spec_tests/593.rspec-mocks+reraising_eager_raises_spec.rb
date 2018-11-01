require "spec_helper"

RSpec.describe "Reraising eager raises during the verify step" do
  it "does not reraise when a double receives a message that hasn't been allowed/expected" 


  context "when a negative expectation receives a call" do
    it "reraises during verification" 


    it 'notifies both exceptions using the same `:source_id` so `aggregate_failures` can de-dup' 


    it 'notifies with a different `source_id` than that for the same double and a different message' 


    it 'notifies with a different `source_id` than a different double expecting that message' 

  end

  context "when an expectation with a count is exceeded" do
    def prepare(dbl)
      expect(dbl).to receive(:foo).exactly(2).times

      dbl.foo
      dbl.foo
    end

    it "reraises during verification" 


    it 'notifies both exceptions using the same `:source_id` so `aggregate_failures` can de-dup' 

  end

  context "when an expectation is called with the wrong arguments" do
    it "reraises during verification" 


    it 'notifies both exceptions using the same `:source_id` so `aggregate_failures` can de-dup' 

  end

  context "when an expectation is called out of order",
          :pending => "Says bar was called 0 times when it was, see: http://git.io/pjTq" do
    it "reraises during verification" 

  end

  RSpec::Matchers.define :notify_with_same_source_id_as_later_verification do
    attr_reader :block

    match do |block|
      @block = block
      block_source_id == verify_all_source_id && block_source_id
    end

    match_when_negated do |block|
      @block = block
      block_source_id && verify_all_source_id && (
        block_source_id != verify_all_source_id
      )
    end

    supports_block_expectations

    failure_message do
      if block_source_id.nil?
        "expected it to notify with a non-nil source id"
      else
        "expected `verify_all` to notify with source_id: #{block_source_id.inspect} but notified with source_id: #{verify_all_source_id.inspect}"
      end
    end

    failure_message_when_negated do
      if block_source_id.nil?
        "expected it to notify with a non-nil source id"
      else
        "expected `verify_all` to notify with a different source_id but got the same one: #{block_source_id.inspect} / #{verify_all_source_id.inspect}"
      end
    end

    def block_source_id
      @block_source_id ||= capture_notified_source_id(&block)
    end

    def verify_all_source_id
      @verify_all_source_id ||= capture_notified_source_id { verify_all }
    end

    def capture_notified_source_id(&block)
      source_id = nil
      notifier = Proc.new { |_err, opt| source_id = opt.fetch(:source_id) }
      RSpec::Support.with_failure_notifier(notifier, &block)
      source_id
    end
  end
end

