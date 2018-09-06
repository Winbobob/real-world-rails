# encoding: utf-8

#  Copyright (c) 2012-2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe PaymentsController do

  let(:group)   { groups(:bottom_layer_one) }
  let(:person)  { people(:bottom_member) }
  let(:invoice) { invoices(:invoice) }

  before { sign_in(person) }

  it 'POST#creates valid arguments create payment' 


  it 'POST#creates invalid arguments redirect back' 


end

