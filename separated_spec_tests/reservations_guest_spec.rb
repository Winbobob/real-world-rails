# frozen_string_literal: true
require 'spec_helper'

describe 'guest users', type: :feature do
  # Shared Examples
  shared_examples 'unauthorized' do
    context 'visiting protected route' do
      describe '/reservations/new' do
        it_behaves_like('inaccessible to guests', :new_reservation_path)
      end
      describe '/reservations' do
        it_behaves_like('inaccessible to guests', :reservations_path)
      end
      describe '/users' do
        it_behaves_like('inaccessible to guests', :users_path)
      end
      describe '/app_configs/edit' do
        it_behaves_like('inaccessible to guests', :edit_app_configs_path)
      end
    end
  end

  # based on http://www.tkalin.com/blog_posts/testing-authorization-using-rspec-parametrized-shared-examples/
  shared_examples 'inaccessible to guests' do |url, mod|
    if mod
      let(:url_path) { send(url, mod.first.id) }
    else
      let(:url_path) { send(url) }
    end

    it 'redirects to the signin page with errors' 

  end

  shared_examples 'accessible to guests' do |url, mod|
    if mod
      let(:url_path) { send(url, mod.first.id) }
    else
      let(:url_path) { send(url) }
    end

    it 'goes to the correct page with sign in link' 

  end

  context 'when enabled' do
    before(:each) do
      allow(@app_config).to receive(:enable_guests).and_return(true)
    end

    it 'correctly sets the setting' 


    it_behaves_like 'unauthorized'

    context 'visiting permitted route' do
      describe '/' do
        it_behaves_like('accessible to guests', :root_path)
      end
      describe '/catalog' do
        it_behaves_like('accessible to guests', :catalog_path)
      end
      describe '/equipment_models/:id' do
        it_behaves_like('accessible to guests', :equipment_model_path,
                        EquipmentModel)
      end
      describe '/categories/:id/equipment_models' do
        it_behaves_like('accessible to guests', :category_equipment_models_path,
                        Category)
      end
      describe '/terms_of_service' do
        it_behaves_like('accessible to guests', :tos_path)
      end
    end

    describe 'can use the catalog' do
      before :each do
        add_item_to_cart(@eq_model)
        visit '/'
      end

      it 'can add items to cart' 


      it 'can remove items from cart' 


      it 'can change item quantities' 


      it 'can change the dates' 

    end
  end

  context 'when disabled' do
    before(:each) do
      allow(@app_config).to receive(:enable_guests).and_return(false)
    end

    it 'correctly sets the setting' 


    it_behaves_like 'unauthorized'

    context 'visiting nominally permitted route' do
      describe '/' do
        it_behaves_like('inaccessible to guests', :root_path)
      end
      describe '/catalog' do
        it_behaves_like('inaccessible to guests', :catalog_path)
      end
      describe '/equipment_models/:id' do
        it_behaves_like('inaccessible to guests', :equipment_model_path,
                        EquipmentModel)
      end
      describe '/categories/:id/equipment_models' do
        it_behaves_like('inaccessible to guests',
                        :category_equipment_models_path,
                        Category)
      end
      describe '/terms_of_service' do
        it_behaves_like('inaccessible to guests', :tos_path)
      end
    end
  end
end

