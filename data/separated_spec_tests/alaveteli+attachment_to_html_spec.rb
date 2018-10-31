# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AttachmentToHTML do
  include AttachmentToHTML

  let(:attachment) { FactoryBot.build(:body_text) }

  describe '#to_html' do

    it 'sends the attachment to the correct adapter for conversion' 


    it 'renders the attachment as html' 


    it 'passes content injections options when rendering the result' 


    it 'accepts a hash of options to pass to the adapter' 


    it 'converts an attachment that has an adapter, fails to convert, but has a google viewer' 


    it 'converts an attachment that doesnt have an adapter, but has a google viewer' 


    it 'converts an attachment that has no adapter or google viewer' 


    describe 'when wrapping the content' do

      it 'uses a the default wrapper' 


      it 'uses a custom wrapper for GoogleDocsViewer attachments' 


    end

  end

end

