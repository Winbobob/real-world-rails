require "rails_helper"

describe CategoriesController do
  describe "create" do

    it "requires the user to be logged in" 


    describe "logged in" do
      before do
        @user = log_in(:admin)
      end

      it "raises an exception when they don't have permission to create it" 


      it "raises an exception when the name is missing" 


      it "raises an exception when the color is missing" 


      it "raises an exception when the text color is missing" 


      describe "failure" do
        before do
          @category = Fabricate(:category, user: @user)

          post :create, params: {
            name: @category.name, color: "ff0", text_color: "fff"
          }, format: :json
        end

        it { is_expected.not_to respond_with(:success) }

        it "returns errors on a duplicate category name" 

      end

      describe "success" do
        it "works" 

      end
    end
  end

  describe "destroy" do

    it "requires the user to be logged in" 


    describe "logged in" do
      before do
        @user = log_in
        @category = Fabricate(:category, user: @user)
      end

      it "raises an exception if they don't have permission to delete it" 


      it "deletes the record" 

    end

  end

  describe "reorder" do
    it "reorders the categories" 

  end

  describe "update" do

    it "requires the user to be logged in" 


    describe "logged in" do
      let(:valid_attrs) { { id: @category.id, name: "hello", color: "ff0", text_color: "fff" } }

      before do
        @user = log_in(:admin)
        @category = Fabricate(:category, user: @user)
      end

      it "raises an exception if they don't have permission to edit it" 


      it "requires a name" 


      it "requires a color" 


      it "requires a text color" 


      describe "failure" do
        before do
          @other_category = Fabricate(:category, name: "Other", user: @user)

          put :update, params: {
            id: @category.id,
            name: @other_category.name,
            color: "ff0",
            text_color: "fff",
          }, format: :json
        end

        it "returns errors on a duplicate category name" 


        it "returns errors on a duplicate category name" 

      end

      it "returns 422 if email_in address is already in use for other category" 


      describe "success" do

        it "updates the group correctly" 


        it 'logs the changes correctly' 

      end
    end

  end

  describe 'update_slug' do
    it 'requires the user to be logged in' 


    describe 'logged in' do
      let(:valid_attrs) { { id: @category.id, slug: 'fff' } }

      before do
        @user = log_in(:admin)
        @category = Fabricate(:happy_category, user: @user)
      end

      it 'rejects blank' 


      it 'accepts valid custom slug' 


      it 'accepts not well formed custom slug' 


      it 'accepts and sanitize custom slug when the slug generation method is not ascii' 


      it 'rejects invalid custom slug' 

    end
  end
end

