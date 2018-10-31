# encoding: utf-8

require 'rails_helper'
require_dependency 'search'

describe Search do

  class TextHelper
    extend ActionView::Helpers::TextHelper
  end

  before do
    SearchIndexer.enable
  end

  context 'post indexing observer' do
    before do
      @category = Fabricate(:category, name: 'america')
      @topic = Fabricate(:topic, title: 'sam saffron test topic', category: @category)
      @post = Fabricate(:post, topic: @topic, raw: 'this <b>fun test</b> <img src="bla" title="my image">')
      @indexed = @post.post_search_data.search_data
    end

    it "should index correctly" 

  end

  context 'user indexing observer' do
    before do
      @user = Fabricate(:user, username: 'fred', name: 'bob jones')
      @indexed = @user.user_search_data.search_data
    end

    it "should pick up on data" 

  end

  context 'category indexing observer' do
    before do
      @category = Fabricate(:category, name: 'america')
      @indexed = @category.category_search_data.search_data
    end

    it "should pick up on name" 


  end

  it 'strips zero-width characters from search terms' 


  it 'replaces curly quotes to regular quotes in search terms' 


  it 'does not search when the search term is too small' 


  it 'needs at least one term that hits the length' 


  it 'searches for quoted short terms' 


  it 'searches for short terms if one hits the length' 


  it 'escapes non alphanumeric characters' 


  it "doesn't raise an error when single quotes are present" 


  it 'works when given two terms with spaces' 


  context 'users' do
    let!(:user) { Fabricate(:user) }
    let(:result) { Search.execute('bruce', type_filter: 'user') }

    it 'returns a result' 


    context 'hiding user profiles' do
      before { SiteSetting.hide_user_profiles_from_public = true }

      it 'returns no result for anon' 


      it 'returns a result for logged in users' 


    end

  end

  context 'inactive users' do
    let!(:inactive_user) { Fabricate(:inactive_user, active: false) }
    let(:result) { Search.execute('bruce') }

    it 'does not return a result' 

  end

  context 'staged users' do
    let(:staged) { Fabricate(:staged) }
    let(:result) { Search.execute(staged.username) }

    it 'does not return a result' 

  end

  context 'private messages' do

    let(:topic) {
      Fabricate(:topic,
                  category_id: nil,
                  archetype: 'private_message')
    }

    let(:post) { Fabricate(:post, topic: topic) }
    let(:reply) { Fabricate(:post, topic: topic,
                                   raw: 'hello from mars, we just landed') }

    it 'searches correctly' 


  end

  context 'topics' do
    let(:post) { Fabricate(:post) }
    let(:topic) { post.topic }

    context 'search within topic' do

      def new_post(raw, topic)
        Fabricate(:post, topic: topic, topic_id: topic.id, user: topic.user, raw: raw)
      end

      it 'displays multiple results within a topic' 


      it "works for unlisted topics" 

    end

    context 'searching the OP' do
      let!(:post) { Fabricate(:post_with_long_raw_content) }
      let(:result) { Search.execute('hundred', type_filter: 'topic', include_blurbs: true) }

      it 'returns a result correctly' 

    end

    context 'searching for a post' do
      let!(:reply) { Fabricate(:basic_reply, topic: topic, user: topic.user) }
      let(:result) { Search.execute('quotes', type_filter: 'topic', include_blurbs: true) }

      it 'returns the post' 

    end

    context 'searching for quoted title' do
      it "can find quoted title" 


    end

    context "search for a topic by id" do
      let(:result) { Search.execute(topic.id, type_filter: 'topic', search_for_id: true, min_search_term_length: 1) }

      it 'returns the topic' 

    end

    context "search for a topic by url" do
      let(:result) { Search.execute(topic.relative_url, search_for_id: true, type_filter: 'topic') }

      it 'returns the topic' 

    end

    context 'security' do

      def result(current_user)
        Search.execute('hello', guardian: Guardian.new(current_user))
      end

      it 'secures results correctly' 

    end

  end

  context 'cyrillic topic' do
    let!(:cyrillic_topic) { Fabricate(:topic) do
                              user
                                                title { sequence(:title) { |i| "Тестовая запись #{i}" } }
                            end
    }
    let!(:post) { Fabricate(:post, topic: cyrillic_topic, user: cyrillic_topic.user) }
    let(:result) { Search.execute('запись') }

    it 'finds something when given cyrillic query' 

  end

  it 'does not tokenize search term' 


  context 'categories' do

    let!(:category) { Fabricate(:category) }
    def search
      Search.execute(category.name)
    end

    it 'returns the correct result' 


  end

  context 'tags' do
    def search
      Search.execute(tag.name)
    end

    let!(:tag) { Fabricate(:tag) }
    let!(:uppercase_tag) { Fabricate(:tag, name: "HeLlO") }
    let(:tag_group) { Fabricate(:tag_group) }
    let(:category) { Fabricate(:category) }

    context 'post searching' do
      it 'can find posts with tags' 

    end

    context 'tagging is disabled' do
      before { SiteSetting.tagging_enabled = false }

      it 'does not include tags' 

    end

    context 'tagging is enabled' do
      before { SiteSetting.tagging_enabled = true }

      it 'returns the tag in the result' 


      it 'shows staff tags' 


      it 'includes category-restricted tags' 

    end
  end

  context 'type_filter' do

    let!(:user) { Fabricate(:user, username: 'amazing', email: 'amazing@amazing.com') }
    let!(:category) { Fabricate(:category, name: 'amazing category', user: user) }

    context 'user filter' do
      let(:results) { Search.execute('amazing', type_filter: 'user') }

      it "returns a user result" 


    end

    context 'category filter' do
      let(:results) { Search.execute('amazing', type_filter: 'category') }

      it "returns a category result" 


    end

  end

  context 'search_context' do

    it 'can find a user when using search context' 


    it 'can use category as a search context' 


  end

  describe 'Chinese search' do
    let(:sentence) { 'Discourse中国的基础设施网络正在组装' }
    let(:sentence_t) { 'Discourse太平山森林遊樂區' }

    it 'splits English / Chinese and filter out stop words' 


    it 'splits for indexing and filter out stop words' 


    it 'splits English / Traditional Chinese and filter out stop words' 


    it 'splits for indexing and filter out stop words' 


    it 'finds chinese topic based on title' 


    it 'finds chinese topic based on title if tokenization is forced' 

  end

  describe 'Advanced search' do

    it 'supports pinned and unpinned' 


    it 'supports wiki' 


    it 'supports searching for posts that the user has seen/unseen' 


    it 'supports before and after, in:first, user:, @username' 


    it 'supports group' 


    it 'supports badge' 


    it 'can search numbers correctly, and match exact phrases' 


    it 'can find by status' 


    it 'can find posts with images' 


    it 'can find by latest' 


    it 'can order by topic creation' 


    it 'can tokenize dots' 


    it 'can tokanize website names correctly' 


    it 'supports category slug and tags' 


    it 'correctly handles #symbol when no tag or category match' 


    context 'tags' do
      let(:tag1) { Fabricate(:tag, name: 'lunch') }
      let(:tag2) { Fabricate(:tag, name: 'eggs') }
      let(:tag3) { Fabricate(:tag, name: 'sandwiches') }
      let(:topic1) { Fabricate(:topic, tags: [tag2, Fabricate(:tag)]) }
      let(:topic2) { Fabricate(:topic, tags: [tag2]) }
      let(:topic3) { Fabricate(:topic, tags: [tag1, tag2]) }
      let(:topic4) { Fabricate(:topic, tags: [tag1, tag2, tag3]) }
      let(:topic5) { Fabricate(:topic, tags: [tag2, tag3]) }
      let!(:post1) { Fabricate(:post, topic: topic1) }
      let!(:post2) { Fabricate(:post, topic: topic2) }
      let!(:post3) { Fabricate(:post, topic: topic3) }
      let!(:post4) { Fabricate(:post, topic: topic4) }
      let!(:post5) { Fabricate(:post, topic: topic5) }

      it 'can find posts with tag' 


      it 'can find posts with non-latin tag' 


      it 'can find posts with any tag from multiple tags' 


      it 'can find posts which contains all provided tags' 


      it 'can find posts which contains provided tags and does not contain selected ones' 


      it 'orders posts correctly when combining tags with categories or terms' 


    end

    it "can find posts which contains filetypes" 

  end

  it 'can parse complex strings using ts_query helper' 


  context '#word_to_date' do
    it 'parses relative dates correctly' 


    it 'parses absolute dates correctly' 

  end

  context "#min_post_id" do
    it "returns 0 when prefer_recent_posts is disabled" 


    it "returns a value when prefer_recent_posts is enabled" 

  end

  context "search_log_id" do
    it "returns an id when the search succeeds" 


    it "does not log search if search_type is not present" 

  end

  context 'in:title' do
    it 'allows for search in title' 

  end

  context 'ignore_diacritics' do
    before { SiteSetting.search_ignore_accents = true }
    let!(:post1) { Fabricate(:post, raw: 'สวัสดี Rágis hello') }

    it ('allows strips correctly') do
      results = Search.execute('hello', type_filter: 'topic')
      expect(results.posts.length).to eq(1)

      results = Search.execute('ragis', type_filter: 'topic')
      expect(results.posts.length).to eq(1)

      results = Search.execute('Rágis', type_filter: 'topic', include_blurbs: true)
      expect(results.posts.length).to eq(1)

      # TODO: this is a test we need to fix!
      #expect(results.blurb(results.posts.first)).to include('Rágis')

      results = Search.execute('สวัสดี', type_filter: 'topic')
      expect(results.posts.length).to eq(1)
    end
  end

  context 'include_diacritics' do
    before { SiteSetting.search_ignore_accents = false }
    let!(:post1) { Fabricate(:post, raw: 'สวัสดี Régis hello') }

    it ('allows strips correctly') do
      results = Search.execute('hello', type_filter: 'topic')
      expect(results.posts.length).to eq(1)

      results = Search.execute('regis', type_filter: 'topic')
      expect(results.posts.length).to eq(0)

      results = Search.execute('Régis', type_filter: 'topic', include_blurbs: true)
      expect(results.posts.length).to eq(1)

      expect(results.blurb(results.posts.first)).to include('Régis')

      results = Search.execute('สวัสดี', type_filter: 'topic')
      expect(results.posts.length).to eq(1)
    end
  end

  context 'pagination' do
    let(:number_of_results) { 2 }
    let!(:post1) { Fabricate(:post, raw: 'hello hello hello hello hello') }
    let!(:post2) { Fabricate(:post, raw: 'hello hello hello hello') }
    let!(:post3) { Fabricate(:post, raw: 'hello hello hello') }
    let!(:post4) { Fabricate(:post, raw: 'hello hello') }
    let!(:post5) { Fabricate(:post, raw: 'hello') }
    before do
      Search.stubs(:per_filter).returns(number_of_results)
    end

    it 'returns more results flag' 


    it 'correctly search with page parameter' 


  end

end

