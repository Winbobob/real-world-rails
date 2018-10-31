require 'rails_helper'

describe TopicsController do
  before do
    TopicUser.stubs(:track_visit!)
  end

  let :topic do
    Fabricate(:post).topic
  end

  def set_referer(ref)
    request.env['HTTP_REFERER'] = ref
  end

  def set_accept_language(locale)
    request.env['HTTP_ACCEPT_LANGUAGE'] = locale
  end

  describe "themes" do
    let :theme do
      Theme.create!(user_id: -1, name: 'bob', user_selectable: true)
    end

    let :theme2 do
      Theme.create!(user_id: -1, name: 'bobbob', user_selectable: true)
    end

    it "selects the theme the user has selected" 


    it "can be overridden with a cookie" 


    it "cookie can fail back to user if out of sync" 

  end

  it "doesn't store an incoming link when there's no referer" 


  it "doesn't raise an error on a very long link" 


  describe "has_escaped_fragment?" do
    render_views

    context "when the SiteSetting is disabled" do

      it "uses the application layout even with an escaped fragment param" 


    end

    context "when the SiteSetting is enabled" do
      before do
        SiteSetting.enable_escaped_fragments = true
      end

      it "uses the application layout when there's no param" 


      it "uses the crawler layout when there's an _escaped_fragment_ param" 

    end
  end

  describe "print" do
    render_views

    context "when the SiteSetting is enabled" do
      it "uses the application layout when there's no param" 


      it "uses the crawler layout when there's an print param" 

    end
  end

  describe 'clear_notifications' do
    it 'correctly clears notifications if specified via cookie' 


    it 'correctly clears notifications if specified via header' 

  end

  describe "set_locale" do
    context "allow_user_locale disabled" do
      context "accept-language header differs from default locale" do
        before do
          SiteSetting.allow_user_locale = false
          SiteSetting.default_locale = "en"
          set_accept_language("fr")
        end

        context "with an anonymous user" do
          it "uses the default locale" 

        end

        context "with a logged in user" do
          it "it uses the default locale" 

        end
      end
    end

    context "set_locale_from_accept_language_header enabled" do
      context "accept-language header differs from default locale" do
        before do
          SiteSetting.allow_user_locale = true
          SiteSetting.set_locale_from_accept_language_header = true
          SiteSetting.default_locale = "en"
          set_accept_language("fr")
        end

        context "with an anonymous user" do
          it "uses the locale from the headers" 

        end

        context "with a logged in user" do
          it "uses the user's preferred locale" 

        end
      end

      context "the preferred locale includes a region" do
        it "returns the locale and region separated by an underscore" 

      end

      context 'accept-language header is not set' do
        it 'uses the site default locale' 

      end
    end
  end

  describe "read only header" do
    it "returns no read only header by default" 


    it "returns a readonly header if the site is read only" 

  end
end

describe 'api' do

  before do
    ActionController::Base.allow_forgery_protection = true
  end

  after do
    ActionController::Base.allow_forgery_protection = false
  end

  describe PostsController do
    let(:user) do
      Fabricate(:user)
    end

    let(:post) do
      Fabricate(:post)
    end

    let(:api_key) { user.generate_api_key(user) }
    let(:master_key) { ApiKey.create_master_key }

    # choosing an arbitrarily easy to mock trusted activity
    it 'allows users with api key to bookmark posts' 


    it 'raises an error with a user key that does not match an optionally specified username' 


    it 'allows users with a master api key to bookmark posts' 


    it 'disallows phonies to bookmark posts' 


    it 'disallows blank api' 

  end
end

