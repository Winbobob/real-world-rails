# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WidgetHelper do

  include WidgetHelper

  describe '#status_description' do

    before do
      @info_request = FactoryBot.build(:info_request)
    end

    it 'should return "Awaiting classification" for "waiting_classification' 


    it 'should call theme_display_status for a theme status' 


    it 'should return unknown for an unknown status' 


  end

end

