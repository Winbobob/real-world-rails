# encoding: utf-8

#  Copyright (c) 2012-2015 Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'
require_dependency 'person/invoices_controller'

describe Person::InvoicesController do
  let(:group)         { groups(:bottom_layer_one) }
  let(:top_leader)    { people(:top_leader) }
  let(:bottom_member) { people(:bottom_member) }

  it 'may not index person invoices if we have no finance permission in layer' 


  it 'may index my own invoices' 


end


