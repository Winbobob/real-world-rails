# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/contacts/create" do
  include ContactsHelper

  before do
    login
  end

  describe "create success" do
    before do
      assign(:contact, @contact = build_stubbed(:contact))
      assign(:contacts, [@contact].paginate)
    end

    it "should hide [Create Contact] form and insert contact partial" 


    it "should refresh sidebar when called from contacts index" 


    it "should update pagination when called from contacts index" 


    it "should update recently viewed items when called from related asset" 

  end

  describe "create failure" do
    it "create (failure): should re-render [create] template in :create_contact div" 

  end
end

