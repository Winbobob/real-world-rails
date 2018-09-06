# frozen_string_literal: true

require 'spec_helper'

describe 'Dashboard feature' do
  let(:user) { create(:alchemy_dummy_user, :as_admin, name: "Joe User") }

  before do
    authorize_user(user)
  end

  describe 'Locked pages summary' do
    let(:a_page) { create(:alchemy_page, :public, visible: true) }

    it "should initially show no pages are locked" 


    context 'When locked by current user' do
      it "should show locked by me" 

    end

    context 'When locked by another user' do
      let(:other_user) { create(:alchemy_dummy_user, :as_admin, name: "Sue Smith") }

      it "shows the name of the user who locked the page" 

    end
  end

  describe 'Sites widget' do
    context 'with multiple sites' do
      let!(:default_site) { create(:alchemy_site, :default) }
      let!(:another_site) { create(:alchemy_site, name: 'Site', host: 'site.com') }

      it "lists all sites" 


      context 'with alchemy url proxy object having `login_url`' do
        before do
          allow_any_instance_of(ActionDispatch::Routing::RoutesProxy).to receive(:login_url).and_return('http://site.com/admin/login')
        end

        it "links to login page of every site" 

      end
    end

    context 'with only one site' do
      it "does not display" 

    end
  end
end

