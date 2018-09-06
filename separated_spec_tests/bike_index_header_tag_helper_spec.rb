require 'spec_helper'

describe HeaderTagHelper do
  before do
    allow(view).to receive(:controller_name) { controller_name }
    allow(view).to receive(:action_name) { action_name }
    allow(view).to receive(:request_url) { '' }
    # These two methods are defined in application controller
    allow(view).to receive(:controller_namespace) { controller_namespace }
    allow(view).to receive(:page_id) { [controller_namespace, controller_name, action_name].compact.join('_') }
  end
  let(:controller_namespace) { nil }

  describe 'header_tags' do
    %w(bikes welcome news users landing_pages).each do |controller_name|
      context controller_name do
        let(:controller_name) { controller_name }
        it 'calls special_controller name' 

      end
    end
    context 'non-special controller' do
      let(:controller_name) { 'standard_names' }
      it 'returns default' 

    end
  end

  describe 'page_title=' do
    it 'sets page_title with strip_tags' 

  end

  describe 'page_description=' do
    it 'sets page_description with strip_tags' 

  end

  describe 'auto_title' do
    context 'Assigned title from translation (users new)' do
      let(:controller_name) { 'users' }
      let(:action_name) { 'new' }
      it 'returns the translation title' 

    end
    context 'rendering from controller and action name' do
      let(:controller_name) { 'cool_things' }
      context 'index action' do
        let(:action_name) { 'index' }
        it 'returns the humanized, titleized controller_name' 

      end
      context 'new' do
        let(:action_name) { 'new' }
        it 'returns compiled title' 

      end
      context 'edit' do
        let(:action_name) { 'edit' }
        it 'returns compiled title' 

      end
      context 'show' do
        let(:action_name) { 'show' }
        it 'returns compiled title' 

      end
      context 'create' do
        let(:action_name) { 'create' }
        it 'returns compiled title' 

      end
    end
    context 'unknown action_name' do
      let(:controller_name) { 'organizations' }
      let(:action_name) { 'lightspeed_integration' }
      it 'returns the weird action name humanized' 

    end
    context 'admin namespace' do
      let(:controller_namespace) { 'admin' }
      describe 'bikes' do
        let(:controller_name) { 'bikes' }
        let(:action_name) { 'index' }
        it 'returns prepended title' 

      end
    end
    context 'organized namespace' do
      let(:controller_namespace) { 'organized' }
      let(:organization) { FactoryGirl.build(:organization, short_name: 'Sweet Bike Org') }
      before do
        allow(view).to receive(:current_organization) { organization }
      end
      describe 'bikes' do
        let(:controller_name) { 'bikes' }
        let(:action_name) { 'index' }
        it 'returns title prepended with org name' 

      end
    end
  end

  describe 'auto_description' do
    context 'existing meta description translation' do
      let(:controller_name) { 'manufacturers' }
      let(:action_name) { 'index' }
      let(:target) { 'Bicycle related manufacturers listed on Bike Index - all the brands you know and then some.' }
      it 'returns the translation' 

    end
    context 'no translation present' do
      let(:controller_name) { 'weird_things' }
      let(:action_name) { 'index' }
      let(:target) { 'The best bike registry: Simple, secure and free.' }
      it 'returns the default title' 

    end
  end

  describe 'social_meta_tags' do
    let(:meta_keys) do
      ['og:description', 'twitter:description', 'og:title', 'twitter:title', 'og:url', 'og:image',
       'og:site_name', 'twitter:card', 'fb:app_id', 'twitter:creator', 'twitter:site']
    end
    describe 'default_social_meta_hash' do
      let(:title_keys) { ['og:title', 'twitter:title'] }
      let(:description_keys) { ['og:description', 'twitter:description'] }
      let(:title) { 'SWeet TITLE bro' }
      let(:description) { 'A description that is just the right thing for everyone' }
      context 'passed description and title' do
        it 'uses passed title and description' 

      end
      context 'no description or title passed' do
        it 'uses auto_title and auto_description' 

      end
    end
    describe 'meta_hash_html_tags' do
      it 'returns content_tags_for each one' 

    end
  end

  describe 'main_header_tags' do
    let(:title) { 'A really, really sweet title' }
    let(:description) { 'Some lame description' }
    let(:target) do
      [
        '<meta charset="utf-8" />',
        '<meta http-equiv="Content-Language" content="en" />',
        '<meta http-equiv="X-UA-Compatible" content="IE=edge" />',
        '<meta name="viewport" content="width=device-width" />',
        "<title>#{title}</title>",
        "<meta name=\"description\" content=\"#{description}\" />",
        '<link rel="shortcut icon" href="/fav.ico" />',
        '<link rel="apple-touch-icon-precomposed apple-touch-icon" href="/apple_touch_icon.png" />',
        nil # csrf_meta_tags is nil in test
      ]
    end
    it 'returns main tags' 

  end

  describe 'landing_pages_header_tags' do
    let(:controller_name) { 'landing_pages' }
    context 'show (organization landing page)' do
      let(:action_name) { 'show' }
      let(:organization) { FactoryGirl.build(:organization, name: 'Sweet University') }
      it 'sets the page title' 

    end
  end

  describe 'welcome_header_tags' do
    context 'user_home' do
      let(:action_name) { 'user_home' }
      context 'nil current_user name' do
        it 'sets the page title' 

      end
      context 'current_user name' do
        let(:user) { FactoryGirl.build(:user, name: 'John') }
        it 'sets the page title' 

      end
    end
    context 'choose_registration' do
      let(:action_name) { 'choose_registration' }
      it 'sets the page title' 

    end
  end

  describe 'users_header_tags' do
    let(:avatar) { AvatarUploader.new }
    let(:controller_name) { 'users' }
    let(:action_name) { 'show' }
    context 'with user title, and avatar' do
      let(:user) { FactoryGirl.build(:user, name: 'John', title: "John's bikes") }
      it 'returns the user avatar, title and titled description' 

    end
    context 'with no user title and blank avatar' do
      let(:user) { FactoryGirl.build(:user, name: 'John') }
      it 'has default image and a title' 

    end
  end

  describe 'bikes_header_tags' do
    let(:bike) { Bike.new(stolen: true) }
    context 'new stolen bike' do
      let(:user) { FactoryGirl.build(:user) }
      it 'says new stolen on new stolen' 

    end
    describe 'show' do
      let(:action_name) { 'show' }
      before { allow(bike).to receive(:title_string) { 'Something special 1969' } }
      context 'default' do
        it 'returns the bike name on Show' 

      end
      context 'twitter present and shown' do
        it 'has twitter creator if present and shown' 

      end
      context 'twitter present and not shown' do
        it "doesn't include twitter creator" 

      end
    end
  end

  describe 'news_header_tags' do
    let(:controller_name) { 'news' }
    let(:auto_discovery_tag) { '<link rel="alternate" type="application/atom+xml" title="Bike Index news atom feed" href="http://test.host/news.atom" />' }
    describe 'index' do
      let(:action_name) { 'index' }
      it 'adds auto_discovery_link' 

    end
    describe 'show' do
      let(:action_name) { 'show' }
      let(:target_time) { (Time.now - 1.hour).utc }
      # Have to create user so it creates a path for the user
      let(:user) { FactoryGirl.create(:user, name: 'John', twitter: 'stolenbikereg') }
      let(:blog) do
        FactoryGirl.build(:blog,
                          title: 'Cool blog',
                          description_abbr: 'Bike Index did something cool',
                          published_at: target_time,
                          updated_at: target_time,
                          user: user)
      end
      let(:target_url) { 'http://something.com' }
      context 'index image present' do
        it 'adds the index image and the tags we want' 

      end
      context 'public_image present' do
        let(:public_image) { PublicImage.new }
        it 'adds the public image we want' 

      end
    end
  end
end

