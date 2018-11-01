# frozen_string_literal: true

require 'spec_helper'

describe 'alchemy/essences/_essence_file_view' do
  let(:file) do
    File.new(File.expand_path('../../fixtures/image with spaces.png', __dir__))
  end

  let(:attachment) do
    build_stubbed(:alchemy_attachment, file: file, name: 'an image', file_name: 'image with spaces.png')
  end

  let(:essence)    { Alchemy::EssenceFile.new(attachment: attachment) }
  let(:content)    { Alchemy::Content.new(essence: essence) }

  context 'without attachment' do
    let(:essence) { Alchemy::EssenceFile.new(attachment: nil) }

    it "renders nothing" 

  end

  context 'with attachment' do
    it "renders a link to download the attachment" 


    context 'with no link_text set' do
      it "has this attachments name as link text" 

    end

    context 'with link_text set in the local options' do
      it "has this value as link text" 

    end

    context 'with link_text set in the content settings' do
      before do
        allow(content).to receive(:settings) { {link_text: 'Download this file'} }
      end

      it "has this value as link text" 

    end

    context 'with link_text stored in the essence attribute' do
      before do
        allow(essence).to receive(:link_text) { 'Download this file' }
      end

      it "has this value as link text" 

    end

    context 'with html_options given' do
      it "renders the linked ingredient with these options" 

    end
  end

  context "with css_class set" do
    before do
      allow(essence).to receive(:css_class) { 'file-download' }
    end

    it "has this class at the link" 

  end
end
