# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe AttachmentToHTML::Adapters::Text do

  let(:attachment) { FactoryGirl.build(:body_text) }
  let(:adapter) { AttachmentToHTML::Adapters::Text.new(attachment) }

  describe :title do

    it 'uses the attachment filename for the title' 


  end

  describe :body do

    it 'extracts the body from the document' 


    it 'strips the body of trailing whitespace' 


    it 'escapes special characters' 


    it 'creates hyperlinks for text that looks like a url' 


    it 'substitutes newlines for br tags' 


    it 'returns the body encoded as UTF-8' 


    it 'returns the body as valid UTF-8 when the text is not
        valid UTF-8' do
      attachment = FactoryGirl.build(:body_text, :body => "\xBF")
      adapter = AttachmentToHTML::Adapters::Text.new(attachment)
      expect(adapter.body).to be_valid_encoding
    end

  end

  describe :success? do

    it 'is truthy if the body has content excluding the tags' 


    it 'is truthy if the body contains images' 


    it 'is falsey if the body has no content other than tags' 


  end

end

