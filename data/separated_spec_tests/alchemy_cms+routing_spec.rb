# frozen_string_literal: true

require 'spec_helper'

describe "The Routing" do
  routes { Alchemy::Engine.routes }

  describe "root url" do
    it "routes to pages_controller#index" 


    context 'with locale parameter' do
      it 'routes to pages_controller#index' 


      context 'that contains uppercase country code' do
        it 'routes to pages_controller#index' 

      end
    end
  end

  context "for downloads" do
    it "should have a named route" 

  end

  describe "nested url" do
    context "one level deep nested" do
      it "should route to pages show" 


      context "and language" do
        it "should route to pages show" 

      end
    end

    context "two levels deep nested" do
      it "should route to pages show" 


      context "and language" do
        it "should route to pages show" 

      end
    end

    context "with a blog date url" do
      it "should route to pages show" 


      context "and language" do
        it "should route to pages show" 

      end
    end
  end

  describe "image format requests" do
    it "should not be handled by alchemy/pages controller" 

  end

  describe "rss feed requests" do
    it "should be handled by alchemy/pages controller" 

  end

  describe "unknown formats" do
    it "should be handled by alchemy/pages controller" 

  end

  describe "Rails info requests" do
    it "should not be handled by alchemy/pages controller" 

  end

  context "for admin interface" do
    context "default" do
      it "should route to admin dashboard" 


      it "should route to page preview" 

    end

    context "customized" do
      before(:all) do
        Alchemy.admin_path = "backend"
        Alchemy.admin_constraints = {subdomain: "hidden"}
        Rails.application.reload_routes!
      end

      it "should route to admin dashboard" 


      it "should route to page preview" 


      after(:all) do
        Alchemy.admin_path = "admin"
        Alchemy.admin_constraints = {}
        Rails.application.reload_routes!
      end
    end
  end
end

