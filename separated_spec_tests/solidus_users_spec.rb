# frozen_string_literal: true

require 'spec_helper'

describe 'Users', type: :feature do
  stub_authorization!
  let!(:country) { create(:country) }
  let!(:user_a) { create(:user_with_addresses, email: 'a@example.com') }
  let!(:user_b) { create(:user_with_addresses, email: 'b@example.com') }
  let!(:admin_role) { create(:role, name: 'admin') }
  let!(:user_role) { create(:role, name: 'user') }

  let(:order) { create(:completed_order_with_totals, user: user_a, number: "R123") }

  let(:order_2) do
    create(:completed_order_with_totals, user: user_a, number: "R456").tap do |o|
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

    it "can sort asc" 


    it "can sort desc" 

  end

  before do
    visit spree.admin_path
    click_link 'Users'
  end

  context 'users index' do
    context "email" do
      it_behaves_like "a sortable attribute" do
        let(:text_match_1) { user_a.email }
        let(:text_match_2) { user_b.email }
        let(:table_id) { "listing_users" }
        let(:sort_link) { "users_email_title" }
      end
    end

    it 'displays the correct results for a user search by email' 


    context "member since" do
      before do
        user_a.update_column(:created_at, 2.weeks.ago)
      end

      it_behaves_like "a sortable attribute" do
        let(:text_match_1) { user_a.email }
        let(:text_match_2) { user_b.email }
        let(:table_id) { "listing_users" }
        let(:sort_link) { I18n.t('spree.member_since') }
      end

      it 'displays the correct results for a user search by creation date' 

    end

    context 'with users having roles' do
      before do
        user_a.spree_roles << admin_role
        user_b.spree_roles << user_role
      end

      it 'displays the correct results for a user search by role' 

    end
  end

  context 'editing users' do
    before { click_link user_a.email }

    it_behaves_like 'a user page'

    it 'can edit the user email' 


    it 'can edit the user password' 


    it 'can edit user roles' 


    it 'can delete user roles' 


    it 'can edit user shipping address' 


    it 'can edit user billing address' 


    context 'invalid entry' do
      around do |example|
        ::AlwaysInvalidUser = Class.new(Spree.user_class) do
          validate :always_invalid_email
          def always_invalid_email
            errors.add(:email, "is invalid")
          end
        end
        orig_class = Spree.user_class
        Spree.user_class = "AlwaysInvalidUser"

        example.run

        Spree.user_class = orig_class.name
        Object.send(:remove_const, "AlwaysInvalidUser")
      end

      it 'should show validation errors' 

    end

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
      within(".tabs") { click_link I18n.t("spree.admin.user.order_history") }
    end

    it_behaves_like 'a user page'

    context "completed_at" do
      it_behaves_like "a sortable attribute" do
        let(:text_match_1) { I18n.l(order.completed_at.to_date) }
        let(:text_match_2) { I18n.l(order_2.completed_at.to_date) }
        let(:table_id) { "listing_orders" }
        let(:sort_link) { "orders_completed_at_title" }
      end
    end

    [:number, :total].each do |attr|
      context attr do
        it_behaves_like "a sortable attribute" do
          let(:text_match_1) { order.send(attr).to_s }
          let(:text_match_2) { order_2.send(attr).to_s }
          let(:table_id) { "listing_orders" }
          let(:sort_link) { "orders_#{attr}_title" }
        end
      end
    end

    context "state" do
      let(:text_match_1) { "Complete" }
      let(:text_match_2) { "Complete" }
      let(:table_id) { "listing_orders" }
      let(:sort_link) { "orders_#{attr}_title" }
    end
  end

  context 'items purchased with sorting' do
    before do
      orders
      click_link user_a.email
      within(".tabs") { click_link I18n.t("spree.admin.user.items") }
    end

    it_behaves_like 'a user page'

    context "completed_at" do
      it_behaves_like "a sortable attribute" do
        let(:text_match_1) { I18n.l(order.completed_at.to_date) }
        let(:text_match_2) { I18n.l(order_2.completed_at.to_date) }
        let(:table_id) { "listing_items" }
        let(:sort_link) { "orders_completed_at_title" }
      end
    end

    context "number" do
      let(:text_match_1) { "R123" }
      let(:text_match_2) { "R456" }
      let(:table_id) { "listing_items" }
      let(:sort_link) { "orders_#{attr}_title" }
    end

    context "state" do
      let(:text_match_1) { "Complete" }
      let(:text_match_2) { "Complete" }
      let(:table_id) { "listing_items" }
      let(:sort_link) { "orders_#{attr}_title" }
    end

    it "has item attributes" 

  end
end

