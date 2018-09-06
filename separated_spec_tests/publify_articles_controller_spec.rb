require 'rails_helper'

describe ArticlesController, 'base', type: :controller do
  let!(:blog) { create(:blog) }
  let!(:user) { create :user }

  describe 'tag' do
    before(:each) { get :tag }
    it { expect(response).to redirect_to(tags_path) }
  end

  describe 'index' do
    let!(:article) { create(:article) }
    let!(:note) { create(:note) }
    before(:each) { get :index }

    it { expect(response).to render_template(:index) }
    it { expect(assigns[:articles]).to_not be_empty }

    context 'with the view rendered' do
      render_views

      it 'should have good link feed rss' 


      it 'should have good link feed atom' 


      it 'should have a canonical url' 


      it 'should have good title' 

    end
  end

  describe '#search action' do
    before(:each) do
      create(:article, body: "in markdown format\n\n * we\n * use\n [ok](http://blog.ok.com) to define a link", text_filter: create(:markdown))
      create(:article, body: 'xyz')
    end

    describe 'a valid search' do
      before(:each) { get :search, params: { q: 'a' } }

      it { expect(response).to render_template(:search) }
      it { expect(assigns[:articles]).to_not be_nil }

      context 'with the view rendered' do
        render_views
        it 'should have good feed rss link' 


        it 'should have good feed atom link' 


        it 'should have a canonical url' 


        it 'should have a good title' 


        it 'should have content markdown interpret and without html tag' 

      end
    end

    it 'should render feed rss by search' 


    it 'should render feed atom by search' 


    it 'search with empty result' 

  end

  describe '#livesearch action' do
    describe 'with a query with several words' do
      before(:each) do
        create(:article, body: 'hello world and im herer')
        create(:article, title: 'hello', body: 'worldwide')
        create(:article)
        get :live_search, params: { q: 'hello world' }
      end

      it 'should be valid' 


      it 'should render without layout' 


      it 'should render template live_search' 


      context 'with the view rendered' do
        render_views
        it 'should not have h3 tag' 

      end

      it 'should assign @search the search string' 

    end
  end

  describe '#archives' do
    context 'for an archive with several articles' do
      let!(:articles) { create_list :article, 3 }

      before do
        get 'archives'
      end

      it 'renders the correct template' 


      it 'assigns the articles' 


      context 'when rendering' do
        render_views

        it 'has the correct self-link and title' 


        it 'shows the current month only once' 

      end
    end

    context 'for an archive with an article with tags' do
      render_views

      it 'renders correctly' 

    end
  end

  describe 'index for a month' do
    before(:each) do
      create(:article, published_at: Time.utc(2004, 4, 23))
      get 'index', params: { year: 2004, month: 4 }
    end

    it 'should render template index' 


    it 'should contain some articles' 


    context 'with the view rendered' do
      render_views
      it 'should have a canonical url' 


      it 'should have a good title' 

    end
  end
end

describe ArticlesController, 'nosettings', type: :controller do
  let!(:blog) { create(:blog, settings: {}) }

  it 'redirects to setup' 

end

describe ArticlesController, 'nousers', type: :controller do
  let!(:blog) { create(:blog) }

  it 'redirects to signup' 

end

describe ArticlesController, 'feeds', type: :controller do
  let!(:blog) { create(:blog) }

  let!(:article1) { create(:article, created_at: 1.day.ago) }
  let!(:article2) { create(:article, published_at: '2004-04-01 12:00:00') }

  let(:trackback) { create(:trackback, article: article1, published_at: 1.day.ago) }

  specify '/articles.atom => an atom feed' do
    get 'index', params: { format: 'atom' }
    expect(response).to be_success
    expect(response).to render_template('index_atom_feed', layout: false)
    expect(assigns(:articles)).to eq([article1, article2])
  end

  specify '/articles.rss => an RSS 2.0 feed' do
    get 'index', params: { format: 'rss' }
    expect(response).to be_success
    expect(response).to render_template('index_rss_feed', layout: false)
    expect(assigns(:articles)).to eq([article1, article2])
  end

  specify 'atom feed for archive should be valid' do
    get 'index', params: { year: 2004, month: 4, format: 'atom' }
    expect(response).to render_template('index_atom_feed', layout: false)
    expect(assigns(:articles)).to eq([article2])
  end

  specify 'RSS feed for archive should be valid' do
    get 'index', params: { year: 2004, month: 4, format: 'rss' }
    expect(response).to render_template('index_rss_feed', layout: false)
    expect(assigns(:articles)).to eq([article2])
  end
end

describe ArticlesController, 'the index', type: :controller do
  let!(:blog) { create(:blog) }

  before(:each) do
    create(:user, :as_admin)
    create(:article)
  end

  it 'should ignore the HTTP Accept: header' 

end

describe ArticlesController, 'previewing', type: :controller do
  let!(:blog) { create(:blog) }

  describe 'with non logged user' do
    before :each do
      get :preview, params: { id: create(:article).id }
    end

    it 'should redirect to login' 

  end

  describe 'with logged user' do
    let(:admin) { create(:user, :as_admin) }
    let(:article) { create(:article, user: admin) }

    before do
      sign_in admin
    end

    describe 'theme rendering' do
      render_views
      with_each_theme do |theme, view_path|
        it "should render template #{view_path}/articles/read" 

      end
    end

    it 'should assigns article define with id' 


    it 'should assigns last article with id like parent_id' 

  end
end

