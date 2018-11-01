# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../alaveteli_dsl')

describe "creating requests in alaveteli_pro" do
  context "when writing a new request from scratch" do
    let!(:public_body) { FactoryBot.create(:public_body, :name => 'example') }
    let!(:pro_user) { FactoryBot.create(:pro_user) }
    let!(:pro_user_session) { login(pro_user) }

    before do
      update_xapian_index
    end

    it "doesn't show the link to the batch request form to standard users" 


    it "shows the link to the batch request form to pro batch users" 


    it "allows us to save a draft" 


    it "allows us to preview the request" 


    it 'does not render HTML on the preview page' 


    it "allows us to send the request" 


    it "allow us to edit a request after previewing" 


    it "shows errors if we leave fields blank" 


    it "fills out the body with a template message" 


    it "saves the draft even if we leave fields blank" 


    it "redirects to the pro page if the user starts the normal process" 

  end
end

