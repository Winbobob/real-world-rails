# frozen_string_literal: true

require 'spec_helper'

#  Copyright (c) 2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

describe InvoiceListsController do
  let(:group) { groups(:bottom_layer_one) }
  let(:person) { people(:bottom_member) }

  context 'authorization' do
    before { sign_in(person) }

    it "may index when person has finance permission on layer group" 


    it "may update when person has finance permission on layer group" 


    it "may not index when person has finance permission on layer group" 


    it "may not edit when person has finance permission on layer group" 

  end

  context 'authorized' do
    include ActiveSupport::Testing::TimeHelpers

    before { sign_in(person) }

    it 'GET#new assigns_attributes and renders crud/new template' 


    it 'GET#new via xhr assigns invoice items and total' 


    it 'POST#create creates an invoice for single member' 


    it 'POST#create sets creator_id to current_user' 


    it 'POST#create creates an invoice for each member of group' 


    it 'PUT#update informs if not invoice has been selected' 


    it 'PUT#update moves invoice to sent state' 


    it 'PUT#update can move multiple invoices at once' 


    it 'PUT#update enqueues job' 


    it 'DELETE#destroy informs if no invoice has been selected' 


    it 'DELETE#destroy moves invoice to cancelled state' 


    it 'DELETE#destroy may move multiple invoices to cancelled state' 

  end

  def invoice_attrs
    {
      title: 'Title',
      recipient_ids: group.people.limit(2).collect(&:id).join(','),
      invoice_items_attributes: { '1' => { name: 'item1', unit_cost: 1, count: 1},
                                  '2' => { name: 'item2', unit_cost: 2, count: 1 } }
    }
  end
end

