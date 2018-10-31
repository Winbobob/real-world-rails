require 'rails_helper'

RSpec.describe SitemapController do
  describe 'GET #index' do
    let(:static_pages_urls) {
      [root_url, about_url, faq_url, login_url, signup_url]
    }
    let(:course) { double('Course') }

    before do
      allow(Course).to receive(:all).and_return([course])
    end

    it 'renders the sitemap template' 


    it 'assigns @static_pages' 


    it 'assigns @courses' 

  end
end

