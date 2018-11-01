# frozen_string_literal: true

require 'rails_helper'

describe CallTool::TwimlGenerator do
  describe 'Start' do
    let(:call) { create(:call) }
    subject { CallTool::TwimlGenerator::Start.run(call) }

    it 'has a Gather tag with an action matching the menu url' 


    context 'with sound clip' do
      let(:sound_clip) { double(url: 'http://assets.com/foo-bar/1.wav') }

      before do
        allow(call).to receive(:sound_clip) { sound_clip }
      end

      it 'has Play attribute' 

    end
  end

  describe 'Menu' do
    subject { CallTool::TwimlGenerator::Menu.run(call, params) }
    let(:call) { create(:call) }
    let(:params) { {} }

    it 'has a Gather tag with an action matching the menu url' 


    context 'without sound clip' do
      let(:page) { create(:page, :with_call_tool, language: create(:language, :french)) }
      let(:call) { create(:call, page: page) }

      it 'has a Say element' 

    end

    context 'given the call has a menu soundclip' do
      let(:menu_sound_clip) { double(url: 'http://assets.com/foo-bar/menu.wav') }

      before do
        allow(call).to receive(:menu_sound_clip) { menu_sound_clip }
      end

      it 'has Play attribute' 

    end

    context 'given the digit 1 is passed' do
      let(:params) { { 'Digits' => '1' } }
      it 'includes a Redirect tag pointing to the connect url' 

    end

    context 'given the digit 2 is passed' do
      let(:params) { { 'Digits' => '2' } }
      it 'includes a Redirect tag pointing to the start url' 

    end
  end

  describe 'Connect' do
    let(:call) { create(:call) }
    subject { CallTool::TwimlGenerator::Connect.run(call) }

    it 'has a Dial tag with an action attribute pointing to the target_call_status url' 


    it 'has a Dial tag with the number of target' 


    context 'given the number has extensions' do
      let(:call) { create(:call, target: build(:call_tool_target, phone_number: '+12345678', phone_extension: '234')) }

      it 'includes the sendDigits option' 

    end
  end
end

