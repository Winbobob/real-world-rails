# frozen_string_literal: true

require 'spec_helper'

describe 'alchemy/essences/_essence_text_view' do
  let(:essence) { Alchemy::EssenceText.new(body: 'Hello World') }
  let(:content) { Alchemy::Content.new(essence: essence) }

  context 'with blank link value' do
    it "only renders the ingredient" 

  end

  context 'with a link set' do
    let(:essence) { Alchemy::EssenceText.new(body: 'Hello World', link: 'http://google.com', link_title: 'Foo', link_target: 'blank') }

    it "renders the linked ingredient" 


    context 'with html_options given' do
      it "renders the linked with these options" 

    end

    context 'but with options disable_link set to true' do
      it "only renders the ingredient" 

    end

    context 'but with content settings disable_link set to true' do
      before do
        allow(content).to receive(:settings).and_return({disable_link: true})
      end

      it "only renders the ingredient" 

    end
  end
end

