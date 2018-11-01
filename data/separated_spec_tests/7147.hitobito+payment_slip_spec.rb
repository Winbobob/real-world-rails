# encoding: utf-8

#  Copyright (c) 2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Invoice::PaymentSlip do
  let(:invoice) { invoices(:invoice) }
  let(:subject) { Invoice::PaymentSlip.new(invoice) }

  %w(1236 1237 1230 1232 1239 1235 1238 1234 1231 1233).each_with_index do |number, index|
    it "#check_digit returns #{index} for #{number}" 

  end

  it '#esr_number is formatted group_id and index with check digit append' 


  it '#padded_number is 13 chars length zero padded group_id' 


  it '#padded_number cuts group id and prefixes participant_number_internal if set' 


  it '#esr_number calculates check digit based on padded group_id and index' 


  it '#code_line is includes amount if invoice_items are present' 


  it '#code_line formats iamount with precision 2' 


  it '#code_line is does not include amount if invoice_items are missing' 

end

