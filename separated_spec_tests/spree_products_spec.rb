require 'spec_helper'

describe 'Products', type: :feature do
  context 'as admin user' do
    stub_authorization!

    def build_option_type_with_values(name, values)
      ot = FactoryBot.create(:option_type, name: name)
      values.each do |val|
        ot.option_values.create(name: val.downcase, presentation: val)
      end
      ot
    end

    context 'listing products' do
      context 'sorting' do
        before do
          create(:product, name: 'apache baseball cap', price: 10)
          create(:product, name: 'zomg shirt', price: 5)
        end

        it 'lists existing products with correct sorting by name' 


        it 'lists existing products with correct sorting by price' 

      end

      context 'currency displaying' do
        context 'using Russian Rubles' do
          before do
            Spree::Config[:currency] = 'RUB'
            create(:product, name: 'Just a product', price: 19.99)
          end

          # Regression test for #2737
          context 'uses руб as the currency symbol' do
            it 'on the products listing page' 

          end
        end
      end
    end

    context 'searching products' do
      it 'is able to search deleted products' 


      it 'is able to search products by their properties' 

    end

    context 'creating a new product from a prototype', js: true do
      def build_option_type_with_values(name, values)
        ot = FactoryBot.create(:option_type, name: name)
        values.each do |val|
          ot.option_values.create(name: val.downcase, presentation: val)
        end
        ot
      end

      let(:product_attributes) do
        # FactoryBot.attributes_for is un-deprecated!
        #   https://github.com/thoughtbot/factory_bot/issues/274#issuecomment-3592054
        FactoryBot.attributes_for(:simple_product)
      end

      let(:prototype) do
        size = build_option_type_with_values('size', %w(Small Medium Large))
        FactoryBot.create(:prototype, name: 'Size', option_types: [size])
      end

      let(:option_values_hash) do
        hash = {}
        prototype.option_types.each do |i|
          hash[i.id.to_s] = i.option_value_ids
        end
        hash
      end

      before do
        @option_type_prototype = prototype
        @property_prototype = create(:prototype, name: 'Random')
        @shipping_category = create(:shipping_category)
        visit spree.admin_products_path
        click_link 'admin_new_product'
        within('#new_product') do
          expect(page).to have_content('SKU')
        end
      end

      it 'allows an admin to create a new product and variants from a prototype' 


      it 'does not display variants when prototype does not contain option types' 


      context 'with html5 validations' do
        it 'keeps option values selected if validation fails' 

      end

      context 'without html5 validations' do
        it 'keeps option values selected if validation fails' 

      end
    end

    context 'creating a new product' do
      before do
        @shipping_category = create(:shipping_category)
        visit spree.admin_products_path
        click_link 'admin_new_product'
        within('#new_product') do
          expect(page).to have_content('SKU')
        end
      end

      it 'allows an admin to create a new product' 


      it 'shows validation errors' 


      context 'using a locale with a different decimal format ' do
        before do
          # change English locale's separator and delimiter to match 19,99 format
          I18n.backend.store_translations(:en,
                                          number: {
                                            currency: {
                                              format: {
                                                separator: ',',
                                                delimiter: '.'
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
                                                separator: '.',
                                                delimiter: ','
                                              }
                                            }
                                          })
        end

        it 'shows localized price value on validation errors', js: true do
          fill_in 'product_price', with: '19,99'
          click_button 'Create'
          expect(find('input#product_price').value).to eq('19,99')
        end
      end

      # Regression test for #2097
      it 'can set the count on hand to a null value' 

    end

    context 'cloning a product', js: true do
      it 'allows an admin to clone a product' 


      context 'cloning a deleted product' do
        it 'allows an admin to clone a deleted product' 

      end
    end

    context 'updating a product' do
      let(:product) { create(:product) }

      let(:prototype) do
        size = build_option_type_with_values('size', %w(Small Medium Large))
        FactoryBot.create(:prototype, name: 'Size', option_types: [size])
      end

      before do
        @option_type_prototype = prototype
        @property_prototype = create(:prototype, name: 'Random')
      end

      it 'parses correctly available_on' 


      it 'adds option_types when selecting a prototype', js: true do
        visit spree.admin_product_path(product)
        within('#sidebar') do
          click_link 'Properties'
        end
        click_link 'Select From Prototype'

        within("#prototypes tr#row_#{prototype.id}") do
          click_link 'Select'
          wait_for_ajax
        end

        within(:css, 'tr.product_property:first-child') do
          expect(first('input[type=text]').value).to eq('baseball_cap_color')
        end
      end

      context 'using a locale with a different decimal format' do
        before do
          # change English locale's separator and delimiter to match 19,99 format
          I18n.backend.store_translations(
            :en,
            number: {
              currency: {
                format: {
                  separator: ',',
                  delimiter: '.'
                }
              },
              format: {
                separator: ',',
                delimiter: '.'
              }
            }
          )
        end

        after do
          # revert changes to English locale
          I18n.backend.store_translations(
            :en,
            number: {
              currency: {
                format: {
                  separator: '.',
                  delimiter: ','
                }
              },
              format: {
                separator: '.',
                delimiter: ','
              }
            }
          )
        end

        it 'parses correctly decimal values like weight' 

      end
    end

    context 'deleting a product', js: true do
      let!(:product) { create(:product) }

      it 'is still viewable' 

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

    it 'only displays accessible links on index' 


    it 'only displays accessible links on edit' 

  end
end

