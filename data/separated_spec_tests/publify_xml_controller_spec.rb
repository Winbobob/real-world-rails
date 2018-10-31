require 'rails_helper'

RSpec.describe XmlController, type: :controller do
  before do
    create(:blog, base_url: 'http://myblog.net')
    allow(Trigger).to receive(:fire) {}
  end

  describe '#sitemap' do
    render_views
    before do
      tag = create(:tag)
      article = create :article
      article.tags = [tag]
      get :sitemap, format: :googlesitemap
    end

    it 'is succesful' 


    it 'returns a valid XML response' 

  end
end

