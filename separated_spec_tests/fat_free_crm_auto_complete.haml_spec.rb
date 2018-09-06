# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/application/_auto_complete" do
  include AccountsHelper

  before do
    login
  end

  %i[account campaign contact lead opportunity].each do |model|
    it "should render autocomplete list if #{model} matches found" 


    it "should render a message if #{model} doesn't match the query" 

  end
end

