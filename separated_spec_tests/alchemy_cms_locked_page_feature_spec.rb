# frozen_string_literal: true

require 'spec_helper'

describe 'Locked pages feature' do
  let(:a_page) { create(:alchemy_page) }

  let(:user) do
    create(:alchemy_dummy_user, :as_author)
  end

  before do
    a_page.lock_to!(user)
    authorize_user(user)
  end

  it 'displays tab for each locked page' 


  context 'with multiple languages' do
    let!(:language) do
      create(:alchemy_language, :klingon)
    end

    it 'displays information for language' 

  end

  context 'with multiple sites' do
    let!(:site) do
      create(:alchemy_site, host: 'another-site.com')
    end

    it 'displays information for site' 

  end
end

