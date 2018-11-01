# frozen_string_literal: true

require 'rails_helper'

describe 'POST /twilio/calls/:id/start' do
  before { allow(CallEvent::Update).to receive(:publish) }
  let(:call) { create(:call, member: create(:member)) }

  it 'returns successfully' 


  it 'sets the call status to started' 


  it 'publishes an event' 

end

describe 'POST /twilio/calls/:id/menu' do
  let(:call) { create(:call, member: create(:member)) }

  it 'returns successfully' 

end

describe 'POST /twilio/calls/:id/connect' do
  before { allow(CallEvent::Update).to receive(:publish) }
  let(:call) { create(:call, member: create(:member)) }

  it 'returns successfully' 


  it 'sets the call status to connected' 


  it 'publishes an event' 

end

describe 'POST /twilio/calls/:id/target_call_status' do
  before { allow(CallEvent::Update).to receive(:publish) }
  let(:call) { create(:call, member: create(:member)) }

  it 'updates call target_call_info' 


  it 'publishes an event' 

end

describe 'POST /twilio/calls/:id/member_call_event' do
  before { allow(CallEvent::Update).to receive(:publish) }
  let(:call) { create(:call, member: create(:member)) }
  let(:params) do
    {
      'Called' => '+14152300381',
      'CallbackSource' => 'call-progress-events',
      'To' => '+14152300381',
      'CallStatus' => 'completed'
    }
  end

  it 'returns successfully' 


  it 'updates the call' 


  it 'publishes an event' 

end

