# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe 'when handling incoming mail' do
  let(:info_request){ FactoryBot.create(:info_request) }

  it "receives incoming messages, sends email to requester, and shows them" 


  it "makes attachments available for download" 


  it "converts message body to UTF8" 


  it "generates a valid HTML verson of plain text attachments" 


  it "generates a valid HTML verson of PDF attachments" 


  it "does not cause a reparsing of the raw email, even when the attachment can't be found" 


  it "treats attachments with unknown extensions as binary" 


end

