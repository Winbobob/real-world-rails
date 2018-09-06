# frozen_string_literal: true

require 'spec_helper'

describe "Link overlay" do
  before do
    authorize_user(:as_admin)
  end

  context "GUI" do
    it "has a tab for linking internal pages" 


    it "has a tab for linking external pages" 


    it "has a tab for linking files" 

  end

  context "linking internal pages", js: true do
    let(:lang_root) do
      create(:alchemy_page, :language_root)
    end

    before do
      create(:alchemy_page, :public, parent_id: lang_root.id)
      create(:alchemy_page, :public, parent_id: lang_root.id)
    end

    it "should have code to load a tree of internal pages" 


    it "should not have a link for pages that redirect to external" 

  end
end

