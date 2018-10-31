# frozen_string_literal: true

require 'spec_helper'

describe 'alchemy/essences/_essence_text_editor' do
  let(:essence) { Alchemy::EssenceText.new(body: '1234') }
  let(:content) { Alchemy::Content.new(essence: essence) }

  context 'with no input type set' do
    before do
      allow(view).to receive(:content_label).and_return("1e Zahl")
      allow(content).to receive(:settings).and_return({})
    end

    it "renders an input field of type number" 

  end

  context 'with a different input type set' do
    before do
      allow(view).to receive(:content_label).and_return("1e Zahl")
      allow(content).to receive(:settings).and_return({input_type: "number"})
    end

    it "renders an input field of type number" 

  end
end

