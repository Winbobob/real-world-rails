require "spec_helper"

describe 'CMS' do

  before :all do
    # We use 'about' so we can test routes and canonical URLs i.e. /about
    # If 'about' is generated in a previous spec then specs in this file may fail e.g. if @content_page_about.active is false
    unless @content_page_about = ContentPage.find_by_page_name("about", include: :translations)
      load_foundation_cache
      @content_page_about = ContentPage.gen(active: true, page_name: "about")
      TranslatedContentPage.gen(content_page: @content_page_about, active_translation: true)
    end
  end

  describe 'page' do
    it 'should provide a consistent canonical URL' 


    it 'should not have rel prev or next link tags' 


    it 'should use meta description and keyword fields' 

  end
end

