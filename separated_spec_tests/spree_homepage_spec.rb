require 'spec_helper'

describe 'Homepage', type: :feature do
  context 'as admin user' do
    stub_authorization!

    context 'visiting the homepage' do
      before do
        visit spree.admin_path
      end

      it "has header text 'Orders'" 


      it 'has a link to overview' 


      it 'has a link to orders' 


      it 'has a link to products' 


      it 'has a link to reports' 


      it 'has a link to configuration' 


      it 'has a link to return authorizations' 


      it 'has a link to customer returns' 


      context 'version number' do
        it 'is displayed' 


        context 'if turned off' do
          before { Spree::Config[:admin_show_version] = false }

          it 'is not displayed' 

        end
      end
    end

    context 'visiting the products tab' do
      before do
        visit spree.admin_products_path
      end

      it 'has a link to products' 


      it 'has a link to option types' 


      it 'has a link to properties' 


      it 'has a link to prototypes' 

    end
  end

  context 'as fakedispatch user' do
    before do
      allow_any_instance_of(Spree::Admin::BaseController).to receive(:spree_current_user).and_return(nil)
    end

    custom_authorization! do |_user|
      can [:admin, :edit, :index, :read], Spree::Order
    end

    it 'only displays tabs fakedispatch has access to' 

  end
end

