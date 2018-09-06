# frozen_string_literal: true

require 'spec_helper'

describe 'The API routes' do
  routes { Alchemy::Engine.routes }

  describe "for pages" do
    it "has route to show all pages." 


    context 'with missing format' do
      it "defaults to json." 

    end

    it "has route to show a page by urlname." 


    it "has route to show a page by nested urlname." 


    context 'with admin namespace' do
      it "routes to api pages controller." 

    end
  end

  describe 'for elements' do
    it "has route to show all elements." 


    context 'with missing format' do
      it "defaults to json." 

    end

    it "has route to show all elements for page id." 


    it "has route to show all elements for page id and name." 


    it "has route to show an element." 

  end

  describe 'for contents' do
    it "has route to show all contents." 


    context 'with missing format' do
      it "defaults to json." 

    end

    it "has route to show all contents for element id." 


    it "has route to show all contents for element id and name." 


    it "has route to show a content." 

  end
end

