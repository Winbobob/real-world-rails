# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe PublicBodyController, "when showing a body" do
  render_views

  before(:each) do
    load_raw_emails_data
    get_fixtures_xapian_index
  end

  it "should be successful" 


  it "should render with 'show' template" 


  it "should assign the body" 


  it "should assign the requests (1)" 


  it "should assign the requests (2)" 


  it "should assign the requests (3)" 


  it "should display the body using same locale as that used in url_name" 


  it 'should show public body names in the selected locale language if present for a locale with underscores' 


  it "should redirect use to the relevant locale even when url_name is for a different locale" 


  it "should redirect to newest name if you use historic name of public body in URL" 


  it "should redirect to lower case name if you use mixed case name in URL" 


  it 'keeps the search_params flash' 



  it 'should not show high page offsets as these are extremely slow to generate' 


  it 'should not raise an error when given an empty query param' 

end

describe PublicBodyController, "when listing bodies" do
  render_views

  it "should be successful" 


  def make_single_language_example(locale)
    result = nil
    with_default_locale(locale) do
      AlaveteliLocalization.with_locale(locale) do
        case locale
        when :en
          result = PublicBody.new(:name => 'English only',
                                  :short_name => 'EO')
        when :es
          result = PublicBody.new(:name => 'Español Solamente',
                                  :short_name => 'ES')
        when :en_GB
          result = PublicBody.new(:name => 'GB English',
                                  :short_name => 'GB')
        else
          raise StandardError.new "Unknown locale #{locale}"
        end
        result.request_email = "#{locale}@example.org"
        result.last_edit_editor = 'test'
        result.last_edit_comment = ''
        result.save
      end
    end
    result
  end

  it "with no fallback, should only return bodies from the current locale" 


  it "if fallback is requested, should list all bodies from default locale, even when there are no translations for selected locale" 


  it 'if fallback is requested, should still list public bodies only with translations in the current locale' 


  it "if fallback is requested, make sure that there are no duplicates listed" 


  it 'should show public body names in the selected locale language if present' 


  it 'show public body names of the selected underscore locale language' 


  it 'should not show the internal admin authority' 


  it 'should order on the translated name, even with the fallback' 


  it 'should show public body names in the selected locale language if present for a locale with underscores' 



  it "should list bodies in alphabetical order" 


  it 'list bodies in collate order according to the locale with the fallback set' 


  it 'list bodies in default order according to the locale with the fallback set' 


  it 'list bodies in collate order according to the locale' 


  it 'list bodies in alphabetical order according to the locale' 


  it "should support simple searching of bodies by title" 


  it "should support simple searching of bodies by short_name" 


  it "should support simple searching of bodies by notes" 


  it "should list bodies in alphabetical order with different locale" 


  it "should list a tagged thing on the appropriate list page, and others on the other page,
        and all still on the all page" do
    PublicBodyCategory.destroy_all
    PublicBodyHeading.destroy_all
    PublicBodyCategoryLink.destroy_all

    category = FactoryGirl.create(:public_body_category)
    heading = FactoryGirl.create(:public_body_heading)
    PublicBodyCategoryLink.create(:public_body_heading_id => heading.id,
                                  :public_body_category_id => category.id)
    public_bodies(:humpadink_public_body).tag_string = category.category_tag

    get :list, :tag => category.category_tag
    expect(response).to render_template('list')
    expect(assigns[:public_bodies]).to eq([ public_bodies(:humpadink_public_body) ])
    expect(assigns[:tag]).to eq(category.category_tag)
    expect(assigns[:description]).
      to eq("Found 1 public authority in the category ‘#{category.title}’")

    get :list, :tag => "other"
    expect(response).to render_template('list')
    expect(assigns[:public_bodies]).to eq([ public_bodies(:other_public_body),
                                        public_bodies(:forlorn_public_body),
                                        public_bodies(:geraldine_public_body),
                                        public_bodies(:sensible_walks_public_body),
                                        public_bodies(:silly_walks_public_body) ])

    get :list
    expect(response).to render_template('list')
    expect(assigns[:public_bodies]).to eq([ public_bodies(:other_public_body),
                                        public_bodies(:humpadink_public_body),
                                        public_bodies(:forlorn_public_body),
                                        public_bodies(:geraldine_public_body),
                                        public_bodies(:sensible_walks_public_body),
                                        public_bodies(:silly_walks_public_body) ])
  end

  it "should list a machine tagged thing, should get it in both ways" 


  it 'should not include hidden requests in the request count' 


  it 'raises an UnknownFormat error if asked for a json version of a list' 


  it "should list authorities starting with a multibyte first letter" 


end

describe PublicBodyController, "when showing JSON version for API" do

  it "should be successful" 


end

describe PublicBodyController, "when asked to export public bodies as CSV" do

  it "should return a valid CSV file with the right number of rows" 


  it "only includes visible bodies" 


  it "does not include site_administration bodies" 


end

describe PublicBodyController, "when doing type ahead searches" do
  render_views

  before(:each) do
    load_raw_emails_data
    get_fixtures_xapian_index
  end

  it 'renders the search_ahead template' 


  it 'assigns the xapian search to the view as xapian_requests' 


  it "shows the number of bodies matching the keywords" 


  it 'remembers the search params' 


end

