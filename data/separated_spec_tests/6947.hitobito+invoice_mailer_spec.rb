# encoding: utf-8

#  Copyright (c) 2012-2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.
require 'spec_helper'

describe InvoiceMailer do

  let(:invoice) { invoices(:invoice) }
  let(:sender) { people(:bottom_member) }
  let(:mail) { InvoiceMailer.notification(invoice, sender) }
  let(:html) { mail.body.parts.find { |p| p.content_type =~/html/ }.to_s }
  let(:pdf) { mail.body.parts.find { |p| p.content_type =~/pdf/ } }

  subject { mail }

  its(:to)        { should == [invoice.recipient.email] }
  its(:reply_to)  { should == [sender.email] }
  its(:subject)   { should =~ /Rechnung \d+-\d+ von Bottom One/ }

  it 'renders body if invoice.recipient is missing' 


  it 'uses sender email in mail headers' 


  it 'uses invoice_config.email in mail headers' 


  describe :html_body do
    it 'includes group address' 


    it 'lists pins items' 


    it 'has calculated total' 

  end

  describe :pdf_body do
    it 'includes filename' 

  end

end

