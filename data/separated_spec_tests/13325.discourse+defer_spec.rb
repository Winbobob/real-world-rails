# encoding: utf-8
require 'rails_helper'
require_dependency 'scheduler/defer'

describe Scheduler::Defer do
  class DeferInstance
    include Scheduler::Deferrable
  end

  def wait_for(timeout, &blk)
    till = Time.now + (timeout.to_f / 1000)
    while Time.now < till && !blk.call
      sleep 0.001
    end
  end

  class TrackingLogger < ::Logger
    attr_reader :messages
    def initialize
      super(nil)
      @messages = []
    end
    def add(*args, &block)
      @messages << args
    end
  end

  def track_log_messages
    old_logger = Rails.logger
    logger = Rails.logger = TrackingLogger.new
    yield logger.messages
    logger.messages
  ensure
    Rails.logger = old_logger
  end

  before do
    @defer = DeferInstance.new
    @defer.async = true
  end

  after do
    @defer.stop!
  end

  it "supports timeout reporting" 


  it "can pause and resume" 


  it "recovers from a crash / fork" 


  it "can queue jobs properly" 


end

