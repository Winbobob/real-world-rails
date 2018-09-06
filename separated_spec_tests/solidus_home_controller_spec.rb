# frozen_string_literal: true

require 'spec_helper'

describe Spree::HomeController, type: :controller do
  it "provides current user to the searcher class" 


  context "layout" do
    it "renders default layout" 


    context "different layout specified in config" do
      before { Spree::Config.layout = 'layouts/application' }

      it "renders specified layout" 

    end
  end
end

