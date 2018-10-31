# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe AttachmentToHTML::Adapters::CouldNotConvert do

  let(:attachment) { FactoryGirl.build(:pdf_attachment) }
  let(:adapter) do
    AttachmentToHTML::Adapters::CouldNotConvert.new(attachment)
  end

  describe :title do

    it 'uses the attachment filename for the title' 


  end

  describe :body do

    it 'contains a message asking the user to download the file directly' 


  end

  describe :success? do

    it 'is always true' 


  end

end

