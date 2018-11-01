# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/contacts/index" do
  include ContactsHelper

  before do
    view.lookup_context.prefixes << 'entities'
    assign :per_page, Contact.per_page
    assign :sort_by,  Contact.sort_by
    assign :ransack_search, Contact.ransack
    login
  end

  it "should render a list of contacts if it's not empty" 


  it "should render a message if there're no contacts" 

end