describe ArticlesController, 'redirecting', type: :controller do
  describe 'with explicit redirects' do
    describe 'with empty relative_url_root' do
      it 'should redirect from known URL' 


      it 'should not redirect from unknown URL' 

    end

    # FIXME: Due to the changes in Rails 3 (no relative_url_root), this
    # does not work anymore when the accessed URL does not match the blog's
    # base_url at least partly. Do we still want to allow acces to the blog
    # through non-standard URLs? What was the original purpose of these
    # redirects?
    describe 'and non-empty relative_url_root' do
      before do
        create(:blog, base_url: 'http://test.host/blog')
        create(:user)
      end

      it 'should redirect' 


      it 'should redirect if to_path includes relative_url_root' 


      it 'should ignore the blog base_url if the to_path is a full uri' 

    end
  end

  it 'should get good article with utf8 slug' 


  # NOTE: This is needed because Rails over-unescapes glob parameters.
  it 'should get good article with pre-escaped utf8 slug using unescaped slug' 


  describe 'accessing old-style URL with "articles" as the first part' do
    it 'should redirect to article without url_root' 


    it 'should redirect to article with url_root' 


    it 'should redirect to article with articles in url_root' 


    it 'should not redirect to an article from another blog'
  end

  describe 'with permalink_format like %title%.html' do
    let!(:blog) { create(:blog, permalink_format: '/%title%.html') }
    let!(:admin) { create(:user, :as_admin) }

    before do
      sign_in admin
    end

    context 'with an article' do
      let!(:article) { create(:article, permalink: 'second-blog-article', published_at: Time.utc(2004, 4, 1)) }

      context 'try redirect to an unknown location' do
        it 'raises RecordNotFound' 

      end

      describe 'accessing legacy URLs' do
        it 'should redirect from default URL format' 


        it 'should redirect from old-style URL format with "articles" part' 

      end
    end

    describe 'accessing an article' do
      let!(:article) { create(:article, permalink: 'second-blog-article', published_at: Time.utc(2004, 4, 1)) }
      before(:each) do
        get :redirect, params: { from: "#{article.permalink}.html" }
      end

      it 'should render template read to article' 


      it 'should assign article1 to @article' 


      describe 'the resulting page' do
        render_views

        it 'should have good rss feed link' 


        it 'should have good atom feed link' 


        it 'should have a canonical url' 


        it 'should have a good title' 

      end
    end

    # TODO: Move out of permalink config context
    describe 'theme rendering' do
      render_views

      let!(:article) { create(:article, permalink: 'second-blog-article', published_at: Time.utc(2004, 4, 1)) }

      with_each_theme do |theme, _view_path|
        context "for theme #{theme}" do
          before do
            blog.theme = theme
            blog.save!
          end

          it 'renders without errors when no comments or trackbacks are present' 


          it 'renders without errors when recaptcha is enabled' 


          it 'renders without errors when comments and trackbacks are present' 

        end
      end
    end

    describe 'rendering as atom feed' do
      let!(:article) { create(:article, permalink: 'second-blog-article', published_at: Time.utc(2004, 4, 1)) }
      let!(:trackback1) { create(:trackback, article: article, created_at: 1.day.ago) }

      before(:each) do
        get :redirect, params: { from: "#{article.permalink}.html.atom" }
      end

      it 'should render feedback atom feed for the article' 

    end

    describe 'rendering as rss feed' do
      let!(:article) { create(:article, permalink: 'second-blog-article', published_at: Time.utc(2004, 4, 1)) }
      let!(:trackback1) { create(:trackback, article: article, created_at: 1.day.ago) }

      before(:each) do
        get :redirect, params: { from: "#{article.permalink}.html.rss" }
      end

      it 'should render feedback rss feed for the article' 

    end
  end

  describe 'with a format containing a fixed component' do
    let!(:blog) { create(:blog, permalink_format: '/foo/%title%') }
    let!(:article) { create(:article) }

    it 'should find the article if the url matches all components' 


    it 'should not find the article if the url does not match the fixed component' 

  end
end

describe ArticlesController, 'password protected', type: :controller do
  render_views
  let!(:blog) { create(:blog, permalink_format: '/%title%.html') }
  let!(:article) { create(:article, password: 'password') }

  it 'article alone should be password protected' 


  describe '#check_password' do
    it 'shows article when given correct password' 


    it 'shows password form when given incorrect password' 

  end
end

describe ArticlesController, 'assigned keywords', type: :controller do
  before(:each) { create :user }

  context 'with default blog' do
    let!(:blog) { create(:blog) }

    it 'index without option and no blog keywords should not have meta keywords' 

  end

  context "with blog meta keywords to 'publify, is, amazing'" do
    let!(:blog) { create(:blog, meta_keywords: 'publify, is, amazing') }

    it 'index without option but with blog keywords should have meta keywords' 

  end

  context 'with blog permalin to /%title%.html' do
    let!(:blog) { create(:blog, permalink_format: '/%title%.html') }

    it 'article without tags should not have meta keywords' 

  end
end

describe ArticlesController, 'preview page', type: :controller do
  let!(:blog) { create(:blog) }

  describe 'with non logged user' do
    before :each do
      get :preview_page, params: { id: create(:article).id }
    end

    it 'should redirect to login' 

  end

  describe 'with logged user' do
    let!(:page) { create(:page) }

    before(:each) do
      admin = create(:user, :as_admin)
      sign_in admin
    end

    with_each_theme do |theme, view_path|
      it "should render template #{view_path}/articles/view_page" 

    end

    it 'should assigns article define with id' 

  end
end

