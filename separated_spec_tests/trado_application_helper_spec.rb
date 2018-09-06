require 'rails_helper'

describe ApplicationHelper do

    store_setting

    describe '#category_list' do
        let!(:category_1) { create(:category, sorting: 0) }
        let!(:category_2) { create(:category, sorting: 1) }
        before(:each) do
            create(:product_sku_attachment, category_id: category_1.id)
            create(:product_sku_attachment, category_id: category_2.id)
        end

        it "should return a list of active categories sorted by their sorting attribute value" 

    end

    describe '#page_list' do
        let!(:page_1) { create(:standard_page, title: 'apple') }
        let!(:page_2) { create(:contact_page, title: 'orange') }

        it "should return a list of active pages sorted by their title value" 

    end

    describe '#active_controller?' do

        context "if action parameter is nil" do
            before(:each) do
                helper.stub(:params) { { controller: 'product' } }
            end

            context "if the controller parameter equals the parameter[:controller] value" do

                it "should return the 'current' class name" 

            end

            context "if the controller parameter does not equal the parameter[:controller] value" do

                it "should return nil" 

            end
        end

        context "if action parameter is not nil" do
            before(:each) do
                helper.stub(:params) { { controller: 'product', action: 'show' } }
            end

            context "if the controller parameter equals the parameter[:controller] value and the action parameter equal the parameter[:action]" do

                it "should return the 'current' class name" 

            end

            context "if the controller parameter does not equal the parameter[:controller] value and/or the action parameter does not equal the parameter[:action]" do

                it "should return nil" 

            end
        end
    end

    describe '#active_category?' do

        context "if params[:category_id] has a value" do    
            before(:each) do
                helper.stub(:params) { { category_id: 5 } }
            end

            context "if the id parameter equals params[:category_id]" do

                it "should return the 'active' class name" 

            end

            context "if the id parameter does not equal params[:category_id]" do

                it "should return nil" 

            end
        end

        context "if params[:id] has a value" do    
            before(:each) do
                helper.stub(:params) { { id: 7 } }
            end

            context "if the id parameter equals params[:id]" do

                it "should return the 'active' class name" 

            end

            context "if the id parameter does not equal params[:id]" do

                it "should return nil" 

            end
        end

    end

    describe '#active_page?' do
        before(:each) do
            helper.stub(:params) { { controller: 'product', action: 'show' } }
        end

        context "if the controller and action parameter equals the params[:controller] and params[:action] value" do

            it "should return the 'active' class name" 

        end

        context "if the controller and action parameter does not equal the params[:controller] or params[:action] value" do

            it "should return nil" 

        end

        context "if the controller and id parameter equals the params[:controller] and params[:id]" do
            before(:each) do
                helper.stub(:params) { { controller: 'pages', action: 'standard', slug: 'contact-us'} }
            end
            it "should return the 'active' class name" 

        end
    end

    describe '#create_store_breadcrumbs' do

        it "should return an array of breadcrumb hash objects" 

    end

    describe '#store_breadcrumb_add' do
        before(:each) do
            helper.store_breadcrumb_add('test', '/test')
        end

        it "should add a new hash object to the create_store_breadcrumbs array" 

    end

    describe '#create_admin_breadcrumbs' do

        it "should return an array of breadcrumb hash objects" 

    end

    describe '#breadcrumb_add' do
        before(:each) do
            helper.breadcrumb_add('new', '/new')
        end

        it "should add a new hash object to the create_admin_breadcrumbs array" 

    end
end

