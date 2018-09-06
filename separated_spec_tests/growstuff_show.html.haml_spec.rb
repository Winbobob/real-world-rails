require 'rails_helper'

describe "posts/show" do
  subject { rendered }
  let(:author) { FactoryBot.create(:member) }

  before(:each) do
    controller.stub(:current_user) { nil }
    assign(:post, post)
  end

  describe 'render post' do
    before { render }
    describe "basic post" do
      let(:post) { FactoryBot.create(:post, author: author) }

      # show the name of the member who posted the post
      it { is_expected.to match(/member\d+/) }
      # Subject goes in title
      it { is_expected.to have_text('This is some text.') }
      # shouldn't show the subject on a single post page
      # (it appears in the title/h1 via the layout, not via this view)
      it { is_expected.not_to have_text('An Update') }
    end

    describe "should parse markdown into html" do
      let(:post) { FactoryBot.create(:markdown_post, author: author) }

      it { assert_select "strong", "strong" }
    end

    describe "shouldn't let html through in body" do
      let(:post) { FactoryBot.create(:post, author: author, body: '<a href="http://evil.com">EVIL</a>') }

      it { is_expected.to have_content('EVIL') }
      it { is_expected.not_to have_link("http://evil.com") }
    end
    describe 'script tag in post body' do
      let(:post) { FactoryBot.create(:post, author: author, body: "<script>alert('hakker!')</script>") }

      it { is_expected.not_to have_selector('script') }
    end
    describe 'script tag in post title' do
      let(:post) { FactoryBot.create(:post, author: author, subject: "<script>alert('hakker!')</script>") }

      it { is_expected.not_to have_selector('script') }
    end

    describe 'has an anchor to the comments' do
      let(:post) { FactoryBot.create(:post, author: author) }

      it { is_expected.to have_selector('a[name=comments]') }
    end
  end

  context "when there is one comment" do
    let(:post) { FactoryBot.create(:html_post, author: author) }
    let!(:comment) { FactoryBot.create(:comment, post: post) }

    before(:each) do
      @comments = post.comments
      render
    end

    it 'shows comment count only 1' 


    it "shows comments" 


    it 'has an anchor to the comments' 

  end

  context "when there is more than one comment" do
    let(:post) { FactoryBot.create(:html_post, author: author) }

    before(:each) do
      @comment1 = FactoryBot.create(:comment, post: post, body: "F1rst!!!",
                                              created_at: Date.new(2010, 5, 17))
      @comment3 = FactoryBot.create(:comment, post: post, body: "Th1rd!!!",
                                              created_at: Date.new(2012, 5, 17))
      @comment4 = FactoryBot.create(:comment, post: post, body: "F0urth!!!")
      @comment2 = FactoryBot.create(:comment, post: post, body: "S3c0nd!!1!",
                                              created_at: Date.new(2011, 5, 17))
      @comments = post.comments
      render
    end

    it "shows the oldest comments first" 

  end

  context "forum post" do
    let(:post) { FactoryBot.create(:forum_post, author: author) }

    before { render }
    it "shows forum name" 

  end

  context "signed in" do
    let(:post) { FactoryBot.create(:post, author: author) }

    before(:each) do
      sign_in author
      controller.stub(:current_user) { author }
      render
    end

    it 'shows a comment button' 

  end
end
