require 'spec_helper'
require_relative '../support/test_log_target'

describe SharetribeLogger do

  let(:log_target) { TestLogTarget.new }

  describe "log levels" do
    let(:logger) { SharetribeLogger.new(:test, [], log_target) }

    def test_log_level(level)
      logger.send(level, "Debug message", :debug, {debug: true})
      log = log_target.send("#{level}_log".to_sym)
      expect(log.count)
        .to eq(1)
      expect(log.first)
        .to eq({
                 tag: :test,
                 free: "Debug message",
                 type: :debug,
                 structured: {debug: true}
               }.to_json)

    end

    it "logs debug level messages" 


    it "logs warn level messages" 


    it "logs info level messages" 


    it "logs error level messages" 

  end

  describe "#add_metadata" do
    let(:logger) { SharetribeLogger.new(:test, [:community_id, :community_ident, :user_id, :username], log_target) }

    it "includes metadata" 


    it "throws for unknown metadata keys" 

  end
end

