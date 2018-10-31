# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "admin/field_groups/destroy" do
  before do
    login_admin
    assign(:field_group, field_group)
  end

  let(:field_group) { build(:field_group) }

  it "renders destroy javascript" 


  it "renders 'not destroyed' javascript" 

end

