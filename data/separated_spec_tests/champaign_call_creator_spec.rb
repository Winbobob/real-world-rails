# frozen_string_literal: true

require 'rails_helper'

describe CallCreator do
  let(:page) { create(:page, :with_call_tool) }
  let!(:call_tool) { Plugins::CallTool.find_by_page_id(page.id) }
  let(:target) { Plugins::CallTool.find_by_page_id(page.id).targets.sample }
  let(:member) { create(:member) }
  let(:correct_checksum) { 'a1b2c3' }

  before :each do
    allow(Digest::SHA256).to receive(:hexdigest).and_return(correct_checksum)
  end

  shared_examples 'basic calling' do
    it 'returns true' 


    it 'creates a call' 


    it 'normalizes the phone number' 


    it 'places the call' 


    it 'publishes the event' 


    it 'creates an action' 

  end

  context 'given valid params' do
    before do
      allow_any_instance_of(Twilio::REST::Calls).to receive(:create)
    end

    context 'with a valid manual target' do
      let(:params) do
        { page_id: page.id,
          member_id: member.id,
          member_phone_number: '+1 343-700-3482',
          target_phone_number: '+1 213-500-7319',
          target_name: 'Sen. Kevin de Leon',
          checksum: correct_checksum }
      end

      include_examples 'basic calling'

      it 'correctly populates the target fields' 

    end

    context 'with a target id' do
      let(:params) do
        { page_id: page.id,
          member_id: member.id,
          member_phone_number: '+1 343-700-3482',
          target_id: target.id }
      end

      include_examples 'basic calling'
    end
  end

  context 'given invalid params' do
    let(:params) do
      { page_id: page.id,
        member_id: member.id,
        member_phone_number: 'wrong',
        target_id: target.id }
    end

    let(:service) { CallCreator.new(params) }

    it 'returns false' 


    it 'returns a hash with error messages on #errors' 

  end

  context 'given twilio API responds with error' do
    before do
      allow_any_instance_of(Twilio::REST::Calls)
        .to receive(:create)
        .and_raise(Twilio::REST::RequestError.new('Error', 13_223))
    end

    let(:params) do
      { page_id: page.id,
        member_id: member.id,
        member_phone_number: '+1 343-700-3482',
        target_id: target.id }
    end

    it 'returns false' 


    it 'stores the twilio error code on the call record' 


    it 'sets the status to failed' 


    it 'doesnt create an action' 

  end

  context 'given the target id is invalid' do
    let(:params) do
      { page_id: page.id,
        member_id: member.id,
        member_phone_number: '1234567',
        target_id: 'wrong' }
    end

    it 'returns false' 


    it 'returns an appropriate error message' 

  end

  context 'given the manual targeting is invalid' do
    let(:invalid_params) do
      { page_id: page.id,
        member_id: member.id,
        member_phone_number: '+1 343-700-3482',
        target_phone_number: '+1 213-500-7319',
        target_name: 'Sen. Kevin de Leon',
        checksum: 'incorrect checksum' }
    end

    before :each do
      allow(CallTool::ChecksumValidator).to receive(:validate).and_return(false)
    end

    context 'and a valid target id is specified' do
      let(:params) { invalid_params.merge(target_id: target.id) }

      before do
        allow_any_instance_of(Twilio::REST::Calls).to receive(:create)
      end

      include_examples 'basic calling'
    end

    context 'and no target id is specified' do
      it 'returns false' 


      it 'returns an appropriate error message' 

    end
  end
end

