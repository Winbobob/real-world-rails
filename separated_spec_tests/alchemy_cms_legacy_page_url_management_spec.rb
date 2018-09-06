# frozen_string_literal: true

require 'spec_helper'

describe 'Legacy page url management', type: :feature, js: true do
  before do
    authorize_user(:as_admin)
  end

  let!(:a_page) { create(:alchemy_page) }

  def open_page_properties
    visit admin_pages_path
    page.find("a[href='#{configure_admin_page_path(a_page)}']").click
  end

  it "lets a user add a page link" 


  context 'with wrong url format' do
    it "displays error message" 

  end

  context 'with legacy page url present' do
    before do
      a_page.legacy_urls.create!(urlname: 'a-page-link')
      open_page_properties
      click_link '(1) Link'
    end

    it "lets a user remove a page link" 

  end
end

