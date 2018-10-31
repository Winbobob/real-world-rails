# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe AttachmentToHTML::Adapters::GoogleDocsViewer do

  let(:attachment) { FactoryBot.build(:pdf_attachment) }
  let(:adapter) do
    AttachmentToHTML::Adapters::GoogleDocsViewer.new(attachment, :attachment_url => 'http://example.com/test.pdf')
  end

  describe :title do

    it 'uses the attachment filename for the title' 


  end

  describe :body do

    it 'contains the google docs viewer iframe' 


    describe 'uses the confugured alaveteli protocol' do

      it 'https if force_ssl is on' 


      it 'http if force_ssl is off' 


    end

  end

  describe :success? do

    it 'is always true' 


  end

end

