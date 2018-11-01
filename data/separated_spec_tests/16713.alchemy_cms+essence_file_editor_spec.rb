# frozen_string_literal: true

require 'spec_helper'

describe 'alchemy/essences/_essence_file_editor' do
  let(:attachment) { build_stubbed(:alchemy_attachment) }
  let(:essence) { build_stubbed(:alchemy_essence_file, attachment: attachment) }
  let(:content) { build_stubbed(:alchemy_content, essence: essence) }

  subject do
    render partial: "alchemy/essences/essence_file_editor", locals: {content: content}
    rendered
  end

  before do
    view.class.send :include, Alchemy::Admin::BaseHelper
    allow(view).to receive(:content_label).and_return('')
  end

  context 'with ingredient present' do
    before do
      allow(content).to receive(:ingredient).and_return(attachment)
    end

    it "renders a hidden field with attachment id" 


    it "renders a link to open the attachment library overlay" 


    it "renders a link to edit the essence" 


    context 'with content settings `only`' do
      it "renders a link to open the attachment library overlay with only pdfs" 

    end

    context 'with content settings `except`' do
      it "renders a link to open the attachment library overlay without pdfs" 

    end
  end

  context 'without ingredient present' do
    before do
      allow(content).to receive(:ingredient).and_return(nil)
    end

    it "renders a hidden field for attachment_id" 

  end
end

