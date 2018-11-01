# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/leads/_edit" do
  include LeadsHelper

  before do
    login
    assign(:lead, @lead = build_stubbed(:lead))
    assign(:users, [current_user])
    assign(:campaign, @campaign = build_stubbed(:campaign))
    assign(:campaigns, [@campaign])
  end

  it "should render [edit lead] form" 


  it "should render background info field if settings require so" 


  it "should not render background info field if settings do not require so" 

end

