# frozen_string_literal: true

require 'spec_helper'

describe "Products", type: :feature do
  context "as admin user" do
    stub_authorization!

    before(:each) do
      visit spree.admin_path
    end

    def build_option_type_with_values(name, values)
      ot = FactoryBot.create(:option_type, name: name)
      values.each do |val|
        ot.option_values.create(name: val.downcase, presentation: val)
      end
      ot
    end

    context "listing products" do
      context "sorting" do
        before do
          create(:product, name: 'apache baseball cap', price: 10)
          create(:product, name: 'zomg shirt', price: 5)
        end

        it "should list existing products with correct sorting by name" 


        it "should list existing products with correct sorting by price" 

      end

      context "currency displaying" do
        context "using Russian Rubles" do
          before do
            Spree::Config[:currency] = "RUB"
          end

          let!(:product) do
            create(:product, name: "Just a product", price: 19.99)
          end

          # Regression test for https://github.com/spree/spree/issues/2737
          context "uses руб as the currency symbol" do
            it "on the products listing page" 

          end
        end
      end
      context "when none of the product prices are in the same currency as the default in the store" do
        before do
          Spree::Config[:currency] = "MXN"
        end

        let!(:product) do
          create(:product, name: "Just a product", price: 19.99)
        end

        it 'defaults it to Spree::Config.currency and sets the price as blank' 

      end
    end

    context "searching products" do
      it "should be able to search deleted products", js: true do
        create(:product, name: 'apache baseball cap', deleted_at: "2011-01-06 18:21:13")
        create(:product, name: 'zomg shirt')

        click_nav "Products"
        expect(page).to have_content("zomg shirt")
        expect(page).not_to have_content("apache baseball cap")
        check "Show Deleted"
        click_button 'Search'
        expect(find('input[name="q[with_deleted]"]')).to be_checked
        expect(page).to have_content("zomg shirt")
        expect(page).to have_content("apache baseball cap")
        uncheck "Show Deleted"
        click_button 'Search'
        expect(page).to have_content("zomg shirt")
        expect(page).not_to have_content("apache baseball cap")
      end

      it "should be able to search products by their properties" 


      # Regression test for https://github.com/solidusio/solidus/issues/2016
      it "should be able to search and sort by price" 

    end

    context "creating a new product" do
      before(:each) do
        @shipping_category = create(:shipping_category)
        click_nav "Products"
        click_on "New Product"
      end

      it "should allow an admin to create a new product", js: true do
        fill_in "product_name", with: "Baseball Cap"
        fill_in "product_sku", with: "B100"
        fill_in "product_price", with: "100"
        fill_in "product_available_on", with: "2012/01/24"
        select @shipping_category.name, from: "product_shipping_category_id"
        click_button "Create"
        expect(page).to have_content("successfully created!")
        click_button "Update"
        expect(page).to have_content("successfully updated!")
      end

      it "should show validation errors", js: false do
        fill_in "product_name", with: "Baseball Cap"
        fill_in "product_sku", with: "B100"
        fill_in "product_price", with: "100"
        click_button "Create"
        expect(page).to have_content("Shipping category can't be blank")
      end

      context "using a locale with a different decimal format " do
        before do
          # change English locale’s separator and delimiter to match 19,99 format
          I18n.backend.store_translations(:en,
            number: {
              currency: {
                format: {
                  separator: ",",
                  delimiter: "."
                }
              }
            })
        end

        after do
          # revert changes to English locale
          I18n.backend.store_translations(:en,
            number: {
              currency: {
                format: {
                  separator: ".",
                  delimiter: ","
                }
              }
            })
        end

        it "should show localized price value on validation errors", js: true do
          fill_in "Name", with: " "
          select @shipping_category.name, from: "product_shipping_category_id"
          fill_in "product_price", with: "19,99"
          click_button "Create"
          expect(page).to have_content("Name can't be blank")
          expect(page).to have_field('product_price', with: '19,99')
        end
      end

      # Regression test for https://github.com/spree/spree/issues/2097
      it "can set the count on hand to a null value", js: true do
        fill_in "product_name", with: "Baseball Cap"
        fill_in "product_price", with: "100"
        select @shipping_category.name, from: "product_shipping_category_id"
        click_button "Create"
        expect(page).to have_content("successfully created!")
        click_button "Update"
        expect(page).to have_content("successfully updated!")
      end
    end

    context "cloning a product", js: true do
      it "should allow an admin to clone a product" 


      context "cloning a deleted product" do
        it "should allow an admin to clone a deleted product" 

      end
    end

    context 'updating a product', js: true do
      let(:product) { create(:product) }

      it 'should parse correctly available_on' 

    end

    context 'deleting a product', js: true do
      let!(:product) { create(:product) }

      it "product details are still viewable" 

    end
  end

  context 'with only product permissions' do
    before do
      allow_any_instance_of(Spree::Admin::BaseController).to receive(:spree_current_user).and_return(nil)
    end

    custom_authorization! do |_user|
      can [:admin, :update, :index, :read], Spree::Product
    end
    let!(:product) { create(:product) }

    it "should only display accessible links on index" 


    it "should only display accessible links on edit" 

  end
end

