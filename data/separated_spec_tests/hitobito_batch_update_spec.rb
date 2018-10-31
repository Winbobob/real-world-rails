# encoding: utf-8

#  Copyright (c) 2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.
#

require 'spec_helper'

describe Invoice::BatchUpdate do
  include ActiveSupport::Testing::TimeHelpers

  let(:person)  { people(:top_leader) }
  let(:draft)   { invoices(:invoice) }
  let(:sent)    { invoices(:sent) }
  let(:results) { @results  }

  def update(invoices, sender = nil)
    @results = Invoice::BatchUpdate.new(invoices, sender).call
  end

  it 'changes invoice to state from draft to issued' 


  it 'changes invoice to state from draft to sent, sends email' 


  it 'changes invoice to state sent from issued, sends email' 


  it 'changes overdue invoice to state reminded, creates first reminder' 


  it 'tracks error if no reminder can be issued because config is misisng' 


  it 'does not change non draft invoice' 


  it 'does not change invoice to sent if recipient_email is missing' 


  context 'reminders' do
    it 'creates 1st reminder for overdue invoice' 


    it 'does not create 2nd reminder invoice is not yet due' 


    it 'creates 2nd reminder for overdue invoice' 


    it 'creates 3rd reminder for overdue invoice' 


    it 'creates 4th reminder for overdue invoice, does not increase level' 

  end
end

