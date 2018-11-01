# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe AttachmentToHTML::Adapters::RTF do

  let(:attachment) { FactoryBot.build(:rtf_attachment) }
  let(:adapter) { AttachmentToHTML::Adapters::RTF.new(attachment) }

  describe :tmpdir do

    it 'defaults to the rails tmp directory' 


    it 'allows a tmpdir to be specified to store the converted document' 


  end

  describe :title do

    it 'uses the attachment filename for the title' 


  end

  describe :body do

    it 'extracts the body from the document' 


    it 'operates in the context of the supplied tmpdir' 


    it 'does not result in incorrect conversion when unrtf returns an invalid doctype' 


    it 'converts empty files' 


    it 'doesnt fail if the external command returns nil' 


  end


  describe :success? do

    it 'is truthy if the body has content excluding the tags' 


    it 'is truthy if the body contains images' 


    it 'is falsey if the body has no content other than tags' 


  end

end

