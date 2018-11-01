require 'rails_helper'

describe Admin::PagesController do

    store_setting
    login_admin

    describe 'GET #index' do
        let!(:standard_page) { create(:standard_page) }
        let!(:contact_page) { create(:contact_page) }

        it "should populate an array of all pages" 

        it "should render the :index template" 

    end

    describe 'GET #edit' do
        let(:page) { create(:standard_page) }

        it 'should assign a list of template types to @template_types' 

        it "should assign the requested page to @page" 

        it "should render the :edit template" 

    end

    describe 'PUT #update' do
        let!(:page) { create(:standard_page, title: 'Page #1', active: false) }

        it 'should assign a list of template types to @template_types' 


        context "if the page's slug attribute has illegal characters" do
            it "should strip them out and replace with hyphens" 

        end
        context "with valid attributes" do
            it "should locate the requested @page" 

            it "should update the page in the database" 

            it "should redirect to the pages#index" 

        end
        context "with invalid attributes" do 
            it "should not update the page" 

            it "should re-render the #edit template" 

        end 
    end
end

