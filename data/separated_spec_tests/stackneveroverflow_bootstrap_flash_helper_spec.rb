# encoding: utf-8
require 'spec_helper'
require 'action_view'
require 'active_support'
require_relative '../../../app/helpers/bootstrap_flash_helper'

include ActionView::Helpers
include ActionView::Context
include BootstrapFlashHelper

describe BootstrapFlashHelper, type: :helper do
  before do
    allow(self).to receive(:uri_state) { :inactive }
    allow(self).to receive(:root_url) { '/' }
  end

  describe "bootstrap_flash" do
    it "should not return anything without flashes" 


    it "should work with a notice" 


    it "should work with a notice and an extra class" 


    it "should work with a notice and an extra class and an extra attribute" 


    it "should escape javascript if not marked as safe by user" 


    it "should not escape a link if marked as safe by user" 

  end
end

