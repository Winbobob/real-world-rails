# frozen_string_literal: true

require 'rails_helper'

RSpec.describe XmlController, type: :controller do
  before do
    create(:blog, base_url: 'http://myblog.net')
  end

  describe '#sitemap' do
    let(:article) { create :article }
    let(:tag) { create :tag }

    before do
      article.tags = [tag]
      get :sitemap, format: :googlesitemap
    end

    it 'is succesful' 


    it 'includes articles and tags as items' 

  end
end

