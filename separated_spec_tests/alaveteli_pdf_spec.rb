# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe AttachmentToHTML::Adapters::PDF do

  let(:attachment) { FactoryGirl.build(:pdf_attachment) }
  let(:adapter) { AttachmentToHTML::Adapters::PDF.new(attachment) }

  describe :tmpdir do

    it 'defaults to the rails tmp directory' 


    it 'allows a tmpdir to be specified to store the converted document' 


  end

  describe :title do

    it 'uses the attachment filename for the title' 


    it 'returns the title encoded as UTF-8' 



  end

  describe :body do

    it 'extracts the body from the document' 


    it 'operates in the context of the supplied tmpdir' 


    it 'returns the body encoded as UTF-8' 


    it 'returns the body as valid UTF-8 when the HTML generated is not
        valid UTF-8' do
      allow(adapter).to receive(:convert).and_return("\xBF")
      expect(adapter.body).to be_valid_encoding
    end

  end


  describe :success? do

    it 'is truthy if the body has content excluding the tags' 


    it 'is truthy if the body contains images' 


    it 'is falsey if the body has no content other than tags' 


    it 'is falsey if convert returns nil' 


    it 'is not successful if the body contains more than 50 images' 


  end

end

