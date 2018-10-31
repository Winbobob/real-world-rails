# encoding: utf-8

#  Copyright (c) 2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe InvoicesController do

  let(:group) { groups(:bottom_layer_one) }
  let(:person) { people(:bottom_member) }
  let(:invoice) { invoices(:invoice) }
  before { sign_in(person) }

  context 'authorization' do
    it "may index when person has finance permission on layer group" 


    it "may edit when person has finance permission on layer group" 


    it "may not index when person has no finance permission on layer group" 


    it "may not edit when person has no finance permission on layer group" 

  end

  context 'index' do
    it 'GET#index finds invoices by title' 


    it 'GET#index finds invoices by sequence_number' 


    it 'GET#index finds invoices by recipient.last_name' 


    it 'GET#index finds nothing for dummy' 


    it 'filters invoices by state' 


    it 'filters invoices by due_since' 


    it 'ignores page param when passing in ids' 


    it 'exports pdf' 


    it 'exports labels pdf' 


    it 'exports pdf' 

  end

  context 'show' do
    it 'GET#show assigns payment if invoice has been sent' 


    it 'GET#show assigns payment with amount_open' 


    it 'GET#show assigns payment with flash parameters' 


    it 'exports pdf' 


    it 'exports csv' 

  end

  it 'DELETE#destroy moves invoice to cancelled state' 


  it 'POST#create sets creator_id to current_user' 


end

