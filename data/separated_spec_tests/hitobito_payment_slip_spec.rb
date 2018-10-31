# encoding: utf-8

#  Copyright (c) 2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Invoice::PaymentSlip do
  let(:group)          { groups(:top_layer) }
  let(:person)         { people(:top_leader) }

  context 'check digit' do
    let(:esr_number) { Invoice::PaymentSlip.new }

    it 'calculates' 

  end

  context 'esr number' do
    it 'creates and formats esr number based on invoice and check digit' 

  end

  context 'code line' do
    it 'creates code line with amount' 


    it 'creates code line without amount' 

  end

  private

  def create_invoice(attrs = {})
    Invoice.create!(attrs.merge(title: 'invoice', group: group, recipient: person))
  end
end

