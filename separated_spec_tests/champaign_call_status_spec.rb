require 'rails_helper'

describe CallTool::CallStatus do
  def status_for(call)
    CallTool::CallStatus.for(call)
  end

  let!(:call) { build(:call, created_at: Time.now) }

  it 'returns the last event status' 


  context 'given no Twilio event has been recorded yet' do
    it "returns 'connecting' if within time threshold" 


    it "returns 'timed_out' more than 15 seconds have passed" 

  end
end

