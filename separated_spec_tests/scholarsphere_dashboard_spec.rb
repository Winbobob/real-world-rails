# frozen_string_literal: true

require 'feature_spec_helper'

include Selectors::Dashboard

describe 'The Dashboard', type: :feature do
  let(:user) { create(:user) }

  describe 'a user who has files and collections' do
    let!(:work)         { create(:public_work, :with_one_file, depositor: user.user_key) }
    let!(:collection)   { create(:collection, depositor: user.user_key) }

    before do
      sign_in(user)
      go_to_dashboard
    end

    it "shows the user's statistics" 

  end

  describe 'a user without files and collections' do
    before do
      sign_in(user)
      go_to_dashboard
    end
    it 'displays information correctly' 

  end

  describe 'a user with multiple current proxies' do
    let!(:first_proxy)  { create(:first_proxy) }
    let!(:second_proxy) { create(:second_proxy) }

    before do
      sign_in_with_js(user)
      go_to_dashboard
      create_proxy_using_partial(first_proxy, second_proxy)
    end

    it 'lists each proxy if both are authorized' 

  end

  describe 'a user with transfers' do
    let(:another_user) { create(:jill) }

    context 'with no transfers' do
      before do
        sign_in(user)
        go_to_dashboard
      end

      it 'shows no transfers' 

    end

    context 'with one incoming' do
      let!(:incoming_file) { create(:file, depositor: another_user.user_key, transfer_to: user) }

      before do
        sign_in(user)
        go_to_dashboard
      end

      it 'displays received files' 

    end

    context 'with one outgoing' do
      let!(:outgoing_file) { create(:file, depositor: user.user_key, transfer_to: another_user) }

      before do
        sign_in(user)
        go_to_dashboard
      end

      it 'displays files sent to another user' 

    end
  end
end

