# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require "fat_free_crm/view_factory"

describe FatFreeCRM::ViewFactory do
  before(:each) do
    FatFreeCRM::ViewFactory.send(:class_variable_set, '@@views', [])
  end

  describe "initialization" do
    before(:each) do
      @view_params = { name: 'brief', title: 'Brief View', icon: 'fa-bars', controllers: ['contacts'], actions: %w[show index] }
    end

    it "should initialize with required parameters" 


    it "should register view with ViewFactory" 


    it "should not register the same view twice" 

  end

  describe "views_for" do
    before(:each) do
      @v1 = FatFreeCRM::ViewFactory.new name: 'brief', title: 'Brief View', controllers: ['contacts'], actions: %w[show index]
      @v2 = FatFreeCRM::ViewFactory.new name: 'long', title: 'Long View', controllers: ['contacts'], actions: ['show']
      @v3 = FatFreeCRM::ViewFactory.new name: 'full', title: 'Full View', controllers: ['accounts'], actions: ['show']
    end

    it "should return 'brief' view for ContactsController#index" 


    it "should return 'brief' and 'long' view for ContactsController#show" 


    it "should return 'full' view for AccountsController#show" 


    it "should return no views for TasksController#show" 

  end
end

