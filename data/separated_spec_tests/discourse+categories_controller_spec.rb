require 'rails_helper'

describe CategoriesController do
  let(:admin) { Fabricate(:admin) }
  let!(:category) { Fabricate(:category, user: admin) }

  context 'index' do

    it 'suppresses categories correctly' 


    it 'web crawler view has correct urls for subfolder install' 


    it "properly preloads topic list" 

  end

  context 'extensibility event' do
    before do
      sign_in(admin)
    end

    it "triggers a extensibility event" 

  end

  context '#create' do
    it "requires the user to be logged in" 


    describe "logged in" do
      before do
        SiteSetting.queue_jobs = false
        sign_in(admin)
      end

      it "raises an exception when they don't have permission to create it" 


      it "raises an exception when the name is missing" 


      it "raises an exception when the color is missing" 


      it "raises an exception when the text color is missing" 


      describe "failure" do
        it "returns errors on a duplicate category name" 


        it "returns errors with invalid group" 

      end

      describe "success" do
        it "works" 

      end
    end
  end

  context '#destroy' do
    it "requires the user to be logged in" 


    describe "logged in" do
      it "raises an exception if they don't have permission to delete it" 


      it "deletes the record" 

    end
  end

  context '#reorder' do
    it "reorders the categories" 

  end

  context '#update' do
    before do
      SiteSetting.queue_jobs = false
    end

    it "requires the user to be logged in" 


    describe "logged in" do
      let(:valid_attrs) { { id: category.id, name: "hello", color: "ff0", text_color: "fff" } }

      before do
        sign_in(admin)
      end

      it "raises an exception if they don't have permission to edit it" 


      it "requires a name" 


      it "requires a color" 


      it "requires a text color" 


      it "returns errors on a duplicate category name" 


      it "returns 422 if email_in address is already in use for other category" 


      describe "success" do
        it "updates the group correctly" 


        it 'logs the changes correctly' 


        it 'updates per-category settings correctly' 

      end
    end
  end

  context '#update_slug' do
    it 'requires the user to be logged in' 


    describe 'logged in' do
      let(:valid_attrs) { { id: category.id, slug: 'fff' } }

      before do
        sign_in(admin)
      end

      it 'rejects blank' 


      it 'accepts valid custom slug' 


      it 'accepts not well formed custom slug' 


      it 'accepts and sanitize custom slug when the slug generation method is not ascii' 


      it 'rejects invalid custom slug' 

    end
  end
end

