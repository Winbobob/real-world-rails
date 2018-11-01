# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/leads/index" do
  include LeadsHelper

  before do
    login
  end

  it "should render [lead] template with @leads collection if there are leads" 


  it "should render [empty] template if @leads collection if there are no leads" 

end

