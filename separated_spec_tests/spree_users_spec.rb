require 'spec_helper'

describe 'Users', type: :feature do
  include Spree::BaseHelper
  stub_authorization!
  include Spree::Admin::BaseHelper

  let!(:user_a) { create(:user_with_addresses, email: 'a@example.com') }
  let!(:user_b) { create(:user_with_addresses, email: 'b@example.com') }

  let(:order) { create(:completed_order_with_totals, user: user_a, number: 'R123') }

  let(:order_2) do
    create(:completed_order_with_totals, user: user_a, number: 'R456').tap do |o|
      li = o.line_items.last
      li.update_column(:price, li.price + 10)
    end
  end

  let(:orders) { [order, order_2] }

  shared_examples_for 'a user page' do
    it 'has lifetime stats' 


    it 'can go back to the users list' 


    it 'can navigate to the account page' 


    it 'can navigate to the order history' 


    it 'can navigate to the items purchased' 

  end

  shared_examples_for 'a sortable attribute' do
    before { click_link sort_link }

    it 'can sort asc' 


    it 'can sort desc' 

  end

  before do
    create(:country)
    stub_const('Spree::User', create(:user, email: 'example@example.com').class)
    visit spree.admin_path
    click_link 'Users'
  end

  context 'users index' do
    context 'email' do
      it_behaves_like 'a sortable attribute' do
        let(:text_match_1) { user_a.email }
        let(:text_match_2) { user_b.email }
        let(:table_id) { 'listing_users' }
        let(:sort_link) { 'users_email_title' }
      end
    end

    it 'displays the correct results for a user search' 

  end

  context 'editing users' do
    before { click_link user_a.email }

    it_behaves_like 'a user page'

    it 'can edit the user email' 


    it 'can edit the user password' 


    it 'can edit user roles' 


    it 'can edit user shipping address' 


    it 'can edit user billing address' 


    it 'can set shipping address to be the same as billing address' 


    context 'no api key exists' do
      it 'can generate a new api key' 

    end

    context 'an api key exists' do
      before do
        user_a.generate_spree_api_key!
        expect(user_a.reload.spree_api_key).to be_present
        visit current_path
      end

      it 'can clear an api key' 


      it 'can regenerate an api key' 

    end
  end

  context 'order history with sorting' do
    before do
      orders
      click_link user_a.email
      within('#sidebar') { click_link Spree.t(:"admin.user.orders") }
    end

    it_behaves_like 'a user page'

    context 'completed_at' do
      it_behaves_like 'a sortable attribute' do
        let(:text_match_1) { order_time(order.completed_at) }
        let(:text_match_2) { order_time(order_2.completed_at) }
        let(:table_id) { 'listing_orders' }
        let(:sort_link) { 'orders_completed_at_title' }
      end
    end

    [:number, :state, :total].each do |attr|
      context attr do
        it_behaves_like 'a sortable attribute' do
          let(:text_match_1) { order.send(attr).to_s }
          let(:text_match_2) { order_2.send(attr).to_s }
          let(:table_id) { 'listing_orders' }
          let(:sort_link) { "orders_#{attr}_title" }
        end
      end
    end
  end

  context 'items purchased with sorting' do
    before do
      orders
      click_link user_a.email
      within('#sidebar') { click_link Spree.t(:"admin.user.items") }
    end

    it_behaves_like 'a user page'

    context 'completed_at' do
      it_behaves_like 'a sortable attribute' do
        let(:text_match_1) { order_time(order.completed_at) }
        let(:text_match_2) { order_time(order_2.completed_at) }
        let(:table_id) { 'listing_items' }
        let(:sort_link) { 'orders_completed_at_title' }
      end
    end

    [:number, :state].each do |attr|
      context attr do
        it_behaves_like 'a sortable attribute' do
          let(:text_match_1) { order.send(attr).to_s }
          let(:text_match_2) { order_2.send(attr).to_s }
          let(:table_id) { 'listing_items' }
          let(:sort_link) { "orders_#{attr}_title" }
        end
      end
    end

    it 'has item attributes' 

  end
end

