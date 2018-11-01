require 'rails_helper'

describe Admin::CategoriesController do

    store_setting
    login_admin

    describe 'GET #index' do
        let!(:category_1) { create(:category) }
        let!(:category_2) { create(:category) }
        before(:each) do
            create(:product_sku_attachment, category_id: category_1.id)
            create(:product_sku_attachment, category_id: category_2.id)
        end

        it "should populate an array of all categories" 

        it "should render the :index template" 

    end

    describe 'GET #new' do
        it "should assign a new Category to @category" 

        it "should render the :new template" 

    end

    describe 'GET #edit' do
        let(:category) { create(:category) }

        it "should assign the requested category to @category" 

        it "should render the :edit template" 

    end
    
    describe "POST #create" do
        context "with valid attributes" do
            it "should save the new category in the database" 

            it "should redirect to categories#index"  do
                post :create, category: attributes_for(:category)
                expect(response).to redirect_to admin_categories_url
            end
        end
        context "with invalid attributes" do
            it "should not save the new category in the database" 

            it "should re-render the :new template" 

        end 
    end

    describe 'PUT #update' do
        let!(:category) { create(:category, name: 'Category #1', active: false) }

        context "with valid attributes" do
            it "should locate the requested @category" 

            it "should update the category in the database" 

            it "should redirect to the categories#index" 

        end
        context "with invalid attributes" do 
            it "should not update the category" 

            it "should re-render the #edit template" 

        end 
    end
    
    describe 'DELETE #destroy' do
        let!(:category) { create(:category) }
        
        context "if there is more than one category in the database" do
            before :each do
                create(:category)
            end

            it "should flash a success message" 


            it "should delete the category from the database"  do
                expect {
                    delete :destroy, id: category.id
                }.to change(Category, :count).by(-1)
            end
        end

        context "if there is only one category in the database" do

            it "should flash a error message" 


            it "should not delete the category from the database"  do
                expect {
                    delete :destroy, id: category.id
                }.to change(Category, :count).by(0)
            end
        end
        it "should redirect to categorys#index" 

    end

end

