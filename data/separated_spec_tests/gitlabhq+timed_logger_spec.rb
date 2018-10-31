# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Checks::TimedLogger do
  let!(:timeout) { 50.seconds }
  let!(:start) { Time.now }
  let!(:ref) { "bar" }
  let!(:logger) { described_class.new(start_time: start, timeout: timeout) }
  let!(:log_messages) do
    {
      foo: "Foo message..."
    }
  end

  before do
    logger.append_message("Checking ref: #{ref}")
  end

  describe '#log_timed' do
    it 'logs message' 


    context 'when time limit was reached' do
      it 'cancels action' 


      it 'cancels action with time elapsed if work was performed' 

    end
  end

  def bar_check
    2 + 2
  end

  def grpc_check
    raise GRPC::DeadlineExceeded
  end
end

